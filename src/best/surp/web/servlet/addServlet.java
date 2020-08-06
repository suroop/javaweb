package best.surp.web.servlet;

import best.surp.domain.User;
import best.surp.service.ServiceImpl;
import best.surp.service.UserService;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet("/addServlet")
public class addServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        UserService userService = new ServiceImpl();
        User user = new User();
        //添加
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String gender = request.getParameter("gender");
        String ident = request.getParameter("ident");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String age = request.getParameter("age");
        user.setUsername(username);
        user.setPassword(password);
        user.setName(name);
        user.setBirthday(birthday);
        user.setGender(gender);
        user.setIdent(ident);
        user.setPhone(phone);
        user.setEmail(email);
        user.setAge(Integer.parseInt(age));
        userService.add(user);
        //跳转
        response.sendRedirect("/userlistServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
