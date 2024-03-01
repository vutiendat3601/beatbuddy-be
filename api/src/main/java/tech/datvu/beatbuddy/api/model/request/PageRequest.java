package tech.datvu.beatbuddy.api.model.request;

import org.hibernate.validator.constraints.Range;

import lombok.Data;

@Data
public class PageRequest {
    @Range(min = 0, max = Integer.MAX_VALUE)
    protected int page;

    @Range(min = 1, max = 50)
    protected int size;

    public PageRequest() {
        size = 10;
    }
}
