package vn.io.datvutech.beatbuddy.api.service;

import static vn.io.datvutech.beatbuddy.api.global.GlobalConstant.STORAGE_DIR;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.logging.Logger;

import org.springframework.scheduling.annotation.Async;

import vn.io.datvutech.beatbuddy.api.util.FileUtil;

@Async("backgroundTask")
public interface FileServiceAsync {

    /*
     * Save to local disk
     */
    static void saveFileToLocal(
            InputStream inpStream,
            String outFile,
            boolean replaceIfExist) {
        final String LOCAL_OUT_FILE = STORAGE_DIR + outFile;
        if (replaceIfExist) {
            try {
                Files.deleteIfExists(Path.of(LOCAL_OUT_FILE));
            } catch (IOException e) {
                Logger.getGlobal().warning(e.getMessage());
            }
        }
        if (Files.notExists(Path.of(LOCAL_OUT_FILE))) {
            FileUtil.saveToLocal(inpStream, LOCAL_OUT_FILE);
        }
    }
}
