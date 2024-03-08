package vn.io.datvutech.beatbuddy.api.model.request;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import lombok.Data;
import lombok.EqualsAndHashCode;
import vn.io.datvutech.beatbuddy.api.util.validation.IsoDate;

@Data
@EqualsAndHashCode(callSuper = true)
public class PlaylistQueryRequest extends PageSortRequest {
    @IsoDate
    private String fromDate;

    @IsoDate
    private String toDate;

    private String q;

    public PlaylistQueryRequest() {
        super();
        fromDate = "1970-01-01";
        toDate = DateTimeFormatter.ofPattern("yyyy-MM-dd")
                .format(LocalDate.now());
        q = "";
    }
}
