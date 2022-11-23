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
    public String doctorEmail;
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
        return doctorEmail;
    }

    public void setDoctorEmail(String doctorEmail) {
        this.doctorEmail = doctorEmail;
    }

    public Integer getWeekDay() {
        return weekDay;
    }

    public void setWeekDay(Integer weekDay) {
        this.weekDay = weekDay;
    }

    public Time getStart() {
        return startTime;
    }

    public void setStart(Time start) {
        this.startTime = start;
    }

    public Time getEnd() {
        return endTime;
    }

    public void setEnd(Time end) {
        this.endTime = end;
    }
}
