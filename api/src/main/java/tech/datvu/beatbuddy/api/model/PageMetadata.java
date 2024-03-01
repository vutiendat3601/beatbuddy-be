package tech.datvu.beatbuddy.api.model;

import org.springframework.data.domain.Page;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class PageMetadata {
    private int size;
    private int page;
    private int totalPages;
    private int numOfElements;
    private long totalElements;

    public static <R> PageMetadata of(Page<R> page) {
        return new PageMetadata(
                page.getSize(),
                page.getNumber(),
                page.getTotalPages(),
                page.getNumberOfElements(),
                page.getTotalElements());
    }
}