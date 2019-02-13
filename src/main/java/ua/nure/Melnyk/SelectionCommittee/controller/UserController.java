package ua.nure.Melnyk.SelectionCommittee.controller;

import ua.nure.Melnyk.SelectionCommittee.exceptions.DBException;
import ua.nure.Melnyk.SelectionCommittee.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;

public class UserController extends Command {


    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws DBException, SQLException {

        UserService userService = (UserService) request.getServletContext().getAttribute("userService");
        HttpSession httpSession=request.getSession();
       // List<User> ls= (List<User>) userService.getById(3);
        return String.valueOf(userService.getById(3));


    }
}
