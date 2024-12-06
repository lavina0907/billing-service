package com.india.billingservice.wrapper;

import static com.india.billingservice.core.validation.ValidatorUtil.checkNotNull;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.india.billingservice.core.RequestInterface;
import com.india.billingservice.core.enums.Status;
import com.india.billingservice.core.validation.RequestValidator;
import com.india.billingservice.enums.Metal;
import com.india.billingservice.enums.PriceCalculationType;
import com.india.billingservice.model.Item;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import lombok.Builder;
import lombok.Getter;
import org.apache.commons.lang3.EnumUtils;

@Getter
@JsonInclude(JsonInclude.Include.NON_NULL)
public class ItemDetailWrapper extends RequestInterface implements RequestValidator {

  private final String name;
  private final String type;
  private final String metal;
  private final String priceCalculationType;
  private final BigDecimal price;
  private final Long id;

  @Builder
  public ItemDetailWrapper(String status, String message, String name, String type, String metal,
      String priceCalculationType, BigDecimal price, Long id, LocalDateTime createdAt,
      LocalDateTime updatedAt) {
    super(status, message, createdAt, updatedAt);
    this.name = name;
    this.type = type;
    this.metal = metal;
    this.priceCalculationType = priceCalculationType;
    this.price = price;
    this.id = id;
  }

  public static ItemDetailWrapper of(Item item) {
    return ItemDetailWrapper.builder().name(item.getName())
        .type(item.getType())
        .metal(item.getMetal())
        .priceCalculationType(
            PriceCalculationType.valueOf(item.getPriceCalculationType()).getCode())
        .price(item.getPrice())
        .status(Status.SUCCESS.name())
        .id(item.getId())
        .createdAt(item.getCreatedAt())
        .updatedAt(item.getUpdatedAt())
        .build();
  }

  public static ItemDetailWrapper setErrorMessage(String errorMessage) {
    return ItemDetailWrapper.builder()
        .status(Status.ERROR.name())
        .message(errorMessage)
        .build();
  }

  @Override
  public void validateRequest() {
    checkNotNull(() -> name).elseThrow(() -> new IllegalArgumentException("name can not be null"))
        .and(checkNotNull(() -> price).elseThrow(
            () -> new IllegalArgumentException("price can not be null")))
        .and(checkNotNull(
            () -> EnumUtils.getEnum(PriceCalculationType.class, priceCalculationType)).elseThrow(
            () -> new IllegalArgumentException("Invalid calculation type")))
        .and(checkNotNull(() -> EnumUtils.getEnum(Metal.class, metal)).elseThrow(
            () -> new IllegalArgumentException("Invalid metal type")))
        .validate();
  }
}
