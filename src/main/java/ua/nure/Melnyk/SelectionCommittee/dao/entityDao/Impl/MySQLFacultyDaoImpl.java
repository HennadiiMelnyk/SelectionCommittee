package ua.nure.Melnyk.SelectionCommittee.dao.entityDao.Impl;

import ua.nure.Melnyk.SelectionCommittee.dao.entityDao.FacultyDao;
import ua.nure.Melnyk.SelectionCommittee.model.Faculty;

import java.sql.SQLException;

public class MySQLFacultyDaoImpl implements FacultyDao {
    @Override
    public void addFaculty(Faculty faculty) {

    }

    @Override
    public void deleteFaculty(int id) {

    }

    @Override
    public void updateFaculty(Faculty faculty) {

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
