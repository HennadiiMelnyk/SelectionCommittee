package ua.nure.Melnyk.SelectionCommittee.dao.entityDao;

import ua.nure.Melnyk.SelectionCommittee.dao.CrudDao;
import ua.nure.Melnyk.SelectionCommittee.model.User;
/**
 * UserDao*/
public interface UserDao extends CrudDao {

    /**
     * User
     */
    public void addUser(User user);

    public void updateUser(User user);

    public void deleteUser(int id);



}
