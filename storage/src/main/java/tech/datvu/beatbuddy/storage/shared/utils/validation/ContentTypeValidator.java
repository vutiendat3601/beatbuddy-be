package tech.datvu.beatbuddy.storage.shared.utils.validation;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class ContentTypeValidator implements ConstraintValidator<ContentType, MultipartFile> {
    private Set<String> acceptContentTypes;

    @Override
    public void initialize(ContentType constraintAnnotation) {
        String[] accepts = constraintAnnotation.accepts();
        acceptContentTypes = new HashSet<>(Arrays.asList(accepts));
    }

    @Override
    public boolean isValid(MultipartFile file, ConstraintValidatorContext context) {
        if (file != null) {
            if (file.isEmpty()) {
                return false;
            }
            String contentType = file.getContentType();
            return contentType != null && acceptContentTypes.contains(contentType);
        }
        return true;
    }

}
