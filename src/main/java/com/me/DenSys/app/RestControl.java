package com.me.DenSys.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@CrossOrigin()
@RestController
public class RestControl {
    @Autowired
    PatientRepository patientRepository;
    @PostMapping(path="/add/patient",
    consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity addPatient(@RequestBody Patient newPatient) {
        System.out.println("I'm trying to add");
        patientRepository.save(newPatient);
        return ResponseEntity.ok(HttpStatus.OK);
    }
    @GetMapping(path="/see/patients",
    produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> requestAllPatients() {
        //JSONObject res = new JSONObject();
        List<Patient> allPatients = patientRepository.findAll();
        return ResponseEntity.ok(allPatients);

    }
    @GetMapping(path="/see/patient/{id}",
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> patientById(@PathVariable Long id) {
        //JSONObject res = new JSONObject();
        Optional<Patient> byId = patientRepository.findById(id);
        if (byId.isPresent()) return ResponseEntity.ok(byId);
        return ResponseEntity.notFound().build();



    }
    @GetMapping("/login")
    public String Home(){
        System.out.println("I'm login");
        return "login";
    }

}
