package tech.datvu.beatbuddy.api.model.request;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class PageSortRequest extends PaginationRequest {
    protected String sortBy;
}
