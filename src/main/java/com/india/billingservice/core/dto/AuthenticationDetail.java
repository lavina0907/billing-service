package com.india.billingservice.core.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class AuthenticationDetail {
    private String username;
    private String password;
}
