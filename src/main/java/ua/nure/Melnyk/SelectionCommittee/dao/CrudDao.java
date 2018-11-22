package ua.nure.Melnyk.SelectionCommittee.dao;

import java.sql.SQLException;

public interface CrudDao<T> {

    boolean create(T t) throws  SQLException;

    T update(int id, T t) throws SQLException;

    T getById(int id) throws  SQLException;

    boolean delete(int id) throws  SQLException;
}
