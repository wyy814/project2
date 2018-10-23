<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/23 0023
  Time: 18:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        #table{
            font-size: 20px;
            margin-top: 80px;
            margin-left: 400px;
        }
    </style>
</head>
<body>
    <jsp:include page="base.jsp"/>
    <table id="table">
        <tr>
            <td>部门</td>
        </tr>

        <c:forEach items="${requestScope.depts}" var="dept">
            <tr>
                <td><a href="/adm/deptTrain?name=${dept.name}">${dept.name}</a></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
