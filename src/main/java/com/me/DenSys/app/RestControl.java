package com.me.DenSys.app;

import com.me.DenSys.app.DTO.LoginDetails;
import com.me.DenSys.app.entities.Patient;
import com.me.DenSys.app.repositories.DoctorRepository;
import com.me.DenSys.app.repositories.PatientRepository;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@CrossOrigin()
@ComponentScan("com.me.DenSys.app")
@RestController
public class RestControl {
    final
    PatientRepository patientRepository;
    final
    DoctorRepository doctorRepository;

    public RestControl(PatientRepository patientRepository, DoctorRepository doctorRepository) {
        this.patientRepository = patientRepository;
        this.doctorRepository = doctorRepository;
    }

    @GetMapping(path="/get/login",
    consumes = MediaType.APPLICATION_JSON_VALUE,
    produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> loginD(@RequestBody LoginDetails details){
        if (patientRepository.nativeFind(details.getLogin(),details.getPassword()).isPresent()){
            return ResponseEntity.ok(patientRepository.nativeFind(details.getLogin(),details.getPassword()).get());
        } else if (doctorRepository.findNative(details.getLogin(),details.getPassword()).isPresent()) {
            return ResponseEntity.ok(doctorRepository.findNative(details.getLogin(),details.getPassword()).get());
        } else
            return ResponseEntity.status(404).body(details);
    }

    @PostMapping(path="/add/patient",
    consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> addPatient(@RequestBody Patient newPatient) {
        patientRepository.save(newPatient);
        return ResponseEntity.ok(HttpStatus.OK);
    }
    @GetMapping(path="/see/patients",
    produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> requestAllPatients(@RequestParam Integer page, @RequestParam Integer perPage) {
        Pageable of = PageRequest.of(page, perPage);
        Page<Patient> all = patientRepository.findAll(of);
        List<Patient> collect = all.get().collect(Collectors.toList());
        return ResponseEntity.ok(collect);
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
        patient.setBloodGroup(newPatient.getBloodGroup());
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
