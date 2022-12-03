package com.me.DenSys.app.DoctorPicture;

import com.me.DenSys.app.entities.FileDB;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;


@Repository
public interface FileDBRepository extends JpaRepository<FileDB, String> {
    @Query("select * from files f where f.id=:id")
    Optional<FileDB> native_findById(Integer id);

}
