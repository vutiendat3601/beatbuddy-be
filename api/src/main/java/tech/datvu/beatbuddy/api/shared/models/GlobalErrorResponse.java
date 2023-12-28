package tech.datvu.beatbuddy.api.shared.models;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import tech.datvu.beatbuddy.api.shared.global.GlobalException;

@Data
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor(access = AccessLevel.PRIVATE)
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class GlobalErrorResponse extends Response<Object> {
    private tech.datvu.beatbuddy.api.shared.models.GlobalErrorResponse.Error error;

    public static Response<?> of(GlobalException e) {
        return new GlobalErrorResponse(new Error(e.getCode(), e.getTimestamp(), e.getMessage()));
    }

    @NoArgsConstructor
    @AllArgsConstructor
    @Data
    public static class Error {
        private String code;

        private long timestamp;

        private String message;
    }
}
