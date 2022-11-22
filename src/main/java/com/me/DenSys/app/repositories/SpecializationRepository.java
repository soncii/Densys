package com.me.DenSys.app.repositories;

import com.me.DenSys.app.entities.Specialization;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SpecializationRepository extends JpaRepository<Specialization, String> {
}
