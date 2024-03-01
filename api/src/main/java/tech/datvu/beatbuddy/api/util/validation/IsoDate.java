package tech.datvu.beatbuddy.api.util.validation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import jakarta.validation.Constraint;
import jakarta.validation.Payload;

@Documented
@Constraint(validatedBy = IsoDateValidator.class)
@Target({ ElementType.FIELD })
@Retention(RetentionPolicy.RUNTIME)
public @interface IsoDate {
    String message() default "must match formats [yyyy, yyyy-MM, yyyy-MM-dd]";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
