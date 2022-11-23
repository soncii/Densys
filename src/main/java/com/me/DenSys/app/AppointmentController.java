package com.me.DenSys.app;

import com.me.DenSys.app.entities.Doctor;
import com.me.DenSys.app.entities.Specialization;
import com.me.DenSys.app.repositories.DoctorRepository;
import com.me.DenSys.app.repositories.PatientRepository;
import com.me.DenSys.app.repositories.SpecializationRepository;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@CrossOrigin()
@ComponentScan("com.me.DenSys.app")
@RestController
public class AppointmentController {

    final SpecializationRepository specializationRepository;

    final DoctorRepository doctorRepository;

    public AppointmentController(PatientRepository patientRepository, SpecializationRepository specializationRepository, DoctorRepository doctorRepository) {

        this.specializationRepository = specializationRepository;
        this.doctorRepository = doctorRepository;
    }

//    @PostMapping(path="/add/patient",
//            consumes = MediaType.APPLICATION_JSON_VALUE)
//    public ResponseEntity<Object> addPatient(@RequestBody Patient newPatient) {
//        patientRepository.save(newPatient);
//        return ResponseEntity.ok(HttpStatus.OK);
//    }
//    @GetMapping(path="/see/patients",
//            produces = MediaType.APPLICATION_JSON_VALUE)
//    public ResponseEntity<Object> requestAllPatients(@RequestParam Integer page, @RequestParam Integer perPage) {
//        Pageable of = PageRequest.of(page, perPage);
//        Page<Patient> all = patientRepository.findAll(of);
//        List<Patient> collect = all.get().collect(Collectors.toList());
//        return ResponseEntity.ok(collect);
 //   }
    @GetMapping(path="/appointment",

            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object[]> requestAllPatients() {

        List<String> specs = specializationRepository.findAll()
                .stream()
                .map(Specialization::getSpecName)
                .collect(Collectors.toList());
        List<Doctor> doctors = doctorRepository.findAll();
        List<Object[]> docNames = doctors.stream()
                .map((x)->{ return new Object[]{x.getFirstName() +' '+ x.getSurname(), x.getId()}; }).collect(Collectors.toList());
        Object[] res = {specs,docNames};
        return ResponseEntity.ok(res);
    }

//    @GetMapping(path="/specializations",
//            produces = MediaType.APPLICATION_JSON_VALUE)
//    public ResponseEntity<Object[]> requestSpecs() {
//
//        List<String> specs = specializationRepository.findAll()
//                .stream()
//                .map(Specialization::getSpecName)
//                .collect(Collectors.toList());
//        List<Doctor> doctors = doctorRepository.findAll();
//        List<Object[]> docNames = doctors.stream()
//                .map((x)->{ return new Object[]{x.getFirstName() + x.getSurname(), x.getId()}; }).collect(Collectors.toList());
//        Object[] res = {specs,docNames};
//        return ResponseEntity.ok(res);
//    }
//    @GetMapping(path="/see/patient/{id}",
//            produces = MediaType.APPLICATION_JSON_VALUE)
//    public ResponseEntity<Object> patientById(@PathVariable Long id) {
//        Optional<Patient> byId = patientRepository.findById(id);
//        if (byId.isPresent()) return ResponseEntity.ok(byId);
//        return ResponseEntity.status(404).build();
//    }
//    @PutMapping(path="/update/patient/{id}",
//            consumes = MediaType.APPLICATION_JSON_VALUE)
//    public ResponseEntity<Object> updatePatient(@RequestBody Patient newPatient, @PathVariable Long id) {
//        Optional<Patient> byId = patientRepository.findById(id);
//        if (!byId.isPresent()) return ResponseEntity.status(404).build();
//        Patient patient = byId.get();
//        patient.setaddress(newPatient.getaddress());
//        patient.setBloodGroup(newPatient.getBloodGroup());
//        patient.setEmail(newPatient.getEmail());
//        patient.setDoB(newPatient.getDoB());
//        patient.setiIN(newPatient.getiIN());
//        patient.setContactNumber(newPatient.getContactNumber());
//        patient.setEmergencyContactNumber(newPatient.getEmergencyContactNumber());
//        patient.setFirstName(newPatient.getFirstName());
//        patient.setSurname(newPatient.getSurname());
//        patient.setmiddleName(newPatient.getmiddleName());
//        patient.setMarried(newPatient.isMarried());
//        patient.setRegistrationDate(newPatient.getRegistrationDate());
//        patientRepository.save(patient);
//        return ResponseEntity.ok(HttpStatus.OK);
//    }
//
//    @GetMapping("/login")
//    public String Home(){
//        System.out.println("I'm login");
//        return "login";
//    }

}
