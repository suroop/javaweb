package best.surp.web.servlet;

import best.surp.service.ServiceImpl;
import best.surp.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/delSelectedServlet")
public class delSelectedServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService userService = new ServiceImpl();
        String[] uid = request.getParameterValues("uid");
        if(uid==null||uid.length==0){
            request.getRequestDispatcher("/userlistServlet").forward(request,response);
        }
        for (int i=0;i<uid.length;i++){
            userService.delete(Integer.parseInt(uid[i]));
        }
        response.sendRedirect("/userlistServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
