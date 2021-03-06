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

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
        try {
            String sql = "SELECT * FROM jdbcuser where username = ? and password = ?";
            return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class),username,password);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }

    }
    @Override
    public User checkedAccount(String username) {
        try {
            String sql = "SELECT * FROM jdbcuser where username = ?";
            return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class),username);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }

    }

    @Override
    public User findSingle(int id) {
        try {
            String sql = "SELECT * FROM jdbcuser where id = ?";
            return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class),id);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM jdbcuser WHERE id = ?";
        jdbcTemplate.update(sql,id);
    }

    @Override
    public void update(User user) {
        String sql = "UPDATE jdbcuser SET username = ? ,password = ? ,name = ? ,birthday = ? ,gender = ? ,ident = ? ,phone = ? ,email = ? ,age = ? where id = ?";
        jdbcTemplate.update(sql,user.getUsername(),user.getPassword(),user.getName(),user.getBirthday(),user.getGender(),user.getIdent(),user.getPhone(),user.getEmail(),user.getAge(),user.getId());
    }

    @Override
    public void add(User user) {
        String sql = "INSERT INTO jdbcuser VALUES (null,?,?,?,?,?,?,?,?,?)";
        jdbcTemplate.update(sql,user.getUsername(),user.getPassword(),user.getName(),user.getBirthday(),user.getGender(),user.getIdent(),user.getPhone(),user.getEmail(),user.getAge());
    }

    @Override
    public int findPageCount() {
        String sql = "SELECT COUNT(*) FROM jdbcuser";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }

    @Override
    public int findPageCount(Map<String, Object> map) {
        String sql = "SELECT COUNT(*) FROM jdbcuser WHERE 1 = 1 ";
        StringBuilder sb = new StringBuilder(sql);
        List<Object> params = new ArrayList<>();
        for (Map.Entry<String, Object> sse : map.entrySet()) {
            if(sse.getValue()!=null&&""!=sse.getValue()){
                sb.append(" and "+sse.getKey()+" like ? ");
                params.add("%"+sse.getValue()+"%");
            }
        }
        sql = sb.toString();
        return jdbcTemplate.queryForObject(sql, Integer.class,params.toArray());
    }

    @Override
    public List<User> findByPage(int start, int row) {
        String sql = "SELECT * FROM jdbcuser LIMIT ? ,?";
        return jdbcTemplate.query(sql,new BeanPropertyRowMapper<User>(User.class),start,row);
    }

    @Override
    public List<User> findByPage(int start, int row, Map<String, Object> map) {
        String sql = "SELECT * FROM jdbcuser WHERE 1 = 1 ";
        StringBuilder sb = new StringBuilder(sql);
        List<Object> params = new ArrayList<>();
        for (Map.Entry<String, Object> sse : map.entrySet()) {
            if(sse.getValue()!=null&&""!=sse.getValue()){
                sb.append(" and "+sse.getKey()+" like ? ");
                params.add("%"+sse.getValue()+"%");
            }
        }
        sb.append(" LIMIT ? ,?");
        params.add(start);
        params.add(row);
        sql = sb.toString();
        return jdbcTemplate.query(sql,new BeanPropertyRowMapper<User>(User.class),params.toArray());
    }
}
