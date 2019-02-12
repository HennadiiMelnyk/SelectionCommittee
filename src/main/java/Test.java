import ua.nure.Melnyk.SelectionCommittee.dao.CrudDao;
import ua.nure.Melnyk.SelectionCommittee.dao.DaoFactory;
import ua.nure.Melnyk.SelectionCommittee.exceptions.DBException;

import javax.naming.NamingException;
import java.sql.SQLException;

public class Test {


    public static void main(String[] args) throws NamingException, SQLException, DBException {
        DaoFactory daoFactory = DaoFactory.getDAOFactory("mysql");
        CrudDao crudDao = daoFactory.getUserDao();
        crudDao.getById(1);
    }
}
