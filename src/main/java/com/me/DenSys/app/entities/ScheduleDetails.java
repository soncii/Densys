package com.me.DenSys.app.entities;

import javax.persistence.*;
import java.sql.Time;


@Entity(name="schedule")
@Table(name="schedule")
public class ScheduleDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long id;
    @Column
    public String doctorIIN;
    @Column
    public Integer weekDay;

    @Column
    public Time startTime;

    @Column
    public Time endTime;

    public ScheduleDetails() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDoctorEmail() {
        return doctorIIN;
    }

    public void setDoctorEmail(String doctorEmail) {
        this.doctorIIN = doctorEmail;
    }

    public Integer getWeekDay() {
        return weekDay;
    }

    public void setWeekDay(Integer weekDay) {
        this.weekDay = weekDay;
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
}
