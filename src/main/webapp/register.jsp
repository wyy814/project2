<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/12 0012
  Time: 9:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        #one{
            background-image: url(images/1.jpg);
            border: 1px;
            width: 350px;
            height: 250px;
            margin-top: 120px;
            margin-left: 400px;
            padding-top: 80px;
            padding-left: 120px;
            padding-right: 30px;
            padding-bottom: 100px;
        }
    </style>
    <script src="js/jquery-1.10.2.min.js"></script>
    <script>
        $(function () {
            
        })
    </script>
</head>
<body>
    <div id="one">
        <h1>注册</h1>
        <form action="user/register" method="post">
            <input type="text" name="name"/><br>
            <input type="password" name="password"/><br>
            <input type="password" name="password"/><br>
            <input type="button" name="注册"/><br>
            <input type="button" name="登录"/><br>
        </form>
    </div>
</body>
</html>
