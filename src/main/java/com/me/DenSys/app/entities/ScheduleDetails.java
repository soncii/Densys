package com.me.DenSys.app.entities;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.time.LocalTime;

public class ScheduleDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column
    public Long id;

    @Column
    public Long DoctorId;

    @Column
    public LocalTime start;

    @Column LocalTime end;


}
