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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/userlistServlet")
public class userlistServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        UserService userService = new ServiceImpl();
        BeanPage beanPage = new BeanPage();
        //判断是登录进入还是选页进入
        String toPage = request.getParameter("toPage");
        if(toPage==null){
            beanPage.setCurrentPage(1);
        }else {
            beanPage.setCurrentPage(Integer.parseInt(toPage));
        }
        //判断是否为条件查询
        String[] selected = new String[3];
        selected[0] = request.getParameter("selectedUsername");
        request.setAttribute("selectedUsername",selected[0]);
        selected[1] = request.getParameter("selectedName");
        request.setAttribute("selectedName",selected[1]);
        selected[2] = request.getParameter("selectedEmail");
        request.setAttribute("selectedEmail",selected[2]);
        System.out.println(selected[0]);
        System.out.println(selected[1]);
        System.out.println(selected[2]);
        int currentPage = beanPage.getCurrentPage();
        int pageCount;
        int rows = beanPage.getRows();
        List<User> userList = new ArrayList<>();
        if(selected[0]!=null||selected[1]!=null||selected[2]!=null){
            Map<String,Object> map = new HashMap<>();
            map.put("username",selected[0]);
            map.put("name",selected[1]);
            map.put("email",selected[2]);
            userList = userService.findByPage((currentPage - 1) * rows, rows,map);
            pageCount = userService.findPageCount(map);
        }else{
            pageCount = userService.findPageCount();
            userList = userService.findByPage((currentPage - 1) * rows, rows);
        }
        beanPage.setTotalCount(pageCount);
        beanPage.setTotalPage(pageCount%rows==0?pageCount/rows:pageCount/rows+1);
        beanPage.setUsers(userList);
        request.setAttribute("bp",beanPage);
        request.getRequestDispatcher("/list.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
