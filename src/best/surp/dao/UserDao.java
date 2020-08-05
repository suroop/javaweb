package best.surp.dao;

import best.surp.domain.User;

import java.util.List;

public interface UserDao {
    public List<User> findAll();
    public User checkedAccount(String username,String password);
    public User checkedAccount(String username);
}
