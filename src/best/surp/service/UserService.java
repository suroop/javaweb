package best.surp.service;

import best.surp.domain.User;

import java.util.List;

public interface UserService {
    public List<User> findAll();
    public User checkedAccount(String username,String password);
    public User checkedAccount(String username);
}
