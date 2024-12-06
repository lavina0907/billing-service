package com.india.billingservice.repository;

import com.india.billingservice.model.Service;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ServiceRepository extends JpaRepository<Service, Long> {

    @Query("SELECT s FROM Service s WHERE s.name LIKE %:name%")
    List<Service> findServicesByName(String name);
}
