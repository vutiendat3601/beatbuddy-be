package tech.datvu.beatbuddy.storage.audio;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import tech.datvu.beatbuddy.storage.audio.models.AudioSegmentRequest;
import tech.datvu.beatbuddy.storage.shared.models.Response;

@RequiredArgsConstructor
@RequestMapping(produces = MediaType.APPLICATION_JSON_VALUE)
@RestController
public class AudioController {
    private final AudioService audioService;

    @PostMapping(value = "v1/storage/audios/segment", consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Response<Boolean>> createSegment(@Valid @RequestBody AudioSegmentRequest audioSegReq) {
        boolean isSplitted = audioService.createSegment(audioSegReq);
        return ResponseEntity.ok(Response.success(isSplitted));
    }
}
