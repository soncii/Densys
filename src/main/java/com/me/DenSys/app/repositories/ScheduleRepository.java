package com.me.DenSys.app.repositories;

import com.me.DenSys.app.entities.ScheduleDetails;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ScheduleRepository extends JpaRepository<ScheduleDetails,Long> {
    List<ScheduleDetails> findAllByDoctorEmail(String email);
}
