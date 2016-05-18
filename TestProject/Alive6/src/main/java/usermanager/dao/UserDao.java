package usermanager.dao;

import usermanager.model.User;

import java.util.List;

/**
 * Created by Виктор on 15.05.2016.
 */
public interface UserDao {

    void addUser(User user);

    void updateUser(User user);

    void removeUser(int id);

    User getUserById(int id);

    List<User> listUsers(int currentPage, int itemsOnPage);

    List<User> findUsersByName(String name);
}
