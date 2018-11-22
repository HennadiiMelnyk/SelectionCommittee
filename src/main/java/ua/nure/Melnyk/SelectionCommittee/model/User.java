package ua.nure.Melnyk.SelectionCommittee.model;

import java.io.Serializable;
import java.util.Objects;

/**
 * User Model
 */
public class User implements Serializable {
    private int id;
    private String name;
    private String surname;
    private String email;
    private String isBlock;
    private int idFaculty;
    private int roleIdRole;
    private int regionIdRegion;

    public User() {
    }

    public User(int id, String name, String surname, String email, String isBlock, int idFaculty, int roleIdRole) {
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.isBlock = isBlock;
        this.idFaculty = idFaculty;
        this.roleIdRole = roleIdRole;
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

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getIsBlock() {
        return isBlock;
    }

    public void setIsBlock(String isBlock) {
        this.isBlock = isBlock;
    }

    public int getIdFaculty() {
        return idFaculty;
    }

    public void setIdFaculty(int idFaculty) {
        this.idFaculty = idFaculty;
    }

    public int getRoleIdRole() {
        return roleIdRole;
    }

    public void setRoleIdRole(int roleIdRole) {
        this.roleIdRole = roleIdRole;
    }

    public int getRegionIdRegion() {
        return regionIdRegion;
    }

    public void setRegionIdRegion(int regionIdRegion) {
        this.regionIdRegion = regionIdRegion;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return id == user.id &&
                idFaculty == user.idFaculty &&
                roleIdRole == user.roleIdRole &&
                regionIdRegion == user.regionIdRegion &&
                Objects.equals(name, user.name) &&
                Objects.equals(surname, user.surname) &&
                Objects.equals(email, user.email) &&
                Objects.equals(isBlock, user.isBlock);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, name, surname, email, isBlock, idFaculty, roleIdRole, regionIdRegion);
    }
}
