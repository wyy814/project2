<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/15 0015
  Time: 16:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        #table{
            font-size: 25px;
            margin-top: 80px;
            margin-left: 300px;
        }
        #t1{
            text-align: center;
        }
        #t2{
            text-align: center;
        }
    </style>
</head>
<body>
    <jsp:include page="base.jsp"/>
    <form action="/adm/employed">
        <input hidden="hidden" name="rId" value="${requestScope.userResume.id}">
        <table id="table" border="1" cellspacing="0">
            <tr>
                <td id="t1" colspan="4">简历详情</td>
            </tr>

            <tr>
                <td>姓名</td>
                <td>${requestScope.userResume.name}</td>
                <td>性别</td>
                <td>${requestScope.userResume.sex}</td>
            </tr>

            <tr>
                <td>年龄</td>
                <td>${requestScope.userResume.age}</td>
                <td>学历</td>
                <td>${requestScope.userResume.eduBg}</td>
            </tr>

            <tr>
                <td>联系方式</td>
                <td>${requestScope.userResume.phone}</td>
                <td>e-mail</td>
                <td>${requestScope.userResume.email}</td>
            </tr>

            <tr>
                <td>应聘职位</td>
                <td>${requestScope.userResume.dept},${requestScope.userResume.position}</td>
                <td>政治面貌</td>
                <td>${requestScope.userResume.political}</td>
            </tr>

            <tr>
                <td>上份工作</td>
                <td>${requestScope.userResume.onJob}</td>
                <td>工作经验</td>
                <td>${requestScope.userResume.workExp}</td>
            </tr>

            <tr>
                <td>期望薪资</td>
                <td>${requestScope.userResume.salary}</td>
                <td>兴趣爱好</td>
                <td>${requestScope.userResume.hobby}</td>
            </tr>

            <tr>
                <td id="t2" colspan="4">
                    <input type="submit" value="录用">
                    <a href="base.jsp">不录用</a>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
