package com.me.DenSys.app;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Component
@Repository
public interface PatientRepository extends JpaRepository<Patient,Long> {
}
