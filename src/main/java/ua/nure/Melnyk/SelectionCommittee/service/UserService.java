package ua.nure.Melnyk.SelectionCommittee.service;

import ua.nure.Melnyk.SelectionCommittee.exceptions.DBException;
import ua.nure.Melnyk.SelectionCommittee.model.User;

import java.sql.SQLException;

public interface UserService {

    public boolean registerUser(User user) throws DBException, SQLException;

    public User updateUser(int id, User user) throws DBException, SQLException;

    public User findUserById(int id) throws DBException, SQLException;

    public boolean deleteUserById(int id) throws DBException, SQLException;

    public User getById(int id) throws DBException, SQLException;
}
