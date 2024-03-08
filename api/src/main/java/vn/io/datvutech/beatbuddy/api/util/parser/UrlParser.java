package vn.io.datvutech.beatbuddy.api.util.parser;

public interface UrlParser<T> {
    T parse(String url);
}
