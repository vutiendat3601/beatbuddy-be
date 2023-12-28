package tech.datvu.beatbuddy.storage.shared.models;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import tech.datvu.beatbuddy.storage.shared.global.GlobalConstant;
import tech.datvu.beatbuddy.storage.shared.global.GlobalException;

@Data
@NoArgsConstructor(access = AccessLevel.PACKAGE)
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class Response<T> {
    protected T data;
    protected String status;

    public static <R> Response<R> success(R data) {
        return new Response<R>(data, GlobalConstant.STATUS_SUCCESS);
    }

    public static Response<?> errorGlobal(GlobalException e) {
        Response<?> resp = GlobalErrorResponse.of(e);
        resp.status = GlobalConstant.STATUS_ERROR;
        return resp;
    }
}
