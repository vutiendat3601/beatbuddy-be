package tech.datvu.beatbuddy.storage.shared.utils.validation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import jakarta.validation.Constraint;
import jakarta.validation.Payload;

@Documented
@Constraint(validatedBy = FileNotEmptyValidator.class)
@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
public @interface FileNotEmpty {
    String message() default "must be not empty";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
    String[] accepts() default {};
}
