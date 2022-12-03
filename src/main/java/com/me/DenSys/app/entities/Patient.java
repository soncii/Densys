package com.me.DenSys.app.entities;

import javax.persistence.*;
import java.sql.Date;
@Entity(name="patient")
@Table(name="patient")
public class Patient {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Column(name = "IIN")
    private String iIN;
    @Column(name = "DateOfBirth")
    private Date DoB;
    @Column(name = "FirstName")
    private String firstName;
    @Column(name = "Surname")
    private String surname;
    @Column(name = "MiddleName")
    private String middleName;
    @Column(name = "bloodGroup")
    private String bloodGroup;
    @Column(name = "EmergencyConctactNumber")
    private String emergencyContactNumber;
    @Column(name = "ContactNumber")
    private String contactNumber;
    @Column(name = "Email")
    private String email;
    @Column
    private String password;
    @Column(name = "Address")
    private String address;
    @Column(name = "Married")
    private String married;
    @Column(name = "RegistrationDate")
    private Date registrationDate;

    public Patient() {

    }

    @Override
    public String toString() {
        return "Patient{" +
                "id=" + id +
                ", iIN='" + iIN + '\'' +
                ", DoB=" + DoB +
                ", firstName='" + firstName + '\'' +
                ", surname='" + surname + '\'' +
                ", middleName='" + middleName + '\'' +
                ", bloodGroup='" + bloodGroup + '\'' +
                ", emergencyContactNumber='" + emergencyContactNumber + '\'' +
                ", contactNumber='" + contactNumber + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", address='" + address + '\'' +
                ", married='" + married + '\'' +
                ", registrationDate=" + registrationDate +
                '}';
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

    public String getBloodGroup() {
        return bloodGroup;
    }

    public void setBloodGroup(String bloodGroup) {
        this.bloodGroup = bloodGroup;
    }

    public String getEmergencyContactNumber() {
        return emergencyContactNumber;
    }

    public void setEmergencyContactNumber(String emergencyContactNumber) {
        this.emergencyContactNumber = emergencyContactNumber;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getMarried() {
        return married;
    }

    public void setMarried(String married) {
        this.married = married;
    }

    public Date getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(Date registrationDate) {
        this.registrationDate = registrationDate;
    }
}