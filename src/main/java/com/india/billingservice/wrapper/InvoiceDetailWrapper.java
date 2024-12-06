package com.india.billingservice.wrapper;

import com.india.billingservice.model.Order;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class InvoiceDetailWrapper {

    private String invoiceNumber;
    private String customerName;
    private String firmName;
    private String contactNumber;
    private String email;
    private LocalDate orderDate;
    private LocalDate deliveryDate;
    private String username;
    private BigDecimal totalAmount;
    private BigDecimal netAmount;
    private BigDecimal discountAmount;
    private BigDecimal taxAmount;
    private List<InvoiceItemWrapper> items;
    private String storeName;
    private LocalDateTime createdAt;

    public static InvoiceDetailWrapper of(Order order) {
        return InvoiceDetailWrapper.builder()
                .invoiceNumber(order.getOrderNumber())
                .customerName(order.getCustomer().getCustomerName())
                .firmName(order.getCustomer().getCompanyName())
                .contactNumber(order.getCustomer().getContactNumber())
                .email(order.getCustomer().getEmailId())
                .orderDate(order.getOrderDate().toLocalDate())
                .deliveryDate(order.getDeliverDate().toLocalDate())
                .totalAmount(order.getTotalAmount())
                .netAmount(order.getNetAmount())
                .discountAmount(order.getDiscountAmount())
                .taxAmount(order.getTaxAmount())
                .items(order.getOrderItems().stream().map(InvoiceItemWrapper::of).toList())
                .storeName("Ridhi Sidhi Vibrators")
                .createdAt(order.getCreatedAt())
                .build();
    }
}
