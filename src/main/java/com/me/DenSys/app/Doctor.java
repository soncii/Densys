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
    public Doctor() {

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getiIN() {
        return iIN;
    }

    public void setiIN(Long iIN) {
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
