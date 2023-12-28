package tech.datvu.beatbuddy.api.audio.models;

import java.io.IOException;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonAlias;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JacksonException;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import lombok.Data;

@JsonIgnoreProperties(ignoreUnknown = true)
@Data
public class YouTubeMetadata implements Serializable {
    private String id;

    private String title;

    private String thumbnail;

    private String description;

    @JsonAlias("duration")
    private long durationSec;

    private List<String> categories;

    @JsonAlias("upload_date")
    @JsonDeserialize(using = YouTubeMetadata.DateDeserializer.class)
    private LocalDate uploadDate;

    @JsonAlias("channel_id")
    private String chanelId;

    @JsonAlias("original_url")
    private String originalUrl;

    public static class DateDeserializer extends JsonDeserializer<LocalDate> {
        private static final DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern("yyyyMMdd");

        @Override
        public LocalDate deserialize(JsonParser p, DeserializationContext context)
                throws IOException, JacksonException {
            String dateStr = p.getText();
            return LocalDate.parse(dateStr, DATE_FORMATTER);
        }
    }
}
