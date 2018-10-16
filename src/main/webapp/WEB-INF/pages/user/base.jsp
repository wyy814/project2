<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/10 0010
  Time: 13:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        body{
            background-image: url(/images/1.jpg);
        }
    </style>

    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/bootstrap-table-master/dist/bootstrap-table.min.css">

    <script src="/js/jquery-1.10.2.min.js"></script>
    <script src="/bootstrap/js/bootstrap.min.js"></script>

    <script src="/bootstrap-table-master/dist/bootstrap-table.min.js"></script>
    <script src="/bootstrap-table-master/dist/locale/bootstrap-table-zh-CN.min.js"></script>
    <script type="text/javascript">
        $(function () {
            var back = $("#back").val();
            if(back!=""){
                alert("通知：您有一份面试通知，请在反馈中查看");
            }
        })
    </script>
</head>
<body>
    <span>当前用户：${sessionScope.user.name}</span>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <ul class="nav navbar-nav">
                <li><a href="/user/back">反馈</a></li>
                <li><a href="/user/addUser">查看简历</a></li>
                <li><a href="/user/up">修改密码</a></li>
                <li><a href="/login.jsp">退出</a></li>
            </ul>
        </div>
    </nav>
    <input id="back" hidden="hidden" value="${requestScope.back}">
</body>
</html>
