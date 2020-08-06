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
        function formSubmit() {
            document.getElementById("Form2").submit();
        }
        $(document).ready(function(){
            $(window).scroll(function () {
                $(document).scrollTop(0);
            });
            $("#checked").click(function () {
                if($(this).prop("checked")){
                    $("input[type='checkbox']").prop("checked",true);
                }else {
                    $("input[type='checkbox']").prop("checked",false);
                }
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
        #tab .Pagination a {
            color: white;
        }
    </style>
</head>
<body>
<div class="box">
    <div class="switch"><i class="fa fa-exchange" style="color: white;"></i></div>
    <img src="./img/1440.png" alt="">
    <div class="user-box">
        <form action="" method="POST" id="Form1">
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
                    <button id="opt-item1"><a href="${pageContext.request.contextPath}/add.jsp">add</a></button>
                    <input type="submit" id="opt-item2" form="Form2" value="delete selected">
                </div>
            </div>
        </form>
        <form method="post" action="${pageContext.request.contextPath}/delSelectedServlet" id="Form2">
            <div id="list">
                <table border="0">
                    <tr>
                        <th><label for="checked"><input type="checkbox" name="uid0" id="checked"></label></th>
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
                    <c:forEach items="${requestScope.bp.users}" var="user">
                        <tr>
                            <td><label for="checked1"><input type="checkbox" name="uid" class="uid1" id="checked1" value="${user.id}"></label></td>
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
                                    <button><a href="${pageContext.request.contextPath}/editServlet?id=${user.id}">&divide;</a></button>
                                    <button><a href="${pageContext.request.contextPath}/deleteServlet?id=${user.id}">&times;</a></button>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            </form>
        <div id="tab">
            <div class="Pagination">
                    <%--如果当前页数不为1,则能回到首页 --%>
                    <%--如果当前页数不为1,则能前翻 --%>
                <c:if test="${requestScope.bp.currentPage!=1}">
                    <button id="begin"><a href="${pageContext.request.contextPath}/userlistServlet?toPage=1">&lt;&lt;</a></button>
                    <button id="pageprev"><a href="${pageContext.request.contextPath}/userlistServlet?toPage=${requestScope.bp.currentPage-1}">&lt;</a></button>
                </c:if>
                    <%--如果当前页数为1,则不能回到首页 --%>
                    <%--如果当前页数为1,则不能前翻 --%>
                <c:if test="${requestScope.bp.currentPage==1}">
                    <button id="begin" disabled><a href="javascript:void(0)">&lt;&lt;</a></button>
                    <button id="pageprev" disabled><a href="javascript:void(0)">&lt;</a></button>
                </c:if>
                    <%--如果当前页数为前5页--%>
                <c:if test="${requestScope.bp.currentPage<requestScope.bp.displayPage-requestScope.bp.halfPage}">
                    <button id="page0"><a href="${pageContext.request.contextPath}/userlistServlet?tpPage=1">1</a></button>
                    <button id="page1"><a href="${pageContext.request.contextPath}/userlistServlet?tpPage=2">2</a></button>
                    <button id="page2"><a href="${pageContext.request.contextPath}/userlistServlet?tpPage=3">3</a></button>
                    <button id="page3"><a href="${pageContext.request.contextPath}/userlistServlet?tpPage=4">4</a></button>
                    <button id="page4"><a href="${pageContext.request.contextPath}/userlistServlet?tpPage=5">5</a></button>
                </c:if>
                    <%--如果当前页数超过前5页--%>
                <c:if test="${requestScope.bp.currentPage>=requestScope.bp.displayPage-requestScope.bp.halfPage&&requestScope.bp.currentPage+requestScope.bp.halfPage<requestScope.bp.totalPage}">
                    <button id="page0"><a href="${pageContext.request.contextPath}/userlistServlet">${requestScope.bp.currentPage-2}</a></button>
                    <button id="page1"><a href="${pageContext.request.contextPath}/userlistServlet">${requestScope.bp.currentPage-1}</a></button>
                    <button id="page2"><a href="${pageContext.request.contextPath}/userlistServlet">${requestScope.bp.currentPage}</a></button>
                    <button id="page3"><a href="${pageContext.request.contextPath}/userlistServlet">${requestScope.bp.currentPage+1}</a></button>
                    <button id="page4"><a href="${pageContext.request.contextPath}/userlistServlet">${requestScope.bp.currentPage+2}</a></button>
                </c:if>
                    <%--如果当前页数为末5页--%>
                <c:if test="${requestScope.bp.currentPage+requestScope.bp.halfPage>=requestScope.bp.totalPage}">
                    <button id="page0">${requestScope.bp.totalPage-4}</button>
                    <button id="page1">${requestScope.bp.totalPage-3}</button>
                    <button id="page2">${requestScope.bp.totalPage-2}</button>
                    <button id="page3">${requestScope.bp.totalPage-1}</button>
                    <button id="page4">${requestScope.bp.totalPage}</button>
                </c:if>
                     <%--如果当前页数为末页,则不能回到末页 --%>
                     <%--如果当前页数为末页,则不能后翻 --%>
                <c:if test="${requestScope.bp.currentPage==requestScope.bp.totalPage}">
                    <button id="pagenext" disabled><a href="javascript:void(0)">&gt;</a></button>
                    <button id="pagenext" disabled><a href="javascript:void(0)">&gt;&gt;</a></button>
                </c:if>
                    <%--如果当前页数不为末页,则能回到末页 --%>
                    <%--如果当前页数不为末页,则能后翻 --%>
                <c:if test="${requestScope.bp.currentPage!=requestScope.bp.totalPage}">
                    <button id="pagenext"><a href="${pageContext.request.contextPath}/userlistServlet?toPage=${requestScope.bp.currentPage+1}">&gt;</a></button>
                    <button id="pagenext"><a href="${pageContext.request.contextPath}/userlistServlet?toPage=${requestScope.bp.totalPage}">&gt;&gt;</a></button>
                </c:if>
            </div>
        </div>
    </div>
</div>
</body>
</html>