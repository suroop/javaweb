<%--
  Created by IntelliJ IDEA.
  User: Surp
  Date: 2020/7/31
  Time: 9:59
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
    <link rel="stylesheet" href="./css/list.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"
          integrity="sha384-XdYbMnZ/QjLh6iI4ogqCTaIjrFk87ip+ekIjefZch0Y+PvJ8CDYtEs1ipDmPorQ+" crossorigin="anonymous">
    <script src="./js/jquery-3.5.1.js"></script>
    <script>
        $(document).ready(function(){
            $(window).scroll(function () {
                $(document).scrollTop(0);
            });
        });
    </script>
    <style>
        .opt-item a{
            color: white;
        }
        .btns a{
            color: black;
        }
    </style>
</head>
<body>
<div class="box">
    <div class="switch"><i class="fa fa-exchange" style="color: white;"></i></div>
    <img src="./img/1440.png" alt="">
    <div class="user-box">
        <form action="" method="POST">
            <div id="opt">
                <div class="select opt-item">
                    <label for="search1">用户名:</label>
                    <input type="search" id="search1">
                    <label for="search2">姓名:</label>
                    <input type="search" id="search2">
                    <label for="search3">邮箱:</label>
                    <input type="search" id="search3">
                    <button>select</button>
                </div>
                <div class="add opt-item">
                    <button><a href="${pageContext.request.contextPath}/add.jsp">add</a></button>
                    <button>delete selected</button>
                </div>
            </div>
            <div id="list">
                <table border="0">
                    <tr>
                        <th><label for="checked"><input type="checkbox" name="" id="checked"></label></th>
                        <th>用户名</th>
                        <th>密码</th>
                        <th>姓名</th>
                        <th>身份</th>
                        <th>年龄</th>
                        <th>性别</th>
                        <th>生日</th>
                        <th>电话</th>
                        <th>邮箱</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${requestScope.users}" var="user">
                        <tr>
                            <td><label for="checked"><input type="checkbox" name="" id="checked1"></label></td>
                            <td>${user.username}</td>
                            <td>${user.password}</td>
                            <td>${user.name}</td>
                            <td>${user.ident}</td>
                            <td>${user.age}</td>
                            <td>${user.gender}</td>
                            <td>${user.birthday}</td>
                            <td>${user.phone}</td>
                            <td>${user.email}</td>
                            <td>
                                <div class="btns">
                                    <button><%--<i class="fa fa-edit"></i>--%><a href="${pageContext.request.contextPath}/editServlet?id=${user.id}">&divide;</a></button>
                                    <button><a href="${pageContext.request.contextPath}/deleteServlet?id=${user.id}">&times;</a></button>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div id="tab">
                <div class="Pagination">
                    <button id="begin"> &lt; &lt;</button>
                    <button id="pageprev"> &lt;</button>
                    <button id="page1">2</button>
                    <button id="page2">3</button>
                    <button id="page3">4</button>
                    <button id="page4">5</button>
                    <button id="page5">6</button>
                    <button id="pagenext"> &gt;</button>
                    <button id="end">&gt;&gt;</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>