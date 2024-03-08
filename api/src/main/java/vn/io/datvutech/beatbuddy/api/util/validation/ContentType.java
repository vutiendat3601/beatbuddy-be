package vn.io.datvutech.beatbuddy.api.util.validation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import jakarta.validation.Constraint;
import jakarta.validation.Payload;

@Documented
@Constraint(validatedBy = ContentTypeValidator.class)
@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
public @interface ContentType {
    String message() default "is invalid content type, only accepts {accepts}";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
    String[] accepts() default {};
}
