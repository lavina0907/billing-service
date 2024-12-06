package com.india.billingservice.core.validation;

import lombok.experimental.UtilityClass;

import java.util.Objects;
import java.util.function.Supplier;

@UtilityClass
public class ValidatorUtil {

    public static Validator<Supplier<Boolean>> checkNull(Supplier<Object> supplier) {
        Objects.requireNonNull(supplier);
        return () -> Objects.isNull(supplier.get());
    }

    public static Validator<Supplier<Boolean>> checkNotNull(Supplier<Object> supplier) {
        Objects.requireNonNull(supplier);
        return () -> Objects.nonNull(supplier.get());
    }

    public static Validator<Supplier<Boolean>> checkEquals(Supplier<Object> supplier1, Supplier<Object> supplier2) {
        Objects.requireNonNull(supplier1);
        Objects.requireNonNull(supplier2);
        return () -> Objects.equals(supplier1.get(), supplier2.get());
    }

    public static Validator<Supplier<Boolean>> checkNotEquals(Supplier<Object> supplier1, Supplier<Object> supplier2) {
        Objects.requireNonNull(supplier1);
        Objects.requireNonNull(supplier2);
        return () -> !Objects.equals(supplier1.get(), supplier2.get());
    }

    public static Validator<Supplier<Boolean>> checkValid(Supplier<Boolean> supplier) {
        Objects.requireNonNull(supplier);
        return supplier::get;
    }

    public static Validator<Supplier<Boolean>> checkNotValid(Supplier<Boolean> supplier) {
        Objects.requireNonNull(supplier);
        return () -> !supplier.get();
    }
}