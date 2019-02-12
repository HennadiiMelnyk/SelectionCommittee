package ua.nure.Melnyk.SelectionCommittee.dao.entityDao;

import ua.nure.Melnyk.SelectionCommittee.dao.CrudDao;
import ua.nure.Melnyk.SelectionCommittee.model.User;

/**
 * UserDao
 */
public interface UserDao extends CrudDao<User> {

    /**
     * User
     */
    /*sing Up user,sign up to faculty,
        *admin - create,read,update faculty, block, unblock student */
    public void addUser(User user);

    public void updateUser(User user);

    public void deleteUser(int id);

}
