package ua.nure.Melnyk.SelectionCommittee.dao.entityDao.Impl;

import org.apache.log4j.Logger;
import ua.nure.Melnyk.SelectionCommittee.dao.entityDao.UserDao;
import ua.nure.Melnyk.SelectionCommittee.dao.factorydao.MySqlDaoFactory;
import ua.nure.Melnyk.SelectionCommittee.exceptions.DBException;
import ua.nure.Melnyk.SelectionCommittee.exceptions.Messages;
import ua.nure.Melnyk.SelectionCommittee.model.Region;
import ua.nure.Melnyk.SelectionCommittee.model.Role;
import ua.nure.Melnyk.SelectionCommittee.model.User;

import javax.naming.NamingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import static ua.nure.Melnyk.SelectionCommittee.SqlQueryConst.SqlQuery.SQL_CREATE_USER;
import static ua.nure.Melnyk.SelectionCommittee.SqlQueryConst.SqlQuery.SQL_SELECT_USER_BY_ID;

public class MySQLUserDaoImpl implements UserDao {


    private static final Logger LOGGER = Logger.getLogger(MySQLUserDaoImpl.class);

    private Connection connection;

    private PreparedStatement preparedStatement;

    private ResultSet resultSet;


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
    public boolean create(User user) throws SQLException, DBException {
        boolean result = true;
        try {
            getConnection();
            preparedStatement = connection.prepareStatement(SQL_CREATE_USER);
            int k = 1;
/*
            preparedStatement.setString(k++, user.setName());
            preparedStatement.setString(k++, user.setSurname());
            preparedStatement.setString(k++, user.setEmail());
            preparedStatement.setString(k++, user.setPassword());
            preparedStatement.setString(k++, user.setIsBlock());
            preparedStatement.setObject(k++, user.setIdFaculty());
            preparedStatement.setObject(k++, user.setRoleID());
            preparedStatement.setObject(k++, user.setRegionID());
            execute();
            commit();*/
        } catch (SQLException e) {
            result = false;
            rollback();
            LOGGER.error(Messages.LOG_CREATE_USER_EXCEPTION);
            throw new DBException(Messages.LOG_CREATE_USER_EXCEPTION, e);
        } catch (DBException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return result;
    }


    @Override
    public User update(int id, User user) throws SQLException {
        return null;
    }

    @Override
    public User getById(int id) throws DBException, SQLException {
        User user = null;
        try {
            getConnection();
            preparedStatement = connection.prepareStatement(SQL_SELECT_USER_BY_ID);
            int k = 1;
            preparedStatement.setInt(k++, id);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getInt(1));
                user.setName(resultSet.getString(2));
                user.setSurname(resultSet.getString(3));
                user.setEmail(resultSet.getString(4));
                user.setPassword(resultSet.getString(5));
                user.setIsBlock(resultSet.getString(6));
                user.setIdFaculty((Integer) resultSet.getObject(7));
                user.setRoleID((Role) resultSet.getObject(8));
                user.setRegionID((Region) resultSet.getObject(9));

            }
        } catch (SQLException e) {
            rollback();
            LOGGER.error(Messages.LOG_GET_USER_BY_ID_EXCEPTION);
            new DBException(Messages.LOG_GET_USER_BY_ID_EXCEPTION, e);
        } finally {
            close(resultSet);
            close();
        }
        return user;
    }

    @Override
    public boolean delete(int id) throws SQLException {
        return false;
    }

    private void getConnection() throws SQLException, DBException {
        try {
            connection = MySqlDaoFactory.getInstance().getConnection();
        } catch (SQLException e) {
            LOGGER.error(Messages.LOG_GET_CONNECTION_EXCEPTION);
            throw new SQLException(e);
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    private void execute() throws SQLException {
        try {
            preparedStatement.execute();
        } catch (SQLException e) {
            LOGGER.error(Messages.LOG_EXECUTION_EXCEPTION);
            throw new SQLException(e);
        }
    }

    private void commit() throws SQLException {
        try {
            connection.commit();
        } catch (SQLException e) {
            LOGGER.error(Messages.LOG_COMMIT_EXCEPTION);
            throw new SQLException(e);
        }
    }

    /**
     * rollback
     * Rollbacks a connection.
     */
    private void rollback() throws SQLException, DBException {
        try {
            connection.rollback();
        } catch (SQLException e) {
            LOGGER.error(Messages.LOG_ROLLBACK_EXCEPTION);
            throw new DBException(Messages.LOG_ROLLBACK_EXCEPTION, e);
        }
    }
    /**
     * Closes a connection.
     *
     */
    private void close() throws DBException {
        if (resultSet != null) {
            try {
                preparedStatement.close();
                connection.close();
                resultSet.close();
            } catch (SQLException e) {
                LOGGER.error(Messages.LOG_CLOSE_EXCEPTION);
                throw new DBException(Messages.LOG_CLOSE_EXCEPTION, e);
            }
        }
    }

    /**
     * Closes a result set object.
     */
    private void close(ResultSet resultSet) throws DBException {
        try {
            resultSet.close();
        } catch (SQLException e) {
            LOGGER.error(Messages.LOG_RS_CLOSE_EXCEPTION);
            throw new DBException(Messages.LOG_RS_CLOSE_EXCEPTION, e);
        }
    }
}
