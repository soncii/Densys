package com.me.DenSys.app;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import java.sql.Date;

public class Doctor {

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name="IIN")
    private Long iIN;
    @Column(name="DateOfBirth")
    private Date DoB;
    @Column(name="FirstName")
    private String firstName;
    @Column(name="Surname")
    private String surname;
    @Column(name="MiddleName")
    private String middleName;
    @Column(name="ContactNumber")
    private String contactNumber;
    @Column(name="DepartmentId")
    private String departmentId;
    @Column(name="SpecializationId")
    private String specializationId;
    @Column(name="Experience")
    private Integer experience;
    @Column(name="Category")
    private Integer price;
    @Column(name="ScheduleDetails")
    private String scheduleDetails;
    @Column(name="Degree")
    private String degree;
    @Column(name="Rating")
    private Double rating;
    @Column(name="Address")
    private String address;
    @Column(name="Url")
    private String url;

}
