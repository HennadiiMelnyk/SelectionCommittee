package ua.nure.Melnyk.SelectionCommittee.model;

import java.io.Serializable;
import java.util.Objects;

/**
 * Subject model
 */
public class Subject implements Serializable{

    private static final long serialVersionUID = 1211165686162630426L;
    private int id;
    private int ukranian;
    private int math;
    private int physics;
    private int schoolCerificate;

    public Subject() {
    }

    public Subject(int id, int ukranian, int math, int physics, int schoolCerificate) {

        this.id = id;
        this.ukranian = ukranian;
        this.math = math;
        this.physics = physics;
        this.schoolCerificate = schoolCerificate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Subject subject = (Subject) o;
        return id == subject.id &&
                ukranian == subject.ukranian &&
                math == subject.math &&
                physics == subject.physics &&
                schoolCerificate == subject.schoolCerificate;
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, ukranian, math, physics, schoolCerificate);
    }

    public int getId() {

        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUkranian() {
        return ukranian;
    }

    public void setUkranian(int ukranian) {
        this.ukranian = ukranian;
    }

    public int getMath() {
        return math;
    }

    public void setMath(int math) {
        this.math = math;
    }

    public int getPhysics() {
        return physics;
    }

    public void setPhysics(int physics) {
        this.physics = physics;
    }

    public int getSchoolCerificate() {
        return schoolCerificate;
    }

    public void setSchoolCerificate(int schoolCerificate) {
        this.schoolCerificate = schoolCerificate;
    }


}
