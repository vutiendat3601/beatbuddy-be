package vn.io.datvutech.beatbuddy.api.entity;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import jakarta.persistence.AttributeConverter;
import jakarta.persistence.Column;
import jakarta.persistence.Convert;
import jakarta.persistence.Converter;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import vn.io.datvutech.beatbuddy.api.model.RepeatMode;

@Builder
@Data
@EqualsAndHashCode(callSuper = false)
@AllArgsConstructor
@Table(name = "queues")
@Entity
public class Queue extends AbstractEntity {
    @Id
    @GeneratedValue(generator = "pg-uuid")
    private UUID id;
    @Convert(converter = UUIDListStringConverter.class)
    private List<UUID> playedTrackIds;

    @Convert(converter = UUIDListStringConverter.class)
    private List<UUID> waitingTrackIds;

    @Convert(converter = UUIDListStringConverter.class)
    @Column(name = "orig_played_track_ids")
    private List<UUID> originalPlayedTrackIds;

    @Convert(converter = UUIDListStringConverter.class)
    @Column(name = "orig_waiting_track_ids")
    private List<UUID> originalWaitingTrackIds;

    private RepeatMode repeatMode;

    private boolean isShuffled;

    public Queue() {
        playedTrackIds = List.of();
        waitingTrackIds = List.of();
        originalPlayedTrackIds = List.of();
        originalWaitingTrackIds = List.of();
        repeatMode = RepeatMode.NONE;
    }

    @Converter(autoApply = false)
    public static class UUIDListStringConverter implements AttributeConverter<List<UUID>, String> {

        @Override
        public String convertToDatabaseColumn(List<UUID> uuids) {
            String dbData = "";
            if (uuids != null && uuids.size() > 0) {
                StringBuilder dbDataBuilder = new StringBuilder();
                Iterator<UUID> uuidsIter = uuids.iterator();
                while (uuidsIter.hasNext()) {
                    UUID uuid = uuidsIter.next();
                    dbDataBuilder.append(uuid + ",");
                }
                dbData = dbDataBuilder.substring(0, dbDataBuilder.length() - 1);
            }
            return dbData;
        }

        @Override
        public List<UUID> convertToEntityAttribute(String dbData) {
            List<UUID> uuids = new ArrayList<>();
            if (dbData != null) {
                String[] tokens = dbData.split(",");
                for (String token : tokens) {
                    try {
                        UUID uuid =UUID.fromString(token);
                        uuids.add(uuid);
                    } catch (IllegalArgumentException e) {
                    }
                }
            }
            return uuids;
        }

    }
}
