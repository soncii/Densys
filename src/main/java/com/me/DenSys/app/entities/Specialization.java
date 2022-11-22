package com.me.DenSys.app.entities;

import javax.persistence.*;

@Entity
@Table
public class Specialization {

    @Id
    @Column(name = "specName", nullable = false)
    public String specName;

    public Specialization() {
    }
    public Specialization(String s) {
        this.specName=s;
    }
    public String getSpecName() {
        return specName;
    }

    public void setSpecName(String specName) {
        this.specName = specName;
    }

}
