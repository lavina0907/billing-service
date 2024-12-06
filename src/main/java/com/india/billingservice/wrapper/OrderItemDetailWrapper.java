package com.india.billingservice.wrapper;

import static com.india.billingservice.core.validation.ValidatorUtil.checkNotNull;
import static com.india.billingservice.core.validation.ValidatorUtil.checkNull;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.india.billingservice.core.RequestInterface;
import com.india.billingservice.core.enums.Status;
import com.india.billingservice.core.validation.RequestValidator;
import com.india.billingservice.enums.DiscountType;
import com.india.billingservice.model.OrderItem;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import lombok.Builder;
import lombok.Getter;
import org.apache.commons.lang3.EnumUtils;

@Getter
@JsonInclude(JsonInclude.Include.NON_NULL)
public class OrderItemDetailWrapper extends RequestInterface implements RequestValidator {

  private final String discountType;
  private final BigDecimal discount;
  private final String taxType;
  private final BigDecimal tax;
  private final BigDecimal totalAmount;
  private final BigDecimal netAmount;
  private final Long itemId;
  private final Long serviceId;
  private final Long quantity;
  private final BigDecimal discountAmount;
  private final BigDecimal taxRate;

  @Builder
  public OrderItemDetailWrapper(String status, String message, String discountType,
      BigDecimal discount, String taxType, BigDecimal tax, BigDecimal totalAmount,
      BigDecimal netAmount, Long itemId, Long serviceId, Long quantity, BigDecimal discountAmount,
      BigDecimal taxRate, LocalDateTime createdAt, LocalDateTime updatedAt) {
    super(status, message, createdAt, updatedAt);
    this.discountType = discountType;
    this.discount = discount;
    this.taxType = taxType;
    this.tax = tax;
    this.totalAmount = totalAmount;
    this.netAmount = netAmount;
    this.itemId = itemId;
    this.serviceId = serviceId;
    this.quantity = quantity;
    this.discountAmount = discountAmount;
    this.taxRate = taxRate;
  }

  public static OrderItemDetailWrapper of(OrderItem orderItem) {
    return OrderItemDetailWrapper.builder()
        .discountType(orderItem.getDiscountType())
        .discount(orderItem.getDiscount())
        .taxType(orderItem.getTaxType())
        .tax(orderItem.getTaxAmount())
        .taxRate(orderItem.getTaxRate())
        .totalAmount(orderItem.getTotalAmount())
        .netAmount(orderItem.getNetAmount())
        .itemId(orderItem.getItem() != null ? orderItem.getItem().getId() : null)
        .serviceId(orderItem.getService() != null ? orderItem.getService().getId() : null)
        .quantity(orderItem.getQuantity())
        .discountAmount(orderItem.getDiscountAmount())
        .status(Status.SUCCESS.name())
        .createdAt(orderItem.getCreatedAt())
        .updatedAt(orderItem.getUpdatedAt())
        .build();
  }

  public static OrderItemDetailWrapper setErrorMessage(String errorMessage) {
    return OrderItemDetailWrapper.builder()
        .status(Status.ERROR.name())
        .message(errorMessage)
        .build();
  }

  public static OrderItem from(OrderItemDetailWrapper orderItemDetailWrapper) {
    return OrderItem.builder()
        .discount(orderItemDetailWrapper.getDiscount())
        .discountType(orderItemDetailWrapper.getDiscountType())
        .taxType(orderItemDetailWrapper.getTaxType())
        .taxRate(orderItemDetailWrapper.getTax())
        .quantity(orderItemDetailWrapper.getQuantity())
        .build();
  }

  @Override
  public void validateRequest() {
    checkNull(() -> discountType).or(
            checkNotNull(() -> EnumUtils.getEnum(DiscountType.class, discountType))
                .elseThrow(() -> new IllegalArgumentException("Please provide valid type of discount"))
                .and(checkNotNull(() -> discount).elseThrow(() -> new IllegalArgumentException(
                    "Please provide validate discount amount or percentage"))))
        .and(checkNull(() -> taxType).or(
            checkNotNull(() -> EnumUtils.getEnum(DiscountType.class, taxType))
                .elseThrow(() -> new IllegalArgumentException("Please provide valid type of tax"))
                .and(checkNotNull(() -> tax).elseThrow(() -> new IllegalArgumentException(
                    "Please provide validate tax amount or percentage")))))
        .and(checkNotNull(() -> itemId).or(checkNotNull(() -> serviceId).elseThrow(
            () -> new IllegalArgumentException("Please provide order items or service"))))
        .and(checkNotNull(() -> quantity).elseThrow(
            () -> new IllegalArgumentException("Please provide quantity of item")))
        .validate();
  }
}
