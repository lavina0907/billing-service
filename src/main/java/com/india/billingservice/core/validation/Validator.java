package com.india.billingservice.core.validation;

import java.util.Objects;
import java.util.function.Supplier;

@FunctionalInterface
public interface Validator<T extends Supplier<Boolean>> {

    boolean validate();

    default Validator<T> and(Validator<T> other) {
        Objects.requireNonNull(other);
        return () -> validate() && other.validate();
    }

    default Validator<T> or(Validator<T> other) {
        Objects.requireNonNull(other);
        return () -> validate() || other.validate();
    }

    default Validator<T> elseThrow(Supplier<RuntimeException> exceptionSupplier) {
        Objects.requireNonNull(exceptionSupplier);
        return () -> {
            if (!validate()) {
                throw exceptionSupplier.get();
            }
            return true;
        };
    }

    default Validator<T> elseExecute(Runnable runnable) {
        Objects.requireNonNull(runnable);
        return () -> {
            if (!validate()) {
                runnable.run();
            }
            return true;
        };
    }
}
