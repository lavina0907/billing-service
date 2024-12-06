package com.india.billingservice.repository;

import com.india.billingservice.model.Item;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ItemRepository extends JpaRepository<Item, Long> {

    @Query("SELECT i FROM Item i WHERE i.name LIKE %:name%")
    List<Item> findItemsByName(String name);
}
