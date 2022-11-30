package com.me.DenSys.app.repositories;

import com.me.DenSys.app.entities.Doctor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Component
@Repository(value = "Dam")
public interface DoctorRepository extends JpaRepository<Doctor,Long> {
    List<Doctor> findAllBySpecializationId(String spec);
    @Query(nativeQuery = true, value = "Select * from doctor d where d.iin=:iin and d.password=:password")
    Optional<Doctor> findNative(String iin, String password);
}
