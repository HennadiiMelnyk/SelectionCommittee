package ua.nure.Melnyk.SelectionCommittee.model;

import java.io.Serializable;
import java.util.Objects;


/**
 * User Model
 */
public class User implements Serializable {


    private static final long serialVersionUID = -6292438996688634291L;
    private int id;
    private String name;
    private String surname;
    private String email;
    private String password;
    private String isBlock;
    private int idFaculty;
    private Role roleID;
    private Region regionID;


    public User() {
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public Role getRoleID() {
        return roleID;
    }

    public void setRoleID(Role roleID) {
        this.roleID = roleID;
    }

    public Region getRegionID() {
        return regionID;
    }

    public void setRegionID(Region regionID) {
        this.regionID = regionID;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return id == user.id &&
                idFaculty == user.idFaculty &&
                Objects.equals(name, user.name) &&
                Objects.equals(surname, user.surname) &&
                Objects.equals(email, user.email) &&
                Objects.equals(password, user.password) &&
                Objects.equals(isBlock, user.isBlock) &&
                roleID == user.roleID &&
                Objects.equals(regionID, user.regionID);
    }

    public User(int id, String name, String surname, String email, String password, String isBlock, int idFaculty, Role roleID, Region regionID) {
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.password = password;
        this.isBlock = isBlock;
        this.idFaculty = idFaculty;
        this.roleID = roleID;
        this.regionID = regionID;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + id;
        // result = prime * result + name;
        return Objects.hash(id, name, surname, email, password, isBlock, idFaculty, roleID, regionID);
        //return result;
    }
}
