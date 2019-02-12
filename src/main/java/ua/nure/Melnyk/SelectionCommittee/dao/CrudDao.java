package ua.nure.Melnyk.SelectionCommittee.dao;

import ua.nure.Melnyk.SelectionCommittee.exceptions.DBException;

import java.sql.SQLException;
/**Main operations of Data Access Object layer
 *
 * @param <T> Type variable.
 */
public interface CrudDao<T> {

    boolean create(T t) throws SQLException, DBException;

    T update(int id, T t) throws SQLException;

     T getById(int id) throws  SQLException, DBException;

    boolean delete(int id) throws  SQLException;
}
