<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/17 0017
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        table{
            margin-top: 20px;
            margin-left: 400px;
        }
        #main{
            text-align: center;
        }
    </style>
</head>
<body>
<jsp:include page="base.jsp"/>
<table border="1" cellspacing="0">
    <tr>
        <td id="main" colspan="4">离职人员</td>
    </tr>

    <tr>
        <td>编号</td>
        <td>姓名</td>
        <td>离职部门</td>
        <td>离职职位</td>
    </tr>
    <c:if test="${!empty requestScope.owns}">
        <c:forEach items="${requestScope.owns}" var="own">
            <tr>
                <td>${own.rId}</td>
                <td>${own.name}</td>
                <td>${own.dept}</td>
                <td>${own.position}</td>
            </tr>
        </c:forEach>
    </c:if>
</table>
</body>
</html>
