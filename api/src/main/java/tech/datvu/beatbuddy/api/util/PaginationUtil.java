package tech.datvu.beatbuddy.api.util;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import tech.datvu.beatbuddy.api.exception.CommonException;

public class PaginationUtil {
    public static void checkPagination(int page, int size) {
        if ((long) page * size > Integer.MAX_VALUE) {
            throw CommonException.BAD_PAGE_REQUEST.instance();
        }
    }

    public static Pageable parsePagination(int page, int size) {
        checkPagination(page, size);
        return PageRequest.of(page, size);
    }
}
