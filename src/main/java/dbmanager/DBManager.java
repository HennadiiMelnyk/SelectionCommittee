package dbmanager;

import com.mysql.jdbc.Connection;
import ua.nure.Melnyk.SelectionCommittee.model.Region;
import ua.nure.Melnyk.SelectionCommittee.model.Role;
import ua.nure.Melnyk.SelectionCommittee.model.User;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * create
 * read
 * update
 * delete
 */
public class DBManager {

    private static final String CONNECTION_URL = "jdbc:mysql://127.0.0.1:3306/selectionCommittee";

    private static final String USER = "root";
    private static final String PASSWORD = "1111";
    private java.sql.Connection connection;

    private PreparedStatement preparedStatement;

    private ResultSet resultSet;
    ////////////////////////////////
    // queries
    //STUDENT
//CREATE USER, INSERT INTO FACULTY
    //ADMIN
    //CREATE FUCLTY, UPDATE FACULTY,DELETE FACULTY,
    //UPDATE STUDENT(ISBLOCK)
    //INSERT INTO SUBJECT

    private static final String SQL_FIND_ALL_USERS = "SELECT * FROM users";

    private static final String SQL_FIND_ALL_GROUPS = "SELECT * FROM groups";

    private static final String SQL_FIND_USER_BY_LOGIN = "SELECT * FROM users WHERE login=?";

    private static final String SQL_FIND_GROUP_BY_USER_ID = "SELECT * FROM groups WHERE groups.id in " +
            "(SELECT group_id FROM users_groups WHERE user_id=?)";

    private static final String SQL_FIND_GROUP_BY_NAME = "SELECT * FROM groups WHERE name=?";

    private static final String SQL_CREATE_USER = "INSERT INTO users VALUES(DEFAULT, ?)";

    private static final String SQL_CREATE_GROUP = "INSERT INTO groups VALUES(DEFAULT, ?)";

    private static final String SQL_INSERT_USER = "INSERT INTO users VALUES (DEFAULT, ?, ?)";
    ///////////////////////////////
    // singleton

    private static DBManager instance; // == null

    public static synchronized DBManager getInstance() {
        if (instance == null) {
            instance = new DBManager();
        }
        return instance;
    }

    private DBManager() {
    }

    ////////////////////////////////
    // logic




    /*public boolean insertUser(User user) throws SQLException {
        boolean result = true;
        Connection connection = null;
        PreparedStatement pstmt = null;
        try {
            connection = getConnection();
            pstmt = connection.prepareStatement(SQL_CREATE_USER, Statement.RETURN_GENERATED_KEYS);
            int k = 1;
            pstmt.setString(k++, user.getLogin());
            // pstmt.execute();
            if (pstmt.executeUpdate() > 0) {
                ResultSet rs = pstmt.getGeneratedKeys();
                if (rs.next()) {
                    user.setId(rs.getInt(1));
                }
            }
            connection.commit();
        } catch (SQLException e) {
            result = false;
            connection.rollback();
            e.printStackTrace();
        } finally {
            pstmt.close();
            connection.close();
        }
        return result;
    }*/

    public User getUser(int id) {
    User user=null;
    try{
        getConnection();
        preparedStatement= connection.prepareStatement("SELECT * FROM user WHERE id=?");
        int k = 1;
        preparedStatement.setInt(k++,id);
        resultSet=preparedStatement.executeQuery();
        while(resultSet.next()){
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
        e.printStackTrace();
    }finally {
        close(resultSet);
    }
    return user;
    }
    /////////////////////////
    // util methods

    public Connection getConnection() throws SQLException {
        Connection con = (Connection) DriverManager.getConnection(CONNECTION_URL, USER, PASSWORD);
        con.setAutoCommit(false);
        // ...
        return con;
    }

    private void close(AutoCloseable ac) {
        if (ac != null) {
            try {
                ac.close();
            } catch (Exception ex) {
                throw new IllegalStateException("Cannot close " + ac);
            }

        }
    }
}
