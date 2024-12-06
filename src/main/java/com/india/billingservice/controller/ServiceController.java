package com.india.billingservice.controller;


import com.india.billingservice.model.Service;
import com.india.billingservice.repository.ServiceRepository;
import com.india.billingservice.wrapper.ServiceDetailWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/service")
public class ServiceController {

    @Autowired
    private ServiceRepository serviceRepository;

    @PostMapping
    public ResponseEntity<ServiceDetailWrapper> save(@RequestBody ServiceDetailWrapper serviceDetailWrapper) {
        try {
            serviceDetailWrapper.validateRequest();
            Service service = Service.builder()
                    .name(serviceDetailWrapper.getName())
                    .metal(serviceDetailWrapper.getMetal())
                    .price(serviceDetailWrapper.getPrice())
                    .priceCalculationType(serviceDetailWrapper.getPriceCalculationType())
                    .build();
            return ResponseEntity.ok(ServiceDetailWrapper.of(serviceRepository.save(service)));
        } catch (IllegalArgumentException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(ServiceDetailWrapper.setErrorMessage(e.getMessage()));
        }
    }

    @GetMapping(path = "/{name}")
    public ResponseEntity<List<ServiceDetailWrapper>> search(@PathVariable("name") String name) {
        List<Service> services = serviceRepository.findServicesByName(name);
        if (services.isEmpty()) {
            return ResponseEntity.ok(List.of());
        }
        List<ServiceDetailWrapper> itemDetailWrappers = services.stream()
                .map(ServiceDetailWrapper::of).toList();
        return ResponseEntity.ok(itemDetailWrappers);
    }

    @GetMapping
    public ResponseEntity<Page<ServiceDetailWrapper>> getServices(Pageable pageable) {
        Page<Service> services = serviceRepository.findAll(pageable);
        if (services.isEmpty()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
        }
        List<ServiceDetailWrapper> serviceDetailWrappers = services.getContent().stream()
                .map(ServiceDetailWrapper::of).toList();
        return ResponseEntity.ok(new PageImpl<>(serviceDetailWrappers, pageable, services.getTotalElements()));
    }

    @GetMapping(path = "/all")
    public ResponseEntity<List<ServiceDetailWrapper>> getAllServices() {
        List<Service> services = serviceRepository.findAll();
        if (services.isEmpty()) {
            return ResponseEntity.ok(List.of());
        }
        List<ServiceDetailWrapper> itemDetailWrappers = services.stream()
                .map(ServiceDetailWrapper::of).toList();
        return ResponseEntity.ok(itemDetailWrappers);
    }


}
