package vn.io.datvutech.beatbuddy.api.util.parser;

import static org.springframework.data.domain.Sort.Direction.DESC;

import java.util.Arrays;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import org.springframework.data.domain.Sort;

public class SortParser {
    public static Sort parseQueryParam(String sortByParam, String[] entityFields) {
        final List<String> asc = new LinkedList<>();
        final List<String> desc = new LinkedList<>();
        Set<String> entityFieldsSet = entityFields == null ? new HashSet<>()
                : new HashSet<>(Arrays.asList(entityFields));
        if (sortByParam != null && entityFields != null) {
            String[] sortCriterias = sortByParam.split(",");
            Set<String> parsedParams = new HashSet<>();
            for (String criteria : sortCriterias) {
                String[] token = criteria.split(":");
                if (entityFieldsSet.contains(token[0]) && !parsedParams.contains(token[0])) {
                    parsedParams.add(token[0]);
                    if (token.length == 2 && token[1].equalsIgnoreCase("desc")) {
                        desc.add(token[0]);
                    } else {
                        asc.add(token[0]);
                    }
                }
            }
        }
        Sort sort = asc.isEmpty() ? Sort.unsorted() : Sort.by(asc.toArray(String[]::new));
        sort = desc.isEmpty() ? sort : sort.and(Sort.by(DESC, desc.toArray(String[]::new)));
        return sort;
    }
}
