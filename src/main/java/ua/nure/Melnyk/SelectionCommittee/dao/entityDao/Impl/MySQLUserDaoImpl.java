package ua.nure.Melnyk.SelectionCommittee.dao.entityDao.Impl;

import ua.nure.Melnyk.SelectionCommittee.dao.entityDao.UserDao;
import ua.nure.Melnyk.SelectionCommittee.model.User;

import java.sql.SQLException;

public class MySQLUserDaoImpl implements UserDao {
    @Override
    public void addUser(User user) {

    }

    @Override
    public void updateUser(User user) {

    }

    @Override
    public void deleteUser(int id) {

    }

    @Override
    public boolean create(Object o) throws SQLException {
        return false;
    }

    @Override
    public Object update(int id, Object o) throws SQLException {
        return null;
    }

    @Override
    public Object getById(int id) throws SQLException {
        return null;
    }

    @Override
    public boolean delete(int id) throws SQLException {
        return false;
    }
}
