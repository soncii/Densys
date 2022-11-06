package com.me.DenSys.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@CrossOrigin()
@ComponentScan("com.me.DenSys.app")
@RestController
public class RestControlDoctor {
    @Autowired(required = false)
    DoctorRepository doctorRepository;

    @PostMapping(path = "/add/doctor",
            consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> addDoctor(@RequestBody Doctor newDoctor) {
        doctorRepository.save(newDoctor);
        return ResponseEntity.ok(HttpStatus.OK);
    }

    @GetMapping(path = "/see/doctors/all",
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> requestAllDoctors() {
        List<Doctor> allDoctors = doctorRepository.findAll();
        return ResponseEntity.ok(allDoctors);
    }
    @GetMapping(path="/see/doctors",
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> requestAllPatients(@RequestParam Integer page, @RequestParam Integer perPage) {
        Pageable of = PageRequest.of(page, perPage);
        List<Doctor> allPatients = (List<Doctor>) doctorRepository.findAll(of);
        return ResponseEntity.ok(allPatients);
    }

    @GetMapping(path = "/see/doctor/{id}",
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> doctorById(@PathVariable Long id) {
        Optional<Doctor> byId = doctorRepository.findById(id);
        if (byId.isPresent()) return ResponseEntity.ok(byId);
        return ResponseEntity.status(404).build();
    }

    @PutMapping(path = "/update/doctor/{id}",
            consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> updateDoctor(@RequestBody Doctor newDoctor, @PathVariable Long id) {
        Optional<Doctor> byId = doctorRepository.findById(id);
        if (!byId.isPresent()) return ResponseEntity.status(404).build();
        Doctor doc = byId.get();
        doc.setAddress(newDoctor.getAddress());
        doc.setDegree(newDoctor.getDegree());
        doc.setExperience(newDoctor.getExperience());
        doc.setDoB(newDoctor.getDoB());
        doc.setiIN(newDoctor.getiIN());
        doc.setContactNumber(newDoctor.getContactNumber());
        doc.setPrice(newDoctor.getPrice());
        doc.setRating(newDoctor.getRating());
        doc.setDepartmentId(newDoctor.getDepartmentId());
        doc.setScheduleDetails(newDoctor.getScheduleDetails());
        doc.setFirstName(newDoctor.getFirstName());
        doc.setMiddleName(newDoctor.getMiddleName());
        doc.setSurname(newDoctor.getSurname());
        doctorRepository.save(doc);
        return ResponseEntity.ok(HttpStatus.OK);
    }
}
