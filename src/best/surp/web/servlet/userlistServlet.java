package best.surp.web.servlet;

import best.surp.domain.BeanPage;
import best.surp.domain.User;
import best.surp.service.ServiceImpl;
import best.surp.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/userlistServlet")
public class userlistServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService userService = new ServiceImpl();
        BeanPage beanPage = new BeanPage();
        //判断是登录进入还是选页进入
        String toPage = request.getParameter("toPage");
        if(toPage==null){
            beanPage.setCurrentPage(1);
        }else {
            beanPage.setCurrentPage(Integer.parseInt(toPage));
        }
        int currentPage = beanPage.getCurrentPage();
        int pageCount = userService.findPageCount();
        int rows = beanPage.getRows();
        beanPage.setTotalCount(pageCount);
        beanPage.setTotalPage(pageCount%rows==0?pageCount/rows:pageCount/rows+1);
        List<User> userList = userService.findByPage((currentPage - 1) * rows, rows);
        beanPage.setUsers(userList);
        /*List<User> users = userService.findAll();*/
        /*request.setAttribute("users",users);*/
        request.setAttribute("bp",beanPage);
        request.getRequestDispatcher("/list.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
