package com.me.DenSys.app;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table
public class Patient {
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
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
    private String middlename;
    @Column(name="BloodGroup")
    private String  BloodGroup;
    @Column(name="EmergencyConctactNumber")
    private String emergencyContactNumber;
    @Column(name="ContactNumber")
    private String contactNumber;
    @Column(name="Email")
    private String email;
    @Column(name="Address")
    private String adress;
    @Column(name="Married")
    private boolean married;
    @Column(name="RegistrationDate")
    private Date registrationDate;


    public Patient() {

    }

    public void setId(Long id) {
        this.id = id;
    }

    @Id
    public Long getId() {
        return id;
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

    public String getMiddlename() {
        return middlename;
    }

    public void setMiddlename(String middlename) {
        this.middlename = middlename;
    }

    public String getBloodGroup() {
        return BloodGroup;
    }

    public void setBloodGroup(String bloodGroup) {
        BloodGroup = bloodGroup;
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

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    public boolean isMarried() {
        return married;
    }

    public void setMarried(boolean married) {
        this.married = married;
    }

    public Date getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(Date registrationDate) {
        this.registrationDate = registrationDate;
    }
}
//enum BloodGroup {
//    FIRSTPOS,
//    SECONDPOS,
//    THIRDPOS,
//    FOURTHPOS,
//    FIRSTNEG,
//    SECONDNEG,
//    THIRDNEG,
//    FOURTHNEG
//}