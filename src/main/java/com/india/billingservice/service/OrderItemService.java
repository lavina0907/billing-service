package com.india.billingservice.service;

import com.india.billingservice.enums.DiscountType;
import com.india.billingservice.model.Item;
import com.india.billingservice.model.Order;
import com.india.billingservice.model.OrderItem;
import com.india.billingservice.repository.ItemRepository;
import com.india.billingservice.repository.OrderItemRepository;
import com.india.billingservice.repository.ServiceRepository;
import com.india.billingservice.wrapper.OrderDetailWrapper;
import com.india.billingservice.wrapper.OrderItemDetailWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;
import java.util.Objects;

@Service
public class OrderItemService {
    @Autowired
    ItemRepository itemRepository;
    @Autowired
    ServiceRepository serviceRepository;
    @Autowired
    OrderItemRepository orderItemRepository;

    static BigDecimal getOrderItemTotalAmount(OrderItemDetailWrapper orderItemDetailWrapper, ItemRepository itemRepository, ServiceRepository serviceRepository) {
        Long itemId = orderItemDetailWrapper.getItemId();
        if (itemId != null) {
            Item item = itemRepository.findById(itemId)
                    .orElseThrow(() -> new EntityNotFoundException("Item not found in the database with id: " + itemId));
            return item.getPrice().multiply(BigDecimal.valueOf(orderItemDetailWrapper.getQuantity())).setScale(0, RoundingMode.HALF_UP);
        } else {
            com.india.billingservice.model.Service service = serviceRepository.findById(orderItemDetailWrapper.getServiceId())
                    .orElseThrow(() -> new EntityNotFoundException("Service not found in the database with id: " + orderItemDetailWrapper.getServiceId()));
            return service.getPrice().multiply(BigDecimal.valueOf(orderItemDetailWrapper.getQuantity())).setScale(0, RoundingMode.HALF_UP);
        }
    }

    static BigDecimal calculateDiscount(String discountType, BigDecimal totalAmount, BigDecimal discount) {
        if (discountType != null) {
            if (discountType.equalsIgnoreCase(DiscountType.PERCENT.name())) {
                totalAmount = totalAmount.subtract(totalAmount.multiply(discount.divide(BigDecimal.valueOf(100), 2, RoundingMode.HALF_UP)));
            } else if (discountType.equalsIgnoreCase(DiscountType.AMOUNT.name())) {
                totalAmount = totalAmount.subtract(discount);
            }
        }
        return totalAmount.setScale(0, RoundingMode.HALF_UP);
    }

    static BigDecimal calculateTax(String taxType, BigDecimal afterDiscountAmount, BigDecimal tax) {
        if (taxType != null) {
            if (taxType.equalsIgnoreCase(DiscountType.PERCENT.name())) {
                return afterDiscountAmount.add(afterDiscountAmount.multiply(tax.divide(BigDecimal.valueOf(100), 2, RoundingMode.HALF_UP))).setScale(0, RoundingMode.HALF_UP);
            } else if (taxType.equalsIgnoreCase(DiscountType.AMOUNT.name())) {
                return afterDiscountAmount.add(tax).setScale(0, RoundingMode.HALF_UP);
            }
        }
        return afterDiscountAmount.setScale(0, RoundingMode.HALF_UP);
    }

    public List<OrderItem> enrich(OrderDetailWrapper orderDetailWrapper, Order order) {
        List<OrderItem> orderItems = orderDetailWrapper.getOrderItems().stream()
                .map(itemDetailWrapper -> {
                    itemDetailWrapper.validateRequest();
                    OrderItem orderItem = OrderItemDetailWrapper.from(itemDetailWrapper);
                    orderItem.setTotalAmount(calculateTotalAmount(itemDetailWrapper));
                    orderItem.setNetAmount(calculateNetAmount(itemDetailWrapper));
                    if (!Objects.isNull(getItem(itemDetailWrapper.getItemId()))) {
                        orderItem.setItem(getItem(itemDetailWrapper.getItemId()));
                    }
                    orderItem.setOrder(order);
                    if (!Objects.isNull(getService(itemDetailWrapper.getServiceId()))) {
                        orderItem.setService(getService(itemDetailWrapper.getServiceId()));
                    }
                    orderItem.setDiscountAmount(calculateDiscountAmount(itemDetailWrapper));
                    orderItem.setTaxAmount(calculateTaxAmount(itemDetailWrapper));
                    return orderItem;
                })
                .toList();
        return orderItemRepository.saveAll(orderItems);
    }

    private BigDecimal calculateDiscountAmount(OrderItemDetailWrapper orderItemDetailWrapper) {
        BigDecimal totalAmount = calculateTotalAmount(orderItemDetailWrapper);
        BigDecimal afterDiscountAmount = applyDiscount(orderItemDetailWrapper, totalAmount);
        return totalAmount.subtract(afterDiscountAmount).setScale(0, RoundingMode.HALF_UP);
    }

    BigDecimal calculateTaxAmount(OrderItemDetailWrapper orderItemDetailWrapper) {
        BigDecimal totalAmount = calculateTotalAmount(orderItemDetailWrapper);
        BigDecimal afterDiscountAmount = applyDiscount(orderItemDetailWrapper, totalAmount);
        BigDecimal tax = applyTax(orderItemDetailWrapper, afterDiscountAmount);
        return tax.subtract(afterDiscountAmount).setScale(0, RoundingMode.HALF_UP);
    }

    private BigDecimal calculateTotalAmount(OrderItemDetailWrapper orderItemDetailWrapper) {
        return getOrderItemTotalAmount(orderItemDetailWrapper, itemRepository, serviceRepository).setScale(0, RoundingMode.HALF_UP);
    }

    private BigDecimal calculateNetAmount(OrderItemDetailWrapper orderItemDetailWrapper) {
        BigDecimal totalAmount = calculateTotalAmount(orderItemDetailWrapper);
        BigDecimal afterDiscountAmount = applyDiscount(orderItemDetailWrapper, totalAmount);
        return applyTax(orderItemDetailWrapper, afterDiscountAmount).setScale(0, RoundingMode.HALF_UP);
    }

    private BigDecimal applyDiscount(OrderItemDetailWrapper orderItemDetailWrapper, BigDecimal totalAmount) {
        return calculateDiscount(orderItemDetailWrapper.getDiscountType(), totalAmount, orderItemDetailWrapper.getDiscount()).setScale(0, RoundingMode.HALF_UP);
    }

    private BigDecimal applyTax(OrderItemDetailWrapper orderItemDetailWrapper, BigDecimal afterDiscountAmount) {
        return calculateTax(orderItemDetailWrapper.getTaxType(), afterDiscountAmount, orderItemDetailWrapper.getTax()).setScale(0, RoundingMode.HALF_UP);
    }

    private Item getItem(Long itemId) {
        return itemId != null ? itemRepository.findById(itemId).orElseThrow(() -> new EntityNotFoundException("Please provide valid item : " + itemId))
                : null;
    }

    private com.india.billingservice.model.Service getService(Long serviceId) {
        return serviceId != null ? serviceRepository.findById(serviceId).orElseThrow(() -> new EntityNotFoundException("Please provide valid service : " + serviceId))
                : null;
    }

}
