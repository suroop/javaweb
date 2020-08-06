package best.surp.dao;

import best.surp.domain.User;

import java.util.List;
import java.util.Map;

public interface UserDao {
    public List<User> findAll();
    public User checkedAccount(String username,String password);
    public User checkedAccount(String username);
    public User findSingle(int id);
    public void delete(int id);
    public void update(User user);
    public void add(User user);
    public int findPageCount();
    public int findPageCount(Map<String,Object> map);
    public List<User> findByPage(int start,int row);
    public List<User> findByPage(int start, int row, Map<String,Object> map);
}
