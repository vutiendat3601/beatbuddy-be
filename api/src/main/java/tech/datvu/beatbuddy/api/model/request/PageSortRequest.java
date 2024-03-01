package tech.datvu.beatbuddy.api.model.request;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class PageSortRequest extends PageRequest {
    protected String sortBy;
}
