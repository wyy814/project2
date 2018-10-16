<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/15 0015
  Time: 15:33
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
        <td>序号</td>
        <td>面试时间</td>
        <td>操作</td>
    </tr>

    <c:if test="${!empty requestScope.backs}">
        <c:forEach items="${requestScope.backs}" var="back">
            <tr>
                <td>${back.rId}</td>
                <td>${back.inTime}</td>
                <td><a href="/adm/showResume2?rId=${back.rId}">查看</a></td></td>
            </tr>
        </c:forEach>
    </c:if>
</table>
</body>
</html>
