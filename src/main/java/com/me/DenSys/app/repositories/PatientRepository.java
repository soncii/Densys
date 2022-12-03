package com.me.DenSys.app.repositories;

import com.me.DenSys.app.entities.Patient;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Component
@Repository
public interface PatientRepository extends JpaRepository<Patient,Long> {

    @Query(nativeQuery = true, value = "Select * from patient p where p.iin=:email and p.password=:password")
    Optional<Patient> nativeFind(String email, String password);
}
