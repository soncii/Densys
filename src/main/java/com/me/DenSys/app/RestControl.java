package com.me.DenSys.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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
    @GetMapping(path="/see/patients/",
    produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> requestAllPatients(@RequestParam Integer page, @RequestParam Integer perPage) {
        Pageable of = PageRequest.of(page, perPage);
        List<Patient> allPatients = (List<Patient>) patientRepository.findAll(of);
        return ResponseEntity.ok(allPatients);
    }
    @GetMapping(path="/see/patients/all",
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> requestAllPatients() {
        List<Patient> allPatients =patientRepository.findAll();
        return ResponseEntity.ok(allPatients);
    }
    @GetMapping(path="/see/patient/{id}",
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> patientById(@PathVariable Long id) {
        Optional<Patient> byId = patientRepository.findById(id);
        if (byId.isPresent()) return ResponseEntity.ok(byId);
        return ResponseEntity.status(404).build();
    }
    @PutMapping(path="/update/patient/{id}",
    consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> updatePatient(@RequestBody Patient newPatient, @PathVariable Long id) {
        Optional<Patient> byId = patientRepository.findById(id);
        if (!byId.isPresent()) return ResponseEntity.status(404).build();
        Patient patient = byId.get();
        patient.setaddress(newPatient.getaddress());
        patient.setbloodGroup(newPatient.getbloodGroup());
        patient.setEmail(newPatient.getEmail());
        patient.setDoB(newPatient.getDoB());
        patient.setiIN(newPatient.getiIN());
        patient.setContactNumber(newPatient.getContactNumber());
        patient.setEmergencyContactNumber(newPatient.getEmergencyContactNumber());
        patient.setFirstName(newPatient.getFirstName());
        patient.setSurname(newPatient.getSurname());
        patient.setmiddleName(newPatient.getmiddleName());
        patient.setMarried(newPatient.isMarried());
        patient.setRegistrationDate(newPatient.getRegistrationDate());
        patientRepository.save(patient);
        return ResponseEntity.ok(HttpStatus.OK);
    }

    @GetMapping("/login")
    public String Home(){
        System.out.println("I'm login");
        return "login";
    }

}
