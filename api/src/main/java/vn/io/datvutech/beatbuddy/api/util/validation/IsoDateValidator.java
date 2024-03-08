package vn.io.datvutech.beatbuddy.api.util.validation;

import java.util.Calendar;
import java.util.GregorianCalendar;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class IsoDateValidator implements ConstraintValidator<IsoDate, String> {
    private static final String REGEX = "\\d{4}(?:-(0[1-9]|1[0-2])(?:-(0[1-9]|[1-2][0-9]|3[0-1]))?)?";

    @Override
    public boolean isValid(String date, ConstraintValidatorContext context) {
        if (date != null) {
            if (date.matches(REGEX)) {
                String[] tokens = date.split("-");
                int month = 1;
                int dayOfMonth = 1;
                if (tokens.length > 1) {
                    month = Integer.parseInt(tokens[1]) - 1;
                } else {
                    return true;
                }
                if (tokens.length > 2) {
                    dayOfMonth = Integer.parseInt(tokens[2]);
                } else {
                    return Calendar.JANUARY <= month && month <= Calendar.DECEMBER;
                }
                int year = Integer.parseInt(tokens[0]);
                GregorianCalendar calendar = new GregorianCalendar();
                calendar.setLenient(false);
                calendar.set(Calendar.YEAR, year);
                calendar.set(Calendar.MONTH, month);
                calendar.set(Calendar.DAY_OF_MONTH, dayOfMonth);
                try {
                    calendar.getTime();
                    return true;
                } catch (Exception e) {
                    return false;
                }
            } else {
                return false;
            }
        }
        return true;
    }
}
