package ua.nure.Melnyk.SelectionCommittee.dao.factorydao;

import org.apache.log4j.Logger;
import ua.nure.Melnyk.SelectionCommittee.dao.DaoFactory;
import ua.nure.Melnyk.SelectionCommittee.dao.entityDao.FacultyDao;
import ua.nure.Melnyk.SelectionCommittee.dao.entityDao.UserDao;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * */
public class MySqlDaoFactory extends DaoFactory {


    private static final Logger LOG = Logger.getLogger(MySqlDaoFactory.class);


    DataSource dataSource;

    private static MySqlDaoFactory instance;

    public static synchronized MySqlDaoFactory getInstance() throws NamingException {
        if (instance == null) {
            instance = new MySqlDaoFactory();
        }
        return instance;
    }


    private MySqlDaoFactory() {
        try {
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:/comp/env");
            dataSource = (DataSource) envContext.lookup("/jdbc/selectionCommittee");
        } catch (NamingException e) {
            //TODO implement log messages
            //TODO implement custom exceptions(decide best practice to use checked or unchecked)
            LOG.error("Cannot get a context");
        }
    }

    public Connection getConnection() throws SQLException {
        Connection connection = dataSource.getConnection();

        return connection;
    }

    @Override
    public UserDao getUserDao() {
        return null;
    }

    @Override
    public FacultyDao getFacultyDao() {
        return null;
    }

}
