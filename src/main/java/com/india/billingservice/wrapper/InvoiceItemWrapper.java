package com.india.billingservice.wrapper;

import com.india.billingservice.enums.PriceCalculationType;
import com.india.billingservice.model.OrderItem;
import lombok.Builder;
import lombok.Data;

import java.math.BigDecimal;
import java.math.RoundingMode;

@Data
@Builder
public class InvoiceItemWrapper {
    private String itemName;
    private String serviceName;
    private int quantity;
    private BigDecimal price;
    private String priceType;
    private BigDecimal totalAmount;
    private BigDecimal netAmount;
    private String discountCalculationType;
    private BigDecimal discount;
    private BigDecimal discountAmount;
    private String taxCalculationType;
    private BigDecimal tax;
    private BigDecimal taxRate;
    private BigDecimal taxAmount;

    public static InvoiceItemWrapper of(OrderItem orderItem) {
        return InvoiceItemWrapper.builder()
                .itemName(orderItem.getItem() != null ? orderItem.getItem().getName() : null)
                .serviceName(orderItem.getService() != null ? orderItem.getService().getName() : null)
                .quantity(orderItem.getQuantity().intValue())
                .price(orderItem.getItem() != null ? orderItem.getItem().getPrice().setScale(0, RoundingMode.HALF_UP) : orderItem.getService().getPrice().setScale(0, RoundingMode.HALF_UP))
                .priceType(PriceCalculationType.valueOf(orderItem.getItem() != null ? orderItem.getItem().getPriceCalculationType() : orderItem.getService().getPriceCalculationType()).getCode())
                .totalAmount(orderItem.getTotalAmount())
                .netAmount(orderItem.getNetAmount())
                .discountCalculationType(orderItem.getDiscountType())
                .discountAmount(orderItem.getDiscountAmount())
                .taxCalculationType(orderItem.getTaxType())
                .taxRate(orderItem.getTaxRate())
                .taxAmount(orderItem.getTaxAmount())
                .build();
    }
}
