package com.me.DenSys.app;

import com.me.DenSys.app.entities.Doctor;
import com.me.DenSys.app.entities.ScheduleDetails;
import com.me.DenSys.app.entities.Specialization;
import com.me.DenSys.app.repositories.DoctorRepository;
import com.me.DenSys.app.repositories.PatientRepository;
import com.me.DenSys.app.repositories.ScheduleRepository;
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
    final ScheduleRepository scheduleRepository;

    public AppointmentController(PatientRepository patientRepository, SpecializationRepository specializationRepository, DoctorRepository doctorRepository, ScheduleRepository scheduleRepository) {

        this.specializationRepository = specializationRepository;
        this.doctorRepository = doctorRepository;
        this.scheduleRepository = scheduleRepository;
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
    @PostMapping(value = "/save/schedule",
    consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> saveSchedule(@RequestBody List<ScheduleDetails> scheduleDetails){
            //accept as array
            scheduleRepository.saveAll(scheduleDetails);
            return ResponseEntity.ok().body(scheduleDetails);

    }
    @GetMapping(value = "/see/schedules/all",
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> seeSchedules(){
        return ResponseEntity.ok(scheduleRepository.findAll());
    }

    @GetMapping(value = "see/specialization/all",
    produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> seeSpecs(){
        return ResponseEntity.ok(specializationRepository.findAll());
    }

    @GetMapping(value="/appointment/specialization/{spec}",
    produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> seeDoctorsSpec(@PathVariable("spec")
                                                 String spec)
                                                             {
        return ResponseEntity.ok(doctorRepository.findAllBySpecializationId(spec));
    }


}
