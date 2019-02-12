package dbmanager;

import java.util.List;

public class Demo {

    private static <T> void printList(List<T> list) {
        for (T element : list) {
            System.out.println(element);
        }
    }

    public static void main(String[] args) {
        DBManager dbManager = DBManager.getInstance();
        //dbManager.insertUser(User.createUser("petrov"));
        dbManager.getUser(1);
    }
}
