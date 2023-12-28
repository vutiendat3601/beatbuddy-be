package tech.datvu.beatbuddy.api.audio;

import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;

public class YouTubeServiceTest {

    @ValueSource(strings = {"https://youtu.be/playl1glokQi3N2_8u2OVXbLrv37yDbGfe&si=Hgt0qAk0lTb0b7B9"})
    @ParameterizedTest
    public void testIsYouTubeUrl(String url) {
        
    }
}
