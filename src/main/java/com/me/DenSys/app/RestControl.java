package com.me.DenSys.app;

import org.apache.coyote.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;


@Controller
public class RestControl {
    @Autowired
    PatientRepository patientRepository;
    @PostMapping(path="/add/patient",
    consumes = MediaType.APPLICATION_JSON_VALUE)
    public Response Index(@RequestBody Patient newPatient) {
        System.out.println("I'm trying to add");
        patientRepository.save(newPatient);
        Response response = new Response();
        response.setStatus(201);
        return response;
        //return "login";
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
