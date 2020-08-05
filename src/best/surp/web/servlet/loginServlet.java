package best.surp.web.servlet;

import best.surp.domain.User;
import best.surp.service.ServiceImpl;
import best.surp.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.invoke.VarHandle;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        //设置编码
        request.setCharacterEncoding("utf-8");
        //设置msg空
        request.setAttribute("msg","");
        //判断是登录还是注册
        String checked = request.getParameter("true");
        if ("login".equals(checked)){
            String verification = request.getParameter("verification");
            String checkedcode = (String) request.getSession().getAttribute("CHECKCODE_SERVER");
            //如果验证码不正确
            if(!verification.equalsIgnoreCase(checkedcode)){
                request.setAttribute("msg","验证码不正确");
                request.getRequestDispatcher("/login.jsp").forward(request,response);
            }else{
                //验证码正确,验证用户账号密码
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                UserService us = new ServiceImpl();
                //如果为null说明不存在
                User user = us.checkedAccount(username, password);
                if(user==null){
                    request.setAttribute("msg","用户名或密码错误");
                    request.getRequestDispatcher("/login.jsp").forward(request,response);
                }else{
                    //跳转到listServlet
                    request.setAttribute("user",user);
                    request.getRequestDispatcher("/userlistServlet").forward(request,response);
                }
            }
        }else {
            //查看用户是否存在
            String username = request.getParameter("username");
            UserService us = new ServiceImpl();
            if(us.checkedAccount(username)==null){
                //跳转到addServlet
                request.getRequestDispatcher("/addServlet").forward(request,response);
            }else{
                request.setAttribute("msg","用户名已注册");
                request.getRequestDispatcher("/login.jsp").forward(request,response);
            }
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
