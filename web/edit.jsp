<%--
  Created by IntelliJ IDEA.
  User: Surp
  Date: 2020/7/31
  Time: 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./css/edit.css">
    <script src="./js/jquery-3.5.1.js"></script>
    <script>
        $(document).ready(function(){
            $(window).scroll(function () {
                $(document).scrollTop(0);
            });
        });
    </script>
</head>
<body>
<div class="box">
    <img src="./img/1521.png" alt="">
    <div class="user-box">
        <h2>Edit your information</h2>
        <form action="/addServlet" method="POST" id="Form">
            <div class="left-item item">
                <div class="inputitem">
                    <label for="username">用户</label>
                    <input type="text" name="username" id="username" autocomplete="off" value="${sessionScope.user.username}">
                </div>
                <div class="inputitem">
                    <label for="password">密码</label>
                    <input type="text" name="password" id="password" autocomplete="off" value="${sessionScope.user.password}">
                </div>
                <div class="inputitem">
                    <label for="name">姓名</label>
                    <input type="text" name="name" id="name" autocomplete="off" value="${sessionScope.user.name}">
                </div>
                <div class="inputitem">
                    <label for="identify">身份</label>
                    <input type="text" name="identify" id="identify" autocomplete="off" value="${sessionScope.user.ident}">
                </div>
            </div>
            <div class="right-item item">
                <div class="inputitem">
                    <label for="age">年龄</label>
                    <input type="text" name="age" id="age" autocomplete="off" value="${sessionScope.user.age}">
                </div>
                <div class="inputitem radio">
                    <label >性别</label>
                    <c:if test="${sessionScope.user.gender == 'male'}">
                        <input type="radio" name="age" id="radio1" value="女"><span>女</span>
                        <input type="radio" name="age" id="radio2" value="男" checked><span>男</span>
                        <input type="radio" name="age" id="radio3" value="保密" ><span>保密</span>
                    </c:if>
                    <c:if test="${sessionScope.user.gender == 'female'}">
                        <input type="radio" name="age" id="radio1" value="女" checked><span>女</span>
                        <input type="radio" name="age" id="radio2" value="男" ><span>男</span>
                        <input type="radio" name="age" id="radio3" value="保密" ><span>保密</span>
                    </c:if>
                    <c:if test="${sessionScope.user.gender == ''}">
                        <input type="radio" name="age" id="radio1" value="女"><span>女</span>
                        <input type="radio" name="age" id="radio2" value="男" ><span>男</span>
                        <input type="radio" name="age" id="radio3" value="保密" checked><span>保密</span>
                    </c:if>
                </div>
                <div class="inputitem">
                    <label for="birthday">生日</label>
                    <input type="text" name="birthday" id="birthday" autocomplete="off" value="${sessionScope.user.birthday}">
                </div>
                <div class="inputitem">
                    <label for="phone">电话</label>
                    <input type="text" name="phone" id="phone" autocomplete="off" value="${sessionScope.user.phone}">
                </div>
                <div class="inputitem">
                    <label for="email">邮箱</label>
                    <input type="text" name="email" id="email" autocomplete="off" value="${sessionScope.user.email}">

                </div>
            </div>
            <input type="submit" value="submit" id="submit">
        </form>
    </div>
</div>
</body>
</html>
