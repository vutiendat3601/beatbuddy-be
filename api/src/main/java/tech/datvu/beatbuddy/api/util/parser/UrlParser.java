package tech.datvu.beatbuddy.api.util.parser;

public interface UrlParser<T> {
    T parse(String url);
}
