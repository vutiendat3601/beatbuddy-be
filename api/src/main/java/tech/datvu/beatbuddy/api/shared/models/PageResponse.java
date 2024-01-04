package tech.datvu.beatbuddy.api.shared.models;

import java.util.List;

import org.springframework.data.domain.Page;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor(access = AccessLevel.PRIVATE)
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class PageResponse<T> extends Response<T> {
    private PageMetadata metadata;

    public static <R> Response<List<R>> of(Page<R> page) {
        Response<List<R>> resp = new PageResponse<>(PageMetadata.of(page));
        resp.setData(page.getContent());
        return resp;
    }

    public static <R extends Pageable> Response<R> of(R page) {
        Response<R> resp = new PageResponse<>(page.getMetadata());
        resp.setData(page);
        return resp;
    }

    public static interface Pageable {
        PageMetadata getMetadata();
    }
}
