package com.me.DenSys.app.repositories;

import com.me.DenSys.app.entities.Appointment;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AppointmentRepository extends JpaRepository<Appointment,Long> {
    List<Appointment> findAllByDoctorIIN(String doctorIIN);
}
