package com.india.billingservice.core;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.time.LocalDateTime;

@Getter
@AllArgsConstructor
public class RequestInterface {
    private final String status;
    private final String message;
    private final LocalDateTime createdAt;
    private final LocalDateTime updatedAt;
}
