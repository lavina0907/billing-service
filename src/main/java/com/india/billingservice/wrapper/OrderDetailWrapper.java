package com.india.billingservice.wrapper;

import static com.india.billingservice.core.validation.ValidatorUtil.checkNotNull;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.india.billingservice.core.RequestInterface;
import com.india.billingservice.core.enums.Status;
import com.india.billingservice.core.validation.RequestValidator;
import com.india.billingservice.model.Order;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import lombok.Builder;
import lombok.Getter;

@Getter
@JsonInclude(JsonInclude.Include.NON_NULL)
public class OrderDetailWrapper extends RequestInterface implements RequestValidator {

  private final LocalDateTime deliveryDate;
  private final Long customerId;
  private final BigDecimal totalAmount;
  private final BigDecimal netAmount;
  private final Long createdBy;
  private final String orderNumber;
  private final LocalDateTime orderDate;
  private final BigDecimal discountAmount;

  private final List<OrderItemDetailWrapper> orderItems;

  @Builder
  public OrderDetailWrapper(String status, String message, LocalDateTime deliveryDate,
      Long customerId, BigDecimal totalAmount, BigDecimal netAmount, Long createdBy,
      String orderNumber, LocalDateTime orderDate, BigDecimal discountAmount,
      List<OrderItemDetailWrapper> orderItems, LocalDateTime createdAt, LocalDateTime updatedAt) {
    super(status, message, createdAt, updatedAt);
    this.deliveryDate = deliveryDate;
    this.customerId = customerId;
    this.totalAmount = totalAmount;
    this.netAmount = netAmount;
    this.createdBy = createdBy;
    this.orderNumber = orderNumber;
    this.orderDate = orderDate;
    this.discountAmount = discountAmount;
    this.orderItems = orderItems;
  }

  public static OrderDetailWrapper of(Order order) {
    return OrderDetailWrapper.builder()
        .deliveryDate(order.getDeliverDate())
        .customerId(order.getCustomer().getId())
        .totalAmount(order.getTotalAmount())
        .netAmount(order.getNetAmount())
        .createdBy(order.getCreatedBy().getId())
        .orderNumber(order.getOrderNumber())
        .orderDate(order.getOrderDate())
        .discountAmount(order.getDiscountAmount())
        .status(Status.SUCCESS.name())
        .orderItems(order.getOrderItems().stream().map(OrderItemDetailWrapper::of).toList())
        .createdAt(order.getCreatedAt())
        .updatedAt(order.getUpdatedAt())
        .build();
  }

  public static OrderDetailWrapper setErrorMessage(String errorMessage) {
    return OrderDetailWrapper.builder()
        .status(Status.ERROR.name())
        .message(errorMessage)
        .build();
  }

  public static Order from(OrderDetailWrapper orderDetailWrapper) {
    return Order.builder()
        .orderDate(LocalDateTime.now())
        .deliverDate(orderDetailWrapper.getDeliveryDate())
        .build();
  }

  @Override
  public void validateRequest() {
    checkNotNull(() -> orderItems).elseThrow(
            () -> new IllegalArgumentException("Please provide any item to generate invoice"))
        .and(checkNotNull(() -> deliveryDate).elseThrow(
            () -> new IllegalArgumentException("Please provide delivery date")))
        .and(checkNotNull(() -> customerId).elseThrow(
            () -> new IllegalArgumentException("Please provide customer details")))
        .validate();
  }
}
