package com.me.DenSys.app;

import com.me.DenSys.app.entities.Appointment;
import com.me.DenSys.app.entities.Doctor;
import com.me.DenSys.app.entities.ScheduleDetails;
import com.me.DenSys.app.entities.Specialization;
import com.me.DenSys.app.repositories.*;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

@CrossOrigin()
@ComponentScan("com.me.DenSys.app")
@RestController
public class AppointmentController {

    final SpecializationRepository specializationRepository;

    final DoctorRepository doctorRepository;
    final ScheduleRepository scheduleRepository;
    final AppointmentRepository appointmentRepository;

    public AppointmentController(PatientRepository patientRepository, SpecializationRepository specializationRepository, DoctorRepository doctorRepository, ScheduleRepository scheduleRepository, AppointmentRepository appointmentRepository) {

        this.specializationRepository = specializationRepository;
        this.doctorRepository = doctorRepository;
        this.scheduleRepository = scheduleRepository;
        this.appointmentRepository = appointmentRepository;
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
    @PostMapping(value = "/save/appointment",
            consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> saveApp(@RequestBody Appointment appointment){
        //accept as array
        appointmentRepository.save(appointment);
        return ResponseEntity.ok(appointment);

    }
    @GetMapping(value = "/see/schedules/all",
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> seeSchedules(){

        return ResponseEntity.ok(scheduleRepository.findAll());
    }

    @GetMapping(value = "see/schedule/{IIN}",
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> docSchedule(
            @RequestParam("IIN") String iin
    ){
        LocalDate now = LocalDate.now();
        List<ScheduleDetails> scheduleDetails = scheduleRepository.findAllByDoctorIIN(iin);
        List<Appointment> appointments = appointmentRepository.findAllByDoctorIIN(iin);
        List<ScheduleDetails> res = new ArrayList<>();
        for (int i=1; i<=7; i++) {
            Integer d = (now.getDayOfWeek().getValue()+i)%8;
            if (d==0) d++;
            final int day = d;
            List<ScheduleDetails> curSch = scheduleDetails.stream().filter(x -> Objects.equals(x.weekDay, day)).collect(Collectors.toList());
            if (curSch.isEmpty()) continue;
            int finalI = i;
            List<Appointment> curApp = appointments.stream().filter(x -> Objects.equals(x.date, Date.valueOf(now.plusDays(finalI)))).collect(Collectors.toList());
            if (curApp.isEmpty()) {
                res.addAll(curSch);
                continue;
            }
            for (ScheduleDetails s:curSch                 ) {
                final Time finalStart = s.getStartTime();
                Optional<Appointment> first = curApp.stream().filter(x -> x.startTime.equals(finalStart)).findFirst();
                if (first.isPresent()) continue;
                res.add(s);

            }
        }
        return ResponseEntity.ok(res);
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
