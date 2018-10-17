<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/16 0016
  Time: 16:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        table{
            font-size: 20px;
            margin-top: 80px;
            margin-left: 400px;
        }
    </style>
</head>
<body>
    <jsp:include page="base.jsp"/>
    <form action="/adm/dp" method="post">
        <table>
            <tr>
                <td>部门</td>
            </tr>

            <c:forEach items="${requestScope.depts}" var="dept">
                <tr>
                    <td>${dept.name}</td>
                </tr>
            </c:forEach>

            <tr>
                <td><input type="text" name="dept"></td>
            </tr>

            <tr>
                <td>职位</td>
            </tr>

            <c:forEach items="${requestScope.positions}" var="position">
                <tr>
                    <td>${position.name}</td>
                </tr>
            </c:forEach>

            <tr>
                <td><input type="text" name="positionForDept"></td>
            </tr>

            <tr>
                <td><input type="text" name="position"></td>
            </tr>

            <tr>
                <td><input type="submit" value="确定增加"></td>
            </tr>
        </table>
    </form>
</body>
</html>
