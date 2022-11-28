package com.me.DenSys.app.repositories;

import com.me.DenSys.app.entities.ScheduleDetails;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ScheduleRepository extends JpaRepository<ScheduleDetails,Long> {
    List<ScheduleDetails> findAllByDoctorIIN(String doctorIIN);
}
