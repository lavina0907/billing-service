package com.india.billingservice.controller;

import com.india.billingservice.InvoiceGenerator;
import com.india.billingservice.model.Order;
import com.india.billingservice.repository.OrderRepository;
import com.india.billingservice.service.OrderService;
import com.india.billingservice.wrapper.InvoiceDetailWrapper;
import com.india.billingservice.wrapper.OrderDetailWrapper;
import com.lowagie.text.DocumentException;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/order")
@Slf4j
public class OrderController {
    private final OrderRepository orderRepository;
    private final OrderService orderService;
    private final InvoiceGenerator invoiceGenerator;

    @Autowired
    public OrderController(OrderService orderService, InvoiceGenerator invoiceGenerator,
                           OrderRepository orderRepository) {
        this.orderService = orderService;
        this.invoiceGenerator = invoiceGenerator;
        this.orderRepository = orderRepository;
    }

    @PostMapping
    public ResponseEntity<?> save(@RequestBody OrderDetailWrapper orderDetailWrapper) {
        try {
            orderDetailWrapper.validateRequest();
            Order order = orderService.enrich(orderDetailWrapper);
            return getResponseEntity(order);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(OrderDetailWrapper.setErrorMessage(e.getMessage()));
        } catch (Exception e) {
            log.error("Error while saving order", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(OrderDetailWrapper.setErrorMessage(e.getMessage()));
        }
    }

    private ResponseEntity<?> getResponseEntity(Order order) throws DocumentException, IOException {
        try {
            File file = invoiceGenerator.generatePdf(InvoiceDetailWrapper.of(order));
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            headers.setContentDispositionFormData("attachment", file.getName());
            return ResponseEntity.ok()
                    .headers(headers)
                    .body(new InputStreamResource(new FileInputStream(file)));
        } catch (IOException e) {
            log.error("Error while reading PDF file", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(OrderDetailWrapper.setErrorMessage("Error reading PDF file"));
        }
    }

    @GetMapping
    public ResponseEntity<Page<InvoiceDetailWrapper>> getOrder(Pageable pageable) {
        Page<Order> orders = orderRepository.findAll(pageable);
        if (orders.isEmpty()) {
            return ResponseEntity.ok(Page.empty());
        }
        List<InvoiceDetailWrapper> orderDetailWrappers = orders.getContent().stream()
                .map(InvoiceDetailWrapper::of).toList();
        return ResponseEntity.ok(new PageImpl<>(orderDetailWrappers, pageable, orders.getTotalElements()));
    }

    @GetMapping(path = "/{orderNumber}")
    public ResponseEntity<?> generateInvoice(@PathVariable("orderNumber") String orderNumber) {
        try {
            Order order = orderRepository.findByOrderNumber(orderNumber).orElseThrow(() -> new IllegalArgumentException("Order not found"));
            return getResponseEntity(order);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(OrderDetailWrapper.setErrorMessage(e.getMessage()));
        } catch (Exception e) {
            log.error("Error while saving order", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(OrderDetailWrapper.setErrorMessage(e.getMessage()));
        }
    }

    @GetMapping("/all")
    public ResponseEntity<List<InvoiceDetailWrapper>> getAllOrders() {
        List<Order> orders = orderRepository.findAll();
        if (orders.isEmpty()) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
        List<InvoiceDetailWrapper> orderDetailWrappers = orders.stream()
            .map(InvoiceDetailWrapper::of).toList();
        return ResponseEntity.ok(orderDetailWrappers);
    }
}
