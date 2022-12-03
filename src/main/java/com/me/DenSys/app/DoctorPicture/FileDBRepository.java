package com.me.DenSys.app.DoctorPicture;

import com.me.DenSys.app.entities.FileDB;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


@Repository
public interface FileDBRepository extends JpaRepository<FileDB, String> {
    @Query(nativeQuery = true, value = "select * from files f where f.id=:id")
    FileDB native_findById(Integer id);

}
