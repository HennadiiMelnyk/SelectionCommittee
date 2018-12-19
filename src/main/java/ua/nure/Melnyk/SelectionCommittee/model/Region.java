package ua.nure.Melnyk.SelectionCommittee.model;

import java.io.Serializable;

public class Region implements Serializable {
    private static final long serialVersionUID = 4168646336639699389L;

    private int id;
    private String name;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Region(){}
}
