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

@WebServlet("/editServlet")
public class editServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService userService = new ServiceImpl();
        //更新
        String id = request.getParameter("id");
        System.out.println(id);
        User user = userService.findSingle(Integer.parseInt(id));
        System.out.println(user.toString());
        //转发
        request.getSession().setAttribute("user",user);
        //跳转
        response.sendRedirect("/edit.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
