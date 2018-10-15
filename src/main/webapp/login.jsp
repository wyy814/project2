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
            background-image: url(/images/1.jpg);
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
        #s2{
            color: red;
        }
        #s3{
            color: red;
        }
        #a{
            color: blue;
            size: 20px;
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#name").blur(function () {
                var name=$(this).val();
                var url="/user/name";
                var args={"name":name};
                $.post(url,args,function (data) {
                    if (data=="no") {
                        $("#s1").text("该用户不存在");
                    }
                    if (data=="yes") {
                        $("#s1").text("");
                    }
                })
            });
            $("form").submit(function () {
                var name=$("#name").val();
                var password=$("#password").val();
                var url="/user/login";
                var args={"name":name,"password":password};
                $.post(url,args,function (data) {
                    if(data=="false"){
                        $("#s2").text("密码错误");
                    }else {
                        location.href="/user/login2?name="+name;
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
            <input id="name" type="text" name="name" placeholder="用户名"/><span id="s1"></span><br><br>
            <input id="password" type="password" name="password" placeholder="密码"/><span id="s2"></span><br><br>
            <input id="login" type="submit" value="登录"/><br><br>
            <input type="button" value="取消" src="login.jsp"/>
        </form>
        <span id="s3">快来加入我们吧！</span><a id="a" href="register.jsp">注册</a>
    </div>
</body>
</html>
