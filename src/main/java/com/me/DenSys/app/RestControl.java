package com.me.DenSys.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@CrossOrigin()
@RestController
public class RestControl {

    @Autowired(required = false)
            @Qualifier("patientRepository")
    PatientRepository patientRepository;

    @PostMapping(path="/add/patient",
    consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> addPatient(@RequestBody Patient newPatient) {
        patientRepository.save(newPatient);
        return ResponseEntity.ok(HttpStatus.OK);
    }
    @GetMapping(path="/see/patients",
    produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> requestAllPatients() {
        List<Patient> allPatients = patientRepository.findAll();
        return ResponseEntity.ok(allPatients);
    }
//    @GetMapping(path="/see/doctors",
//            produces = MediaType.APPLICATION_JSON_VALUE)
//    public ResponseEntity<Object> requestAllDoctors() {
//        List<Doctor> allDoctors = doctorRepository.findAll();
//        return ResponseEntity.ok(allDoctors);
//    }
    @GetMapping(path="/see/patient/{id}",
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> patientById(@PathVariable Long id) {
        Optional<Patient> byId = patientRepository.findById(id);
        if (byId.isPresent()) return ResponseEntity.ok(byId);
        return ResponseEntity.status(404).build();
    }
//    @GetMapping(path="/see/doctor/{id}",
//            produces = MediaType.APPLICATION_JSON_VALUE)
//    public ResponseEntity<Object> doctorById(@PathVariable Long id) {
//        Optional<Doctor> byId = doctorRepository.findById(id);
//        if (byId.isPresent()) return ResponseEntity.ok(byId);
//        return ResponseEntity.status(404).build();
//    }
    @GetMapping("/login")
    public String Home(){
        System.out.println("I'm login");
        return "login";
    }

}
