package best.surp.web.servlet;

import best.surp.domain.User;
import best.surp.service.ServiceImpl;
import best.surp.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/updateServlet")
public class updateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        UserService userService = new ServiceImpl();
        User user = new User();
        //添加
        String age = request.getParameter("age");
        String id = request.getParameter("id");
        user.setId(Integer.parseInt(id));
        user.setUsername(request.getParameter("username"));
        user.setPassword(request.getParameter("password"));
        user.setName(request.getParameter("name"));
        user.setBirthday(request.getParameter("birthday"));
        user.setGender(request.getParameter("gender"));
        user.setIdent(request.getParameter("ident"));
        user.setPhone(request.getParameter("phone"));
        user.setEmail(request.getParameter("email"));
        user.setAge(Integer.parseInt(age));
        System.out.println(user.toString());
        userService.update(user);
        //跳转
        response.sendRedirect("/userlistServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
