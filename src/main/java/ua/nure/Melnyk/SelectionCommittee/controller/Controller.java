package ua.nure.Melnyk.SelectionCommittee.controller;

import org.apache.log4j.Logger;
import ua.nure.Melnyk.SelectionCommittee.SqlQueryConst.Path;
import ua.nure.Melnyk.SelectionCommittee.exceptions.CustomException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

public class Controller extends HttpServlet {
    private static final Logger LOG = Logger.getLogger(Controller.class);

    public Controller() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
        try {
            process(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
        try {
            process(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
    }

    private void process(HttpServletRequest request,
                         HttpServletResponse response) throws IOException, ServletException, SQLException, NoSuchAlgorithmException {

        LOG.debug("Controller starts");

        // extract command name from the request
        String commandName = request.getParameter("command");
        LOG.trace("Request parameter: command --> " + commandName);

        /*if ("init".equals(commandName)) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            // obtain command object by its name
            Command command = CommandContainer.get(commandName, request.getServletContext());
            LOG.trace("Obtained command --> " + command);
*/
        Command command = CommandContainer.get(commandName, request.getServletContext());
        // execute command and get forward address
        String forward = Path.PAGE_ERROR_PAGE;
        try {
            forward = command.execute(request, response);
        } catch (CustomException ex) {
            request.setAttribute("errorMessage", ex.getMessage());
        }
        LOG.trace("Forward address --> " + forward);

        LOG.debug("Controller finished, now go to forward address --> " + forward);

        // go to forward
        request.getRequestDispatcher(forward).forward(request, response);
    }
}




