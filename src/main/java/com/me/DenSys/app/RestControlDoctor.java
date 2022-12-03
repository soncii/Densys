package com.me.DenSys.app;

import com.me.DenSys.app.entities.Doctor;
import com.me.DenSys.app.entities.Patient;
import com.me.DenSys.app.entities.Specialization;
import com.me.DenSys.app.repositories.DoctorRepository;
import com.me.DenSys.app.repositories.PatientRepository;
import com.me.DenSys.app.repositories.SpecializationRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@CrossOrigin()
@ComponentScan("com.me.DenSys.app")
@RestController
public class RestControlDoctor {
    final
    DoctorRepository doctorRepository;
    final
    SpecializationRepository specializationRepository;
    final PatientRepository patientRepository;
    Logger logger = LoggerFactory.getLogger(RestControlDoctor.class);


    public RestControlDoctor(DoctorRepository doctorRepository, SpecializationRepository specializationRepository, PatientRepository patientRepository) {
        this.doctorRepository = doctorRepository;
        this.specializationRepository = specializationRepository;
        this.patientRepository = patientRepository;
    }

    @PostMapping(path = "/add/doctor",
            consumes = MediaType.APPLICATION_JSON_VALUE)
    @Transactional
    public ResponseEntity<Object> addDoctor(@RequestBody Doctor newDoctor) {
        doctorRepository.save(newDoctor);
        if (!specializationRepository.findById(newDoctor.getSpecializationId()).isPresent())
            specializationRepository.save(new Specialization(newDoctor.getSpecializationId()));
        return ResponseEntity.ok(HttpStatus.OK);
    }
    @PostMapping(path="/add/patient",
            consumes = MediaType.APPLICATION_JSON_VALUE)
    @Transactional
    public ResponseEntity<Object> addPatient(@RequestBody Patient newPatient) {
        logger.info(String.valueOf(newPatient));
        try {
            patientRepository.save(newPatient);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }

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
        Page<Doctor> all = doctorRepository.findAll(of);
        List<Doctor> collect = all.get().collect(Collectors.toList());
        return ResponseEntity.ok(collect);
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
