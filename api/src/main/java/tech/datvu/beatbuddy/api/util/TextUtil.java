package tech.datvu.beatbuddy.api.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.Normalizer;
import java.util.logging.Logger;

public class TextUtil {
    private static final String CHARS = "ABCDEFGHIJKLMNPQRSTUVWXYZabcdefghijklmnpqrstuvwxyz01234567890_";

    public static String makeRandomString(int length) {
        StringBuilder result = new StringBuilder("");
        for (int i = 0; i < length; i++) {
            int index = (int) Math.floor(Math.random() * length);
            result.append(CHARS.charAt(index));
        }
        return result.toString();
    }

    public static String hashMd5(String text) {
        try {
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            md5.update(text.getBytes());
            byte[] hashedBytes = md5.digest();
            StringBuilder hashMd5 = new StringBuilder();
            for (byte b : hashedBytes) {
                hashMd5.append(String.format("%02x", b));
            }
            return hashMd5.toString();
        } catch (NoSuchAlgorithmException e) {
            Logger.getGlobal().warning(e.getMessage());
        }
        return null;
    }

    public static String removeAccents(String text) {
        if (text != null) {
            String regex = "\\p{InCombiningDiacriticalMarks}+";
            String decomposed = Normalizer.normalize(text, Normalizer.Form.NFKD);
            return decomposed.replaceAll(regex, "")
                    .replaceAll("Đ", "D")
                    .replaceAll("đ", "d");
        }
        return null;
    }
}
