package vn.io.datvutech.beatbuddy.api.controller;

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
import vn.io.datvutech.beatbuddy.api.dto.TrackDto;
import vn.io.datvutech.beatbuddy.api.dto.TrackStreamDto;
import vn.io.datvutech.beatbuddy.api.model.response.Response;
import vn.io.datvutech.beatbuddy.api.service.TrackService;

@RestController
@RequiredArgsConstructor
@RequestMapping(value = "v1/tracks", produces = MediaType.APPLICATION_JSON_VALUE)
public class TrackController {
    private final TrackService trackService;

    /* #: Public */
    @GetMapping("{trackId}")
    public ResponseEntity<Response<TrackDto>> getTrack(@PathVariable UUID trackId) {
        TrackDto trackDto = trackService.getTrack(trackId);
        trackService.increaseSearchPriority(trackId);
        return ResponseEntity.ok(Response.success(trackDto));
    }

    @GetMapping
    public ResponseEntity<Response<List<TrackDto>>> getSeveralTracks(@RequestParam("ids") Set<UUID> trackIds) {
        List<TrackDto> trackDtos = trackService.getTracks(trackIds);
        return ResponseEntity.ok(Response.success(trackDtos));
    }
    /* # Public */

    @GetMapping(value = "{trackId}/stream")
    public ResponseEntity<Response<TrackStreamDto>> getTrackStream(@PathVariable UUID trackId) {
        TrackStreamDto trackStreamDto = trackService.getTrackStream(trackId);
        trackService.increaseSearchPriority(trackId);
        return ResponseEntity.ok(Response.success(trackStreamDto));
    }

}
