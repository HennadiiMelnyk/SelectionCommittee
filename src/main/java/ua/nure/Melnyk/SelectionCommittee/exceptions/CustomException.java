package ua.nure.Melnyk.SelectionCommittee.exceptions;

public class CustomException extends Exception {

    private static final long serialVersionUID = 7334312615426796954L;

    public CustomException(String message, Throwable cause) {

        super(message, cause);
    }

    public CustomException(){}

    public CustomException(String message){
        super(message);
    }
}
