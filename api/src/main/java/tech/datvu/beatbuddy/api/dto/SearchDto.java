package tech.datvu.beatbuddy.api.dto;

import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import com.fasterxml.jackson.annotation.JsonValue;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@JsonPropertyOrder("id")
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class SearchDto<T> {
    @JsonValue
    private T data;
}