<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/15 0015
  Time: 21:38
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
    <table id="table" border="1" cellspacing="0">
        <tr>
            <td>投递时间</td>
            <td>面试时间</td>
            <td>是否录用</td>
        </tr>

        <c:if test="${!empty requestScope.back}">
            <tr>
                <td>${requestScope.back.tTime}</td>
                <td>${requestScope.back.inTime}</td>
                <td>${requestScope.back.employed}</td>
            </tr>
        </c:if>
    </table>
</body>
</html>
