import ua.nure.Melnyk.SelectionCommittee.dao.DaoFactory;

import javax.naming.NamingException;
import java.sql.SQLException;

public class Test {


    public static void main(String[] args) throws NamingException, SQLException {
        DaoFactory daoFactory = DaoFactory.getDAOFactory("mysql");
       // CrudDao crudDao = daoFactory.getUserDao();
        //crudDao.getById(1);
    }
}
