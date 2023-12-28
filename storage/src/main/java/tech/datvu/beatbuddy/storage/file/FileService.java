package tech.datvu.beatbuddy.storage.file;

import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.logging.Logger;

import tech.datvu.beatbuddy.storage.file.models.FileDto;
import tech.datvu.beatbuddy.storage.file.models.FileRequest;

public interface FileService {
    public FileDto createFile(FileRequest fileReq);

    default void saveFile(InputStream inpStream, String outFile) {
        Path outFilePath = Path.of(outFile);
        try (FileOutputStream fileOutStream = new FileOutputStream(outFile)) {
            if (Files.notExists(outFilePath)) {
                Files.createFile(outFilePath);
            }
            fileOutStream.write(inpStream.readAllBytes());
        } catch (IOException e) {
            Logger.getGlobal().warning(e.getMessage());
        }
    }

    public static void main(String[] args) {
        // String outDir = "/home/vutiendat3601/test/output/o1";
        String outFile = "/home/vutiendat3601/test/output/o1/test.txt";
        // Path outDirPath = Path.of(outDir);
        // Path outFilePath = Path.of(outDir);
        // try {
        //     if (Files.notExists(outDirPath)) {
        //         Files.createDirectories(outDirPath);
        //     }
            // if (Files.notExists(outFilePath)) {
            //     Files.createFile(outFilePath);
            // }
        // } catch (IOException e) {
        //     e.printStackTrace();
        // }
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(outFile))) {
            bw.write("haha");
        } catch (IOException e) {
            Logger.getGlobal().warning(e.getMessage());
        }
    }
}
