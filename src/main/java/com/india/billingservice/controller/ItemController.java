package com.india.billingservice.controller;

import com.india.billingservice.BillingServiceApplication;
import com.india.billingservice.model.Item;
import com.india.billingservice.repository.ItemRepository;
import com.india.billingservice.wrapper.ItemDetailWrapper;
import java.util.List;
import javax.persistence.NoResultException;
import lombok.extern.log4j.Log4j;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
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
@RequestMapping("/item")
public class ItemController {

  private static final Logger LOGGER = LogManager.getLogger(ItemController.class);

  @Autowired
  private ItemRepository itemRepository;

  @PostMapping("/save")
  public ResponseEntity<ItemDetailWrapper> save(@RequestBody ItemDetailWrapper itemDetailWrapper) {
    try {
      itemDetailWrapper.validateRequest();
      Item item = Item.builder().name(itemDetailWrapper.getName())
          .metal(itemDetailWrapper.getMetal())
          .price(itemDetailWrapper.getPrice()).type(itemDetailWrapper.getType())
          .priceCalculationType(itemDetailWrapper.getPriceCalculationType()).build();
      return ResponseEntity.ok().body(ItemDetailWrapper.of(itemRepository.save(item)));
    } catch (IllegalArgumentException e) {
      return ResponseEntity.status(HttpStatus.BAD_REQUEST)
          .body(ItemDetailWrapper.setErrorMessage(e.getMessage()));
    }
  }

  @GetMapping(path = "/{name}")
  public ResponseEntity<List<ItemDetailWrapper>> search(@PathVariable("name") String name) {
    List<Item> items = itemRepository.findItemsByName(name);
    if (items.isEmpty()) {
      return ResponseEntity.ok(List.of());
    }
    List<ItemDetailWrapper> itemDetailWrappers = items.stream()
        .map(ItemDetailWrapper::of).toList();
    return ResponseEntity.ok(itemDetailWrappers);
  }

  @GetMapping
  public ResponseEntity<Page<ItemDetailWrapper>> getItems(Pageable pageable) {
    Page<Item> items = itemRepository.findAll(pageable);
    if (items.isEmpty()) {
      return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
    }
    List<ItemDetailWrapper> itemDetailWrappers = items.getContent().stream()
        .map(ItemDetailWrapper::of).toList();
    return ResponseEntity.ok(
        new PageImpl<>(itemDetailWrappers, pageable, items.getTotalElements()));
  }

  @GetMapping(path = "/all")
  public ResponseEntity<List<ItemDetailWrapper>> getAllItems() {
    List<Item> items = itemRepository.findAll();
    if (items.isEmpty()) {
      return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
    }
    List<ItemDetailWrapper> itemDetailWrappers = items.stream()
        .map(ItemDetailWrapper::of).toList();
    return ResponseEntity.ok(itemDetailWrappers);
  }

  @GetMapping(path = "/get/{id}")
  public ResponseEntity<ItemDetailWrapper> getItem(@PathVariable("id") Long id) {
    Item item = itemRepository.findById(id)
        .orElseThrow(() -> new NoResultException("Item not found with id: " + id));
    return ResponseEntity.ok(ItemDetailWrapper.of(item));
  }

  @PostMapping("/update")
  public ResponseEntity<ItemDetailWrapper> update(@RequestBody ItemDetailWrapper itemDetailWrapper) {
    try {
      itemDetailWrapper.validateRequest();
      Item item = itemRepository.findById(itemDetailWrapper.getId())
          .orElseThrow(() -> new NoResultException("Item not found with id: " + itemDetailWrapper.getId()));
      item.setName(itemDetailWrapper.getName());
      item.setMetal(itemDetailWrapper.getMetal());
      item.setPrice(itemDetailWrapper.getPrice());
      item.setType(itemDetailWrapper.getType());
      item.setPriceCalculationType(itemDetailWrapper.getPriceCalculationType());
      return ResponseEntity.ok().body(ItemDetailWrapper.of(itemRepository.save(item)));
    } catch (IllegalArgumentException e) {
      return ResponseEntity.status(HttpStatus.BAD_REQUEST)
          .body(ItemDetailWrapper.setErrorMessage(e.getMessage()));
    }
  }
}
