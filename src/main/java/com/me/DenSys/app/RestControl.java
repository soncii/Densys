package com.me.DenSys.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@CrossOrigin()
@Controller
public class RestControl {
    @Autowired
    PatientRepository patientRepository;
    @PostMapping(path="/add/patient",
    consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity Index(@RequestBody Patient newPatient) {
        System.out.println("I'm trying to add");
        patientRepository.save(newPatient);
        ResponseEntity Damir = ResponseEntity.ok(HttpStatus.OK);
        return Damir;
    }
    @GetMapping("/add/patient")
    public String Index1() {
        return "login";
    }
    @GetMapping("/login")
    public String Home(){
        System.out.println("I'm login");
        return "login";
    }

}
