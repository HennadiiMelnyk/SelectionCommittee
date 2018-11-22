package ua.nure.Melnyk.SelectionCommittee.model;

import java.io.Serializable;
import java.util.Objects;

/**
 * Faculty model
 */
public class Faculty implements Serializable {

    private int id;
    private String name;
    private int budgetquantity;

    public Faculty() {
    }

    public Faculty(int id, String name, int budgetquantity, int totalamont) {
        this.id = id;
        this.name = name;
        this.budgetquantity = budgetquantity;
        this.totalamont = totalamont;
    }

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

    public int getBudgetquantity() {
        return budgetquantity;
    }

    public void setBudgetquantity(int budgetquantity) {
        this.budgetquantity = budgetquantity;
    }

    public int getTotalamont() {

        return totalamont;
    }

    public void setTotalamont(int totalamont) {
        this.totalamont = totalamont;
    }

    private int totalamont;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Faculty faculty = (Faculty) o;
        return id == faculty.id &&
                budgetquantity == faculty.budgetquantity &&
                totalamont == faculty.totalamont &&
                Objects.equals(name, faculty.name);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, name, budgetquantity, totalamont);
    }
}
