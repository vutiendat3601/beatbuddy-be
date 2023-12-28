package tech.datvu.beatbuddy.storage.shared.utils;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.security.DigestInputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class FileUtil {
    public static boolean saveFile(InputStream inpStream, String filePath) {
        if (filePath == null || inpStream == null) {
            return false;
        }
        byte[] buffer = new byte[1024];
        try {
            Files.createDirectories(Path.of(filePath).getParent());
        } catch (IOException e) {
            log.error(e.getMessage(), e);
        }
        try (OutputStream outStream = new FileOutputStream(filePath)) {
            int numOfBytes = -1;
            while ((numOfBytes = inpStream.read(buffer)) != -1) {
                outStream.write(buffer, 0, numOfBytes);
            }
            return true;
        } catch (IOException e) {
            log.error(e.getMessage(), e);
        }
        return false;
    }

    public static String hashMd5(String filePath) {
        InputStream inpStream = null;
        MessageDigest md5 = null;
        try {
            inpStream = new FileInputStream(filePath);
            md5 = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException | FileNotFoundException e) {
            log.error(e.getMessage(), e);
            return null;
        }
        byte[] buffer = new byte[1024];
        try (DigestInputStream digestInpStream = new DigestInputStream(inpStream, md5)) {
            while (digestInpStream.read(buffer) != -1) {
            }
            byte[] hashMd5 = md5.digest();
            StringBuilder hexString = new StringBuilder();
            for (byte b : hashMd5) {
                hexString.append(String.format("%02x", b & 0xFF));
            }
            return hexString.toString();
        } catch (IOException e) {
            log.error(e.getMessage(), e);
        }
        return null;
    }
}
