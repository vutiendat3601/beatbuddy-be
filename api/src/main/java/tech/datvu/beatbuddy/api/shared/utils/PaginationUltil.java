package tech.datvu.beatbuddy.api.shared.utils;

import tech.datvu.beatbuddy.api.shared.global.CommonException;

public class PaginationUltil {
    public static void checkPageOffset(int page, int size) {
        if ((long) page * size > Integer.MAX_VALUE) {
            throw CommonException.BAD_PAGE_REQUEST.instance();
        }
    }
}
