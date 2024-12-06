package com.india.billingservice.enums;

import lombok.Getter;

@Getter
public enum PriceCalculationType {
    PER_PIECE("pc"),
    PER_KG("kg");

    private final String code;

    PriceCalculationType(String code) {
        this.code = code;
    }

}

