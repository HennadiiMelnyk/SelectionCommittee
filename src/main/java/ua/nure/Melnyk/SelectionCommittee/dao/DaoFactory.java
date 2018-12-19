package ua.nure.Melnyk.SelectionCommittee.dao;

import javax.naming.NamingException;
import java.util.HashMap;
import java.util.Map;

public abstract class DaoFactory {

    private static Map<String, DaoFactory> factories;

    public static DaoFactory getDAOFactory(String factory) throws  NamingException {
        factories = new HashMap<>();
        //factories.put("mysql", MySQLDaoFactory.getInstance());
        return factories.get(factory);
    }


}
