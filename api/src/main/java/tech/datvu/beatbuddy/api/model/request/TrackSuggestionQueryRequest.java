package tech.datvu.beatbuddy.api.model.request;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import lombok.Data;
import lombok.EqualsAndHashCode;
import tech.datvu.beatbuddy.api.util.validation.IsoDate;

@EqualsAndHashCode(callSuper = true)
@Data
public class TrackSuggestionQueryRequest extends PageSortRequest {
    @IsoDate
    private String fromDate;

    @IsoDate
    private String toDate;

    private String q;

    public TrackSuggestionQueryRequest() {
        super();
        fromDate = "1970-01-01";
        toDate = DateTimeFormatter.ofPattern("yyyy-MM-dd")
                .format(LocalDate.now());
        q = "";
    }
}
