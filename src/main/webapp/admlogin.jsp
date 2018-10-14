<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/12 0012
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        body{
            background-image: url(/images/2.png);
        }
        #one{
            border: 1px;
            width: 350px;
            height: 250px;
            margin-top: 80px;
            margin-left: 400px;
            padding-top: 80px;
            padding-left: 120px;
            padding-right: 30px;
            padding-bottom: 100px;
        }
        #s1{
            color: red;
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("form").submit(function () {
                var name=$("#name").val();
                var password=$("#password").val();
                var url="/adm/login";
                var args={"name":name,"password":password};
                $.post(url,args,function (data) {
                    if(data=="false"){
                        $("#s1").text("用户名或密码错误");
                    }else {
                        location.href="/adm/login2";
                    }
                });
                return false;
            });
        })
    </script>
</head>
<body>
    <div id="one">
        <h1>登录</h1>
        <form>
            <input id="name" type="text" name="name" placeholder="用户名"/><br><br>
            <input id="password" type="password" name="password" placeholder="密码"/><span id="s1"></span><br><br>
            <input id="login" type="submit" value="登录"/><br><br>
            <input type="button" value="取消" src="admlogin.jsp"/>
        </form>
    </div>
</body>
</html>
