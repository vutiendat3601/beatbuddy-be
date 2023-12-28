package tech.datvu.beatbuddy.api.shared.models;

import org.hibernate.validator.constraints.Range;

import lombok.Data;

@Data
public class PageRequest {
    @Range(min = 0, max = Integer.MAX_VALUE)
    protected int page;

    @Range(min = 1, max = 100)
    protected int size;

    public PageRequest() {
        size = 10;
    }
}
