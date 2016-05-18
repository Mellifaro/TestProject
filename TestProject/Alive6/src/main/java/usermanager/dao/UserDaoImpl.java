package usermanager.dao;

import org.hibernate.Query;
import usermanager.model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;

@Repository
public class UserDaoImpl implements UserDao{

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void addUser(User user) {
        Session session = sessionFactory.getCurrentSession();
        session.persist(user);
    }

    public void updateUser(User user) {
        Session session = sessionFactory.getCurrentSession();
        session.update(user);
    }

    public void removeUser(int id) {
        Session session = sessionFactory.getCurrentSession();
        User user = (User)session.load(User.class, id);

        if(user != null){
            session.delete(user);
        }
    }

    public User getUserById(int id) {
        Session session = sessionFactory.getCurrentSession();
        User user = (User)session.load(User.class, new Integer(id));
        System.out.println("-----------------");
        System.out.println("User id = " + user.getId() + ", user name = " + user.getName());
        System.out.println("-----------------");
        return user;

    }

    @SuppressWarnings("unchecked")
    public List<User> listUsers(int currentPage, int itemsOnPage) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from User");
        query.setFirstResult((currentPage-1) * itemsOnPage);
        query.setMaxResults(itemsOnPage);
        List<User> userList = query.list();
        return userList;
    }

    @SuppressWarnings("unchecked")
    public List<User> findUsersByName(String name){
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from User where NAME = :name");
        query.setParameter("name", name);
        List<User> userList = query.list();
        return userList;
    }
}
