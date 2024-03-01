package tech.datvu.beatbuddy.api.util;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import lombok.RequiredArgsConstructor;
import tech.datvu.beatbuddy.api.entity.TrackSuggestion;
import tech.datvu.beatbuddy.api.model.YouTubeMetadata;
import tech.datvu.beatbuddy.api.repository.TrackSuggestionRepository;
import tech.datvu.beatbuddy.api.service.AudioServiceAsync;
import tech.datvu.beatbuddy.api.service.YouTubeService;
import tech.datvu.beatbuddy.api.util.parser.ParsableUrl;
import tech.datvu.beatbuddy.api.util.parser.UrlParser;
import tech.datvu.beatbuddy.api.util.parser.impl.YoutubeUrlParser;

@RequiredArgsConstructor
@Async
@Component
public class TrackSuggestionUrlProcessor {
    private final TrackSuggestionRepository trackSuggRepo;

    private List<UrlParser<? extends ParsableUrl>> URL_PARSERS;
    private final AudioServiceAsync audioServiceAsync;
    private final YouTubeService ytService;

    {
        URL_PARSERS = new ArrayList<>();
        URL_PARSERS.add(new YoutubeUrlParser());
    }

    public void process(UUID trackSuggId, String url) {
        for (UrlParser<? extends ParsableUrl> urlParser : URL_PARSERS) {
            ParsableUrl parsedUrl = urlParser.parse(url);
            if (parsedUrl != null) {
                if (parsedUrl.getType() != null) {
                    TrackSuggestion trackSugg = trackSuggRepo.findById(trackSuggId)
                            .orElse(null);
                    if (trackSugg != null) {
                        String audioRefCode = parsedUrl.getType().value() + "_" + parsedUrl.getId();
                        trackSugg.setAudioRefCode(audioRefCode);
                        extractAudio(parsedUrl, trackSugg);

                        UserContext.setUsername(UserContext.BOT);
                        trackSuggRepo.save(trackSugg);
                    }
                }
                break;
            }
        }
    }

    public void extractAudio(ParsableUrl parsedUrl, TrackSuggestion trackSugg) {
        switch (parsedUrl.getType()) {
            case YOUTUBE:
                YouTubeMetadata ytMetadata = ytService.fetchMetadata(parsedUrl.getUrl());
                if (ytMetadata != null) {
                    audioServiceAsync.saveYouTubeAudio(parsedUrl.getUrl(), trackSugg.getAudioRefCode());
                    if (trackSugg.getThumbnail() == null) {
                        trackSugg.setThumbnail(ytMetadata.getThumbnail());
                    }
                    if (!StringUtils.hasText(trackSugg.getReleasedDate())) {
                        trackSugg.setReleasedDate(ytMetadata.getUploadDate() + "");
                    }
                    trackSugg.setTags(ytMetadata.getTitle());
                }
                break;

            default:
        }
    }
}
