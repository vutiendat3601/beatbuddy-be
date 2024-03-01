package tech.datvu.beatbuddy.api.controller;

import java.util.List;
import java.util.Set;
import java.util.UUID;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import tech.datvu.beatbuddy.api.dto.TrackDto;
import tech.datvu.beatbuddy.api.dto.TrackStreamDto;
import tech.datvu.beatbuddy.api.model.response.Response;
import tech.datvu.beatbuddy.api.service.TrackService;

@RestController
@RequiredArgsConstructor
@RequestMapping(value = "v1/tracks", produces = MediaType.APPLICATION_JSON_VALUE)
public class TrackController {
    private final TrackService trackService;

    /* #: Public */
    @GetMapping("{id}")
    public ResponseEntity<Response<TrackDto>> getTrack(@PathVariable("id") UUID trackId) {
        TrackDto trackDto = trackService.getTrack(trackId);
        return ResponseEntity.ok(Response.success(trackDto));
    }

    @GetMapping
    public ResponseEntity<Response<List<TrackDto>>> getSeveralTracks(@RequestParam("ids") Set<UUID> trackIds) {
        List<TrackDto> trackDtos = trackService.getTracks(trackIds);
        return ResponseEntity.ok(Response.success(trackDtos));
    }
    /* # Public */

    @GetMapping(value = "{id}/stream")
    public ResponseEntity<Response<TrackStreamDto>> getTrackStream(@PathVariable("id") UUID trackId) {
        TrackStreamDto trackStreamDto = trackService.getStream(trackId);
        return ResponseEntity.ok(Response.success(trackStreamDto));
    }

}
