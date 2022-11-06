package com.me.DenSys.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.persistence.EntityManager;
import java.util.List;
import java.util.Optional;

@CrossOrigin()
@RestController
public class RestControl {
    EntityManager entityManager;
    @Autowired
    PatientRepository patientRepository;
    @PostMapping(path="/add/patient",
    consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> addPatient(@RequestBody Patient newPatient) {
//        System.out.println("I'm trying to add");
        Patient Damir = new Patient();
       // entityManager.persist(newPatient);
        Damir.setaddress("Shukhov");
        entityManager.persist(Damir);
        //Damir.setId();
       // System.out.println(Damir.getId());
        patientRepository.save(newPatient);
        patientRepository.save(Damir);
        return ResponseEntity.ok(HttpStatus.OK);
    }
    @GetMapping(path="/see/patients",
    produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> requestAllPatients() {
        List<Patient> allPatients = patientRepository.findAll();
        return ResponseEntity.ok(allPatients);
    }
    @GetMapping(path="/see/patient/{id}",
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> patientById(@PathVariable Long id) {
        Optional<Patient> byId = patientRepository.findById(id);
        if (byId.isPresent()) return ResponseEntity.ok(byId);
        return ResponseEntity.status(404).build();
    }
    @GetMapping("/login")
    public String Home(){
        System.out.println("I'm login");
        return "login";
    }

}
