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
    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#register").click(function () {
                var name=$("#name").val();
                if(name==""){
                    alert("用户名不能为空");
                    return false;
                }else {
                    var url="/user/name";
                    var args={"name":name};
                    $.post(url,args,function (data) {
                        if(data=="exist"){
                            $("#s1").test("该用户已存在");
                            return false;
                        }
                    });
                }
                var password1=$("#password1").val();
                var password2=$("#password2").val();
                if(password1==""||password2==""){
                    alert("密码不能为空");
                }
                if(password1!=password2){
                    $("#s2").test("两次密码不一致");
                }
            })
        })
    </script>
</head>
<body>
    <div id="one">
        <h1>注册</h1>
        <form action="user/register" method="post">
            <input id="name" type="text" name="name" placeholder="用户名"/><span id="s1"></span><br><br>
            <input id="password1" type="password" name="password" placeholder="密码"/><br><br>
            <input id="password2" type="password" placeholder="确认密码" /><span id="s2"></span><br><br>
            <input id="register" type="submit" value="注册"/><br><br>
            <input type="button" value="取消" src="register.jsp"/>
        </form>
    </div>
</body>
</html>
