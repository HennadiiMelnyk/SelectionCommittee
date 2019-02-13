package ua.nure.Melnyk.SelectionCommittee;

import ua.nure.Melnyk.SelectionCommittee.controller.Command;
import ua.nure.Melnyk.SelectionCommittee.controller.UserController;
import ua.nure.Melnyk.SelectionCommittee.dao.entityDao.Impl.MySQLUserDaoImpl;
import ua.nure.Melnyk.SelectionCommittee.service.Impl.UserServiceImpl;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.util.Map;
import java.util.TreeMap;
@WebListener
public class ApplicationContext  implements ServletContextListener{

    private UserServiceImpl userService;
    private MySQLUserDaoImpl mySQLUserDao;
    private static Map<String, Command> commands = new TreeMap<String, Command>();
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        servletContextEvent.getServletContext().setAttribute("userService", getUserService());
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }

    public static Map<String, Command> getCommands() {
        commands.put("userService", new UserController());
        return commands;
    }

    public UserServiceImpl getUserService() {
        if (userService == null) {
            userService = new UserServiceImpl(getMySqlUserDao());
        }
        return userService;
    }

    public MySQLUserDaoImpl getMySqlUserDao() {
        if (mySQLUserDao == null) {
            mySQLUserDao = new MySQLUserDaoImpl();
        }
        return mySQLUserDao;
    }
}

