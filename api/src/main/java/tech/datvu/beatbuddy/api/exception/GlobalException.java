package tech.datvu.beatbuddy.api.exception;

import java.time.LocalDateTime;
import java.time.ZoneOffset;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class GlobalException extends RuntimeException {
    public static final String HTTP_STATUS_REGEX = "^[1-9]\\d{2}$";
    
    private String code;

    private long timestamp;

    private String message;

    public GlobalException(String code, String message) {
        super(message);
        this.message = message;
        this.code = code;
        timestamp = LocalDateTime.now().toEpochSecond(ZoneOffset.UTC);
    }

    @Override
    public String getMessage() {
        return message;
    }
}