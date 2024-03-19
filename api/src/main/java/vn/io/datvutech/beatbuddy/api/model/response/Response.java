package vn.io.datvutech.beatbuddy.api.model.response;

import java.util.List;

import org.springframework.data.domain.Page;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.io.datvutech.beatbuddy.api.exception.GlobalException;
import vn.io.datvutech.beatbuddy.api.global.GlobalConstant;
import vn.io.datvutech.beatbuddy.api.model.response.PageResponse.Pageable;

@Data
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class Response<T> {
    protected T data;

    @JsonInclude(Include.NON_NULL)
    protected String status;

    public static <R> Response<List<R>> successPage(Page<R> page) {
        Response<List<R>> resp = PageResponse.of(page);
        resp.status = GlobalConstant.STATUS_SUCCESS;
        return resp;
    }

    public static <R> Response<List<R>> page(Page<R> page) {
        return PageResponse.of(page);
    }

    public static <R extends Pageable> Response<R> successPage(R pageable) {
        Response<R> resp = PageResponse.of(pageable);
        resp.status = GlobalConstant.STATUS_SUCCESS;
        return resp;
    }

    public static <R> Response<R> success(R data) {
        return new Response<R>(data, GlobalConstant.STATUS_SUCCESS);
    }

    public static Response<?> errorGlobal(GlobalException e) {
        Response<?> resp = ErrorResponse.of(e);
        resp.status = GlobalConstant.STATUS_ERROR;
        return resp;
    }
}