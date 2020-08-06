package best.surp.service;

import best.surp.domain.User;

import java.util.List;

public interface UserService {
    public List<User> findAll();
    public User checkedAccount(String username,String password);
    public User checkedAccount(String username);
    public void delete(int id);
    public void update(User user);
    public User findSingle(int id);
    public void add(User user);
}
