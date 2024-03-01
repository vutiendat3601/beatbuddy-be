package tech.datvu.beatbuddy.api.model.response;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import tech.datvu.beatbuddy.api.exception.GlobalException;

@Data
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor(access = AccessLevel.PRIVATE)
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class ErrorResponse extends Response<Object> {
    private tech.datvu.beatbuddy.api.model.response.ErrorResponse.Error error;

    public static Response<?> of(GlobalException e) {
        return new ErrorResponse(new Error(e.getCode(), e.getTimestamp(), e.getMessage()));
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
