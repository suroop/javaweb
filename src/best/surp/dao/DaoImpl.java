package best.surp.dao;
/*
 * @PackageName:best.surp.dao
 * @ClassName:DaoImpl
 * @description:
 * @author Surp
 * @date:2020/7/31 13:42
 */

import best.surp.domain.User;
import best.surp.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class DaoImpl implements UserDao {
    private JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDataSource());
    @Override
    public List<User> findAll() {
        //操作JDBC
        try {
            String sql = "SELECT * FROM jdbcuser";
            return jdbcTemplate.query(sql, new BeanPropertyRowMapper<User>(User.class));
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public User checkedAccount(String username,String password) {
        String sql = "SELECT * FROM jdbcuser where username = ? and password = ?";
        return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class),username,password);
    }
    @Override
    public User checkedAccount(String username) {
        String sql = "SELECT * FROM jdbcuser where username = ?";
        return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class),username);
    }
}
