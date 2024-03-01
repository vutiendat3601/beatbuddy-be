package tech.datvu.beatbuddy.api.util;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class ObjectMapperUtil {
    public static final ObjectMapper objMapper = new ObjectMapper();

    public static String writeValueAsString(Object value) {
        try {
            return objMapper.writeValueAsString(value);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            return null;
        }
    }
}
