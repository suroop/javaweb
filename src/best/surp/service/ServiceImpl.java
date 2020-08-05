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
}
