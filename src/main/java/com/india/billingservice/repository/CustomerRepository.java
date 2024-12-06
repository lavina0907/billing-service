package com.india.billingservice.repository;

import com.india.billingservice.model.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CustomerRepository extends JpaRepository<Customer, Long> {

    @Query("SELECT c FROM Customer c WHERE c.customerName LIKE %:name%")
    List<Customer> findCustomersByName(String name);
}
