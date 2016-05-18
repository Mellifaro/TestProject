package usermanager.service;

import usermanager.dao.UserDao;
import usermanager.model.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    private UserDao dao;

    public void setDao(UserDao dao) {
        this.dao = dao;
    }

    @Transactional
    public void addUser(User user) {
        dao.addUser(user);
    }

    @Transactional
    public void updateUser(User user) {
        dao.updateUser(user);
    }

    @Transactional
    public void removeUser(int id) {
        dao.removeUser(id);
    }

    @Transactional
    public User getUserById(int id) {
        return dao.getUserById(id);
    }

    @Transactional
    public List<User> listUsers(int currentPage, int itemsOnPage) {
        return dao.listUsers(currentPage, itemsOnPage);
    }

    @Transactional
    public List<User> findUsersByName(String name){return dao.findUsersByName(name);}
}
