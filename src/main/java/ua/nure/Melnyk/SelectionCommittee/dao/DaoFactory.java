package ua.nure.Melnyk.SelectionCommittee.dao;

import ua.nure.Melnyk.SelectionCommittee.dao.entityDao.FacultyDao;
import ua.nure.Melnyk.SelectionCommittee.dao.entityDao.UserDao;
import ua.nure.Melnyk.SelectionCommittee.dao.factorydao.MySqlDaoFactory;
import ua.nure.Melnyk.SelectionCommittee.exceptions.DBException;

import javax.naming.NamingException;
import java.util.HashMap;
import java.util.Map;

public abstract class DaoFactory {

    private static Map<String, DaoFactory> factories;

    public static DaoFactory getDAOFactory(String factory) throws DBException, NamingException {
        factories = new HashMap<>();
        factories.put("mysql", MySqlDaoFactory.getInstance());
        return factories.get(factory);
    }

    public abstract UserDao getUserDao();

    public abstract FacultyDao getFacultyDao();



}
