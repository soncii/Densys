package com.me.DenSys.app;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Component
@Repository(value = "D")
public interface DoctorRepository extends JpaRepository<Doctor,Long> {
}
