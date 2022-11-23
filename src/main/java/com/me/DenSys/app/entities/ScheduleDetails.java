package com.me.DenSys.app.entities;

import javax.persistence.*;
import java.time.LocalTime;


@Entity
@Table
public class ScheduleDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column
    public Long id;

    @Column
    public String doctorEmail;
    @Column
    public Integer weekDay;

    @Column
    public LocalTime start;

    @Column LocalTime end;


}
