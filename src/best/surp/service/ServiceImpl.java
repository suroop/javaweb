package best.surp.service;
/*
 * @PackageName:best.surp.service
 * @ClassName:ServiceImpl
 * @description:
 * @author Surp
 * @date:2020/7/31 13:40
 */

import best.surp.dao.DaoImpl;
import best.surp.dao.UserDao;
import best.surp.domain.User;

import java.util.List;
import java.util.Map;

public class ServiceImpl implements UserService {
    private UserDao userDao = new DaoImpl();
    @Override
    public List<User> findAll() {
        return userDao.findAll();
    }
    @Override
    public User checkedAccount(String username,String password){ return userDao.checkedAccount(username, password); }
    @Override
    public User checkedAccount(String username){
        return userDao.checkedAccount(username);
    }
    @Override
    public void delete(int id) {userDao.delete(id);}
    @Override
    public void update(User user) {userDao.update(user); }
    @Override
    public User findSingle(int id) {return userDao.findSingle(id); }
    @Override
    public void add(User user) {userDao.add(user); }
    @Override
    public int findPageCount() {return userDao.findPageCount(); }
    @Override
    public int findPageCount(Map<String, Object> map) {return userDao.findPageCount(map);}
    @Override
    public List<User> findByPage(int start, int row) {return userDao.findByPage(start,row); }
    @Override
    public List<User> findByPage(int start, int row, Map<String, Object> map) {return userDao.findByPage(start,row,map);}
}
