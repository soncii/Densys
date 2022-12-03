package com.me.DenSys.app.entities;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.persistence.*;
import java.sql.Date;

@Entity(name = "doctor")
@Table(name="doctor")
public class Doctor {
    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name="IIN")
    private String iIN;
    @Column
    private String password;
    @Column(name="DateOfBirth")
    @JsonFormat(pattern="yyyy-MM-dd")
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
    @Column(name="price")
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


    public Doctor() {

    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getiIN() {
        return iIN;
    }

    public void setiIN(String iIN) {
        this.iIN = iIN;
    }

    public Date getDoB() {
        return DoB;
    }

    public void setDoB(Date doB) {
        DoB = doB;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    public String getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(String departmentId) {
        this.departmentId = departmentId;
    }

    public String getSpecializationId() {
        return specializationId;
    }

    public void setSpecializationId(String specializationId) {
        this.specializationId = specializationId;
    }

    public Integer getExperience() {
        return experience;
    }

    public void setExperience(Integer experience) {
        this.experience = experience;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getScheduleDetails() {
        return scheduleDetails;
    }

    public void setScheduleDetails(String scheduleDetails) {
        this.scheduleDetails = scheduleDetails;
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }

    public Double getRating() {
        return rating;
    }

    public void setRating(Double rating) {
        this.rating = rating;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
