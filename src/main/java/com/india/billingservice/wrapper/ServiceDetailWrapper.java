package com.india.billingservice.wrapper;

import static com.india.billingservice.core.validation.ValidatorUtil.checkNotNull;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.india.billingservice.core.RequestInterface;
import com.india.billingservice.core.enums.Status;
import com.india.billingservice.core.validation.RequestValidator;
import com.india.billingservice.enums.Metal;
import com.india.billingservice.enums.PriceCalculationType;
import com.india.billingservice.model.Service;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import lombok.Builder;
import lombok.Getter;
import org.apache.commons.lang3.EnumUtils;

@Getter
@JsonInclude(JsonInclude.Include.NON_NULL)
public class ServiceDetailWrapper extends RequestInterface implements RequestValidator {

  private final String name;
  private final String metal;
  private final String priceCalculationType;
  private final BigDecimal price;
  private final Long id;

  @Builder
  public ServiceDetailWrapper(String status, String message, String name, String metal,
      String priceCalculationType, BigDecimal price, LocalDateTime createdAt, Long id,
      LocalDateTime updatedAt) {
    super(status, message, createdAt, updatedAt);
    this.name = name;
    this.metal = metal;
    this.priceCalculationType = priceCalculationType;
    this.price = price;
    this.id = id;
  }

  public static ServiceDetailWrapper of(Service service) {
    return ServiceDetailWrapper.builder()
        .name(service.getName())
        .metal(service.getMetal())
        .price(service.getPrice())
        .priceCalculationType(
            PriceCalculationType.valueOf(service.getPriceCalculationType()).getCode())
        .status(Status.SUCCESS.name())
        .createdAt(service.getCreatedAt())
        .updatedAt(service.getUpdatedAt())
        .id(service.getId())
        .build();
  }

  public static ServiceDetailWrapper setErrorMessage(String errorMessage) {
    return ServiceDetailWrapper.builder()
        .status(Status.ERROR.name())
        .message(errorMessage)
        .build();
  }

  @Override
  public void validateRequest() {
    checkNotNull(() -> name).elseThrow(
            () -> new IllegalArgumentException("service name can not be null"))
        .and(checkNotNull(() -> EnumUtils.getEnum(Metal.class, metal)).elseThrow(
            () -> new IllegalArgumentException("Invalid service metal type")))
        .and(checkNotNull(
            () -> EnumUtils.getEnum(PriceCalculationType.class, priceCalculationType)).elseThrow(
            () -> new IllegalArgumentException("Invalid service price calculation type")))
        .and(checkNotNull(() -> price).elseThrow(
            () -> new IllegalArgumentException("service price can not null")))
        .validate();
  }
}
