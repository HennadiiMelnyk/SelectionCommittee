package ua.nure.Melnyk.SelectionCommittee.service.Impl;

import ua.nure.Melnyk.SelectionCommittee.dao.entityDao.UserDao;
import ua.nure.Melnyk.SelectionCommittee.exceptions.DBException;
import ua.nure.Melnyk.SelectionCommittee.model.User;
import ua.nure.Melnyk.SelectionCommittee.service.UserService;

import java.sql.SQLException;

/**
 * User Service
 * Business logic
 */
public class UserServiceImpl implements UserService {
    private UserDao userDao;

    public UserServiceImpl(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public boolean registerUser(User user) throws DBException, SQLException {
        return false;
    }

    @Override
    public User updateUser(int id, User user) throws DBException, SQLException {
        return null;
    }

    @Override
    public User findUserById(int id) throws DBException, SQLException {


        return userDao.getById(id);
    }

    @Override
    public boolean deleteUserById(int id) throws DBException, SQLException {
        return false;
    }

    @Override
    public User getById(int id) throws DBException, SQLException {
        return userDao.getById(id);
    }
}
