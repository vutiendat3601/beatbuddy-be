package tech.datvu.beatbuddy.api.shared.models;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class PageSortRequest extends PageRequest {
    protected String sortBy;
}
