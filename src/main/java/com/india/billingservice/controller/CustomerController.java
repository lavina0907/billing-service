package com.india.billingservice.controller;

import com.india.billingservice.model.Customer;
import com.india.billingservice.repository.CustomerRepository;
import com.india.billingservice.wrapper.CustomerDetailWrapper;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/customer")
public class CustomerController {

  @Autowired
  private CustomerRepository customerRepository;

  @PostMapping("/save")
  public ResponseEntity<CustomerDetailWrapper> save(
      @RequestBody CustomerDetailWrapper customerDetailWrapper) {
    try {
      customerDetailWrapper.validateRequest();
      Customer customer = Customer.builder()
          .customerName(customerDetailWrapper.getCustomerName())
          .companyName(customerDetailWrapper.getCompanyName())
          .contactNumber(customerDetailWrapper.getContactNumber())
          .emailId(customerDetailWrapper.getEmailId())
          .build();
      return ResponseEntity.ok(CustomerDetailWrapper.of(customerRepository.save(customer)));
    } catch (IllegalArgumentException e) {
      return ResponseEntity.status(HttpStatus.BAD_REQUEST)
          .body(CustomerDetailWrapper.setErrorMessage(e.getMessage()));
    }
  }

  @GetMapping(path = "/{name}")
  public ResponseEntity<List<CustomerDetailWrapper>> search(@PathVariable String name) {
    List<Customer> customers = customerRepository.findCustomersByName(name);
    if (customers.isEmpty()) {
      return ResponseEntity.ok(List.of());
    }
    List<CustomerDetailWrapper> customerDetailWrappers = customers.stream()
        .map(CustomerDetailWrapper::of).toList();
    return ResponseEntity.ok(customerDetailWrappers);
  }

  @GetMapping
  public ResponseEntity<Page<Customer>> getCustomer(Pageable pageable) {
    Page<Customer> customers = customerRepository.findAll(pageable);
    if (customers.isEmpty()) {
      return ResponseEntity.ok(Page.empty());
    }
    return ResponseEntity.ok(customers);
  }

  @GetMapping(path = "/nameAndId")
  public ResponseEntity<List<CustomerDetailWrapper>> getCustomerNameAndId() {
    List<Customer> customers = customerRepository.findAll();
    if (customers.isEmpty()) {
      return ResponseEntity.ok(List.of());
    }
    List<CustomerDetailWrapper> customerDetailWrappers = customers.stream()
        .map(customer -> CustomerDetailWrapper.builder()
            .customerName(customer.getCustomerName())
            .id(customer.getId())
            .companyName(customer.getCompanyName())
            .build()).toList();
    return ResponseEntity.ok(customerDetailWrappers);
  }

  @GetMapping(path = "id/{id}")
  public ResponseEntity<CustomerDetailWrapper> getCustomer(@PathVariable Long id) {
    Customer customers = customerRepository.findById(id)
        .orElseThrow(() -> new IllegalArgumentException("Customer not found"));
    return ResponseEntity.ok(CustomerDetailWrapper.of(customers));
  }


}
