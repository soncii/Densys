package com.me.DenSys.app.repositories;

import com.me.DenSys.app.entities.Doctor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

@Component
@Repository(value = "Dam")
public interface DoctorRepository extends JpaRepository<Doctor,Long> {
    List<Doctor> findAllBySpecializationId(String spec);
//    Optional<Doctor> find(String iin, String password);
}
