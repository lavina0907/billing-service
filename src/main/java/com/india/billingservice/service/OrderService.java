package com.india.billingservice.service;

import com.india.billingservice.model.Customer;
import com.india.billingservice.model.Order;
import com.india.billingservice.model.User;
import com.india.billingservice.repository.*;
import com.india.billingservice.wrapper.OrderDetailWrapper;
import com.india.billingservice.wrapper.OrderItemDetailWrapper;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.math.BigDecimal;
import java.math.RoundingMode;

@Service
public class OrderService {

    private static final int ORDER_NUMBER_LENGTH = 13;
    private static final String ORDER_NUMBER_PREFIX = "ORD";
    @Autowired
    ItemRepository itemRepository;
    @Autowired
    ServiceRepository serviceRepository;
    @Autowired
    UserRepository userRepository;
    @Autowired
    CustomerRepository customerRepository;
    @Autowired
    OrderRepository orderRepository;
    @Autowired
    OrderItemService orderItemService;

    public Order enrich(OrderDetailWrapper orderDetailWrapper) {
        Order order = OrderDetailWrapper.from(orderDetailWrapper);
        BigDecimal netItemAmount = calculateNetAmount(orderDetailWrapper);
        BigDecimal totalAmount = calculateTotalAmount(orderDetailWrapper);
        order.setOrderNumber(generateOrderNumber());
        order.setCustomer(getCustomer(orderDetailWrapper.getCustomerId()));
        order.setCreatedBy(getCurrentUser());
        order.setTotalAmount(totalAmount);
        order.setNetAmount(netItemAmount);
        order.setDiscountAmount(calculateDiscountAmount(orderDetailWrapper));
        order.setTaxAmount(calculateTaxAmount(orderDetailWrapper));
        order = orderRepository.save(order);
        order.setOrderItems(orderItemService.enrich(orderDetailWrapper, order));
        return order;
    }


    private String generateOrderNumber() {
        return ORDER_NUMBER_PREFIX +
                RandomStringUtils.randomNumeric(ORDER_NUMBER_LENGTH - ORDER_NUMBER_PREFIX.length());
    }

    private BigDecimal calculateTotalAmount(OrderDetailWrapper orderDetailWrapper) {
        return orderDetailWrapper.getOrderItems().stream()
                .map(orderItemDetailWrapper -> {
                    return OrderItemService.getOrderItemTotalAmount(orderItemDetailWrapper, itemRepository, serviceRepository);
                })
                .reduce(BigDecimal.ZERO, BigDecimal::add).setScale(1, RoundingMode.HALF_UP);
    }

    private BigDecimal calculateNetAmount(OrderDetailWrapper orderDetailWrapper) {
        return orderDetailWrapper.getOrderItems().stream()
                .map(orderItemDetailWrapper -> {
                    BigDecimal totalAmount = calculateTotalAmount(orderItemDetailWrapper);
                    BigDecimal afterDiscountAmount = applyDiscount(orderItemDetailWrapper, totalAmount);
                    return applyTax(orderItemDetailWrapper, afterDiscountAmount);
                })
                .reduce(BigDecimal.ZERO, BigDecimal::add).setScale(1, RoundingMode.HALF_UP);
    }

    private BigDecimal calculateTaxAmount(OrderDetailWrapper orderDetailWrapper) {
        return orderDetailWrapper.getOrderItems().stream()
                .map(orderItemDetailWrapper -> {
                    BigDecimal totalAmount = calculateTotalAmount(orderItemDetailWrapper);
                    BigDecimal afterDiscountAmount = applyDiscount(orderItemDetailWrapper, totalAmount);
                    BigDecimal afterTax = applyTax(orderItemDetailWrapper, afterDiscountAmount);
                    return afterTax.subtract(afterDiscountAmount).setScale(1, RoundingMode.HALF_UP);
                })
                .reduce(BigDecimal.ZERO, BigDecimal::add);
    }

    private BigDecimal calculateDiscountAmount(OrderDetailWrapper orderDetailWrapper) {
        return orderDetailWrapper.getOrderItems().stream()
                .map(orderItemDetailWrapper -> {
                    BigDecimal totalAmount = calculateTotalAmount(orderItemDetailWrapper);
                    BigDecimal afterDiscountAmount = applyDiscount(orderItemDetailWrapper, totalAmount);
                    return totalAmount.subtract(afterDiscountAmount).setScale(1, RoundingMode.HALF_UP);
                })
                .reduce(BigDecimal.ZERO, BigDecimal::add);
    }

    private BigDecimal calculateTotalAmount(OrderItemDetailWrapper orderItemDetailWrapper) {
        return OrderItemService.getOrderItemTotalAmount(orderItemDetailWrapper, itemRepository, serviceRepository);
    }

    private BigDecimal applyDiscount(OrderItemDetailWrapper orderItemDetailWrapper, BigDecimal totalAmount) {
        return OrderItemService.calculateDiscount(orderItemDetailWrapper.getDiscountType(), totalAmount, orderItemDetailWrapper.getDiscount());
    }

    private BigDecimal applyTax(OrderItemDetailWrapper orderItemDetailWrapper, BigDecimal afterDiscountAmount) {
        return OrderItemService.calculateTax(orderItemDetailWrapper.getTaxType(), afterDiscountAmount, orderItemDetailWrapper.getTax());
    }

    private User getCurrentUser() {
        return userRepository.findById(1L).orElseThrow(() -> new EntityNotFoundException("User not found with Id : 1"));
    }

    private Customer getCustomer(Long customerId) {
        return customerRepository.findById(customerId).orElseThrow(() -> new EntityNotFoundException("Customer not found with id : " + customerId));
    }
}
