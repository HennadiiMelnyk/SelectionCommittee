package ua.nure.Melnyk.SelectionCommittee.controller;

import ua.nure.Melnyk.SelectionCommittee.exceptions.DBException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.Serializable;
import java.sql.SQLException;

public abstract class Command implements Serializable{


    public abstract String execute(HttpServletRequest request, HttpServletResponse response) throws DBException, SQLException;

    @Override
    public String toString() {
        return super.toString();
    }
}
