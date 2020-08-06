<%--
  Created by IntelliJ IDEA.
  User: Surp
  Date: 2020/7/31
  Time: 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./css/add.css">
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
    <img src="./img/1263.png" alt="">
    <div class="user-box">
        <h2>Add user information</h2>
        <form action="/addServlet" method="POST" id="Form">
            <div class="left-item item">
                <div class="inputitem">
                    <label for="username">用户</label>
                    <input type="text" name="username" id="username" autocomplete="off">
                </div>
                <div class="inputitem">
                    <label for="password">密码</label>
                    <input type="text" name="password" id="password" autocomplete="off">
                </div>
                <div class="inputitem">
                    <label for="name">姓名</label>
                    <input type="text" name="name" id="name" autocomplete="off">
                </div>
                <div class="inputitem">
                    <label for="identify">身份</label>
                    <input type="text" name="identify" id="identify" autocomplete="off">
                </div>
            </div>
            <div class="right-item item">
                <div class="inputitem">
                    <label for="age">年龄</label>
                    <input type="text" name="age" id="age" autocomplete="off">
                </div>
                <div class="inputitem radio">
                    <label for="gender">性别</label>
                    <input type="radio" name="age" id="radio1" value="女"><span>女</span>
                    <input type="radio" name="age" id="radio2" value="男"><span>男</span>
                    <input type="radio" name="age" id="radio3" value="保密" checked><span>保密</span>
                </div>
                <div class="inputitem">
                    <label for="birthday">生日</label>
                    <input type="text" name="birthday" id="birthday" autocomplete="off">
                </div>
                <div class="inputitem">
                    <label for="phone">电话</label>
                    <input type="text" name="phone" id="phone" autocomplete="off">
                </div>
                <div class="inputitem">
                    <label for="email">邮箱</label>
                    <input type="text" name="email" id="email" autocomplete="off">
                </div>
            </div>
            <input type="submit" value="submit" id="submit">
        </form>
    </div>
</div>
</body>
</html>
