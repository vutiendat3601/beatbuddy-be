package tech.datvu.beatbuddy.api.dto;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;

import lombok.Builder;
import lombok.Data;
import tech.datvu.beatbuddy.api.model.PageMetadata;

@JsonInclude(JsonInclude.Include.NON_NULL)
@Data
@Builder
public class SearchPageDto {
    private List<SearchDto<?>> items;

    private PageMetadata metadata;

    public SearchPageDto(List<SearchDto<?>> items, PageMetadata metadata) {
        this.items = items;
        this.metadata = metadata;
    }
}
