package com.me.DenSys.app.entities;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Time;

@Entity
@Table(name="appointment")
public class Appointment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long id;

    @Column
    public Long patientId;

    @Column
    public Date date;

    @Column
    public  String specialization;

    @Column
    public String doctorIIN;

    @Column
    public String contactDetails;

    @Column
    public Time startTime;

    @Column
    public Time endTime;

    public String getDoctorIIN() {
        return doctorIIN;
    }

    public void setDoctorIIN(String doctorIIN) {
        this.doctorIIN = doctorIIN;
    }

    public Time getStartTime() {
        return startTime;
    }

    public void setStartTime(Time startTime) {
        this.startTime = startTime;
    }

    public Time getEndTime() {
        return endTime;
    }

    public void setEndTime(Time endTime) {
        this.endTime = endTime;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Appointment() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getPatientId() {
        return patientId;
    }

    public void setPatientId(Long patientId) {
        this.patientId = patientId;
    }

    public Date getDates() {
        return date;
    }

    public void setDates(Date dates) {
        this.date = dates;
    }

    public String getSpecialization() {
        return specialization;
    }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }

    public String getDoctorId() {
        return doctorIIN;
    }

    public void setDoctorId(String doctorId) {
        this.doctorIIN = doctorId;
    }

    public String getContactDetails() {
        return contactDetails;
    }

    public void setContactDetails(String contactDetails) {
        this.contactDetails = contactDetails;
    }
}
