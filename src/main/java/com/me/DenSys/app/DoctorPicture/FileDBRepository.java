package com.me.DenSys.app.DoctorPicture;

import com.me.DenSys.app.entities.FileDB;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface FileDBRepository extends JpaRepository<FileDB, String> {

}
