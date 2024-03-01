package tech.datvu.beatbuddy.api.audio.impl;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertThrowsExactly;

import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;

import tech.datvu.beatbuddy.api.exception.GlobalException;
import tech.datvu.beatbuddy.api.exception.YouTubeException;
import tech.datvu.beatbuddy.api.model.YouTubeMetadata;
import tech.datvu.beatbuddy.api.service.YouTubeService;
import tech.datvu.beatbuddy.api.service.impl.YouTubeServiceImpl;

public class YouTubeServiceImplTest {

    private YouTubeService ytService;

    public YouTubeServiceImplTest() {
        ytService = new YouTubeServiceImpl();
    }

    @ValueSource(strings = { "https://youtu.be/xOmLxNyXc6o" }) // Public videos
    @ParameterizedTest
    public void testFetchMetadata(String url) {
        YouTubeMetadata ytMetadata = ytService.fetchMetadata(url);
        assertNotNull(ytMetadata);
    }

    @ValueSource(strings = { "https://youtu.be/e0E0J5JHBxI" }) // Blocked videos
    @ParameterizedTest
    public void testFetchMetadataFail(String url) {
        assertThrowsExactly(
                GlobalException.class,
                () -> ytService.fetchMetadata(url),
                YouTubeException.FETCH_ERROR.instance().getMessage());
    }

    @ValueSource(strings = { "https://www.facebook.com/vtvcab/posts/pfbid02yUUjeK3Q2ipAnGT7dErQmFmehapayYcXS1hEkCcQoNKn3y3VP3u3kJ6VRdDWGJegl" }) // Blocked videos
    @ParameterizedTest
    public void testFetchMetadataFailInvalidUrl(String url) {
        assertThrowsExactly(
                GlobalException.class,
                () -> ytService.fetchMetadata(url),
                YouTubeException.FETCH_ERROR.instance().getMessage());
    }
}
