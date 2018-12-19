package ua.nure.Melnyk.SelectionCommittee.exceptions;

public class DBException extends CustomException {


    private static final long serialVersionUID = 1437904451384016790L;

    public DBException() {
        super();
    }

    public DBException(String message, Throwable cause) {
        super(message, cause);
    }

}
