package com.me.DenSys.app.DoctorPicture;

import com.me.DenSys.app.entities.FileDB;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import javax.transaction.Transactional;
import java.util.List;
import java.util.stream.Collectors;


@Controller
@CrossOrigin()
public class FileController {

    @Autowired
    private FileStorageService storageService;
    Logger logger = LoggerFactory.getLogger(FileController.class);
    @PostMapping("/upload")
    public ResponseEntity<ResponseMessage> uploadFile(@RequestParam("file") MultipartFile file) {
        String message = "";
        try {
            FileDB stored = storageService.store(file);

            message = "https://calm-thicket-13954.herokuapp.com/files/" + stored.getId();
            return ResponseEntity.status(HttpStatus.OK).body(new ResponseMessage(message));
        } catch (Exception e) {
            message = "Could not upload the file: " + file.getOriginalFilename() + "!";
            return ResponseEntity.status(HttpStatus.EXPECTATION_FAILED).body(new ResponseMessage(message));
        }
    }

    @GetMapping("/files")
    public ResponseEntity<List<ResponseFile>> getListFiles() {
        List<ResponseFile> files = storageService.getAllFiles().map(dbFile -> {
            String fileDownloadUri = ServletUriComponentsBuilder
                    .fromCurrentContextPath()
                    .path("/files/")
                    .path(dbFile.getId())
                    .toUriString();

            return new ResponseFile(
                    dbFile.getName(),
                    fileDownloadUri,
                    dbFile.getType(),
                    dbFile.getData().length);
        }).collect(Collectors.toList());

        return ResponseEntity.status(HttpStatus.OK).body(files);
    }

    @GetMapping("/files/{id}")
    @Transactional
    public ResponseEntity<byte[]> getFile(@PathVariable String id) {
        HttpHeaders headers =new HttpHeaders();
        headers.setContentType(MediaType.parseMediaType("image/jpg"));

        logger.info(String.valueOf(id.getClass()));
        logger.info(id);
        try {
            FileDB fileDB = storageService.getFile(id);
            if (fileDB==null) logger.error("QUERY RESULTED IN ERROR");
            headers.add("Content-Disposition", "inline; filename=\"" + fileDB.getName()+"\"");
            logger.info(fileDB.getName());
            return ResponseEntity.ok().headers(headers)
                    .body(fileDB.getData());
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return ResponseEntity.ok().build();
    }
}