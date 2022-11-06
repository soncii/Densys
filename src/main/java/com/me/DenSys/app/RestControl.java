package com.me.DenSys.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin()
@RestController
public class RestControl {
    @Autowired
    PatientRepository patientRepository;
    @PostMapping(path="/add/patient",
    consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity Index(@RequestBody Patient newPatient) {
        System.out.println("I'm trying to add");
        patientRepository.save(newPatient);
        return ResponseEntity.ok(HttpStatus.OK);
    }
    @GetMapping(name="/see/patients",
    produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> Index1() {
        //JSONObject res = new JSONObject();
        List<Patient> allPatients = patientRepository.findAll();
        return ResponseEntity.ok(allPatients);

    }
    @GetMapping("/login")
    public String Home(){
        System.out.println("I'm login");
        return "login";
    }

}
