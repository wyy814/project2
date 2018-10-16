<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/15 0015
  Time: 9:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        table{
            margin-top: 80px;
            margin-left: 400px;
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
    </style>
    <script type="text/javascript" src="/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#p1").blur(function () {
                var p1 = $(this).val();
                var name = $("#name").val();
                var url = "/user/password";
                var args = {"name": name,"password":p1};
                $.post(url, args, function (data) {
                    if (data == "no") {
                        $("#s1").text("密码错误");
                    }
                    if (data == "yes") {
                        $("#s1").text("");
                    }
                })
            });
            $("#p2").blur(function () {
                var p2=$(this).val();
                if(p2==""){
                    $("#s2").text("密码为空");
                }else {
                    $("#s2").text("");
                }
            });
            $("#p3").blur(function () {
                var p3=$(this).val();
                if(p3==""){
                    $("#s3").text("密码为空");
                }else {
                    $("#s3").text("");
                }
            });
            $("#update").click(function () {
                var p2=$("#p2").val();
                var p3=$("#p3").val();
                if(p2!=p3){
                    $("#s3").text("密码不同");
                    return false;
                }
            })
        })
    </script>
</head>
<body>
    <jsp:include page="base.jsp"/>
    <form action="/user/updatePassword" method="post">
        <input id="name" hidden="hidden" name="name" value="${sessionScope.user.name}">
        <table>
            <tr>
                <td colspan="3"><h3>修改密码</h3></td>
            </tr>

            <tr>
                <td>原密码：</td>
                <td><input id="p1" type="text"></td>
                <td id="s1"></td>
            </tr>

            <tr></tr>

            <tr>
                <td>新密码：</td>
                <td><input id="p2" type="password" name="password"></td>
                <td id="s2"></td>
            </tr>

            <tr></tr>

            <tr>
                <td>密码确认：</td>
                <td><input id="p3" type="password"></td>
                <td id="s3"></td>
            </tr>

            <tr>
                <td colspan="2"><input id="update" type="submit" value="提交"></td>
            </tr>
        </table>
    </form>
</body>
</html>
