package com.india.billingservice.wrapper;

import static com.india.billingservice.core.validation.ValidatorUtil.checkNotNull;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.india.billingservice.core.RequestInterface;
import com.india.billingservice.core.enums.Status;
import com.india.billingservice.core.validation.RequestValidator;
import com.india.billingservice.model.Customer;
import java.time.LocalDateTime;
import lombok.Builder;
import lombok.Getter;

@Getter
@JsonInclude(JsonInclude.Include.NON_NULL)
public class CustomerDetailWrapper extends RequestInterface implements RequestValidator {

  private final String customerName;
  private final String companyName;
  private final String contactNumber;
  private final String emailId;
  private final Long id;

  @Builder
  public CustomerDetailWrapper(String status, String message, String customerName,
      String companyName, String contactNumber, String emailId, LocalDateTime createdAt, Long id,
      LocalDateTime updatedAt) {
    super(status, message, createdAt, updatedAt);
    this.customerName = customerName;
    this.companyName = companyName;
    this.contactNumber = contactNumber;
    this.emailId = emailId;
    this.id = id;
  }

  public static CustomerDetailWrapper of(Customer customer) {
    return CustomerDetailWrapper.builder()
        .customerName(customer.getCustomerName())
        .companyName(customer.getCompanyName())
        .emailId(customer.getEmailId())
        .contactNumber(customer.getContactNumber())
        .status(Status.SUCCESS.name())
        .createdAt(customer.getCreatedAt())
        .updatedAt(customer.getUpdatedAt())
        .build();
  }

  public static CustomerDetailWrapper setErrorMessage(String errorMessage) {
    return CustomerDetailWrapper.builder().status(Status.ERROR.name()).message(errorMessage)
        .build();
  }

  @Override
  public void validateRequest() {
    checkNotNull(() -> customerName).elseThrow(
            () -> new IllegalArgumentException("customer name can not be null"))
        .and(checkNotNull(() -> companyName).elseThrow(
            () -> new IllegalArgumentException("company name can not be null")))
        .and(checkNotNull(() -> contactNumber).elseThrow(
            () -> new IllegalArgumentException("contact number can not be null")))
        .validate();
  }
}
