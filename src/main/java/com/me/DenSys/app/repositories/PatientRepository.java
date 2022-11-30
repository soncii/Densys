package com.me.DenSys.app.repositories;

import com.me.DenSys.app.entities.Patient;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Component
@Repository
public interface PatientRepository extends JpaRepository<Patient,Long> {
    Optional<Patient> findByEmailAndPassword(String email, String password);
}
