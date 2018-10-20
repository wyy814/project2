<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/19 0019
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        #table{
            margin-top: 40px;
            margin-left: 400px;
        }
    </style>
</head>
<body>
    <jsp:include page="base.jsp"/>
    <table id="table" border="1" cellspacing="0">
        <tr>
            <td>员工</td>
            <td>上班时间</td>
            <td>下班时间</td>
            <td>是否迟到</td>
            <td>是否早退</td>
        </tr>

        <c:if test="${!empty requestScope.cards}">
            <c:forEach items="${requestScope.cards}" var="card">
                <tr>
                    <td>${card.rId}</td>
                    <td>${card.uTime}</td>
                    <td>${card.dTime}</td>
                    <td>${card.ynLate}</td>
                    <td>${card.ynLeave}</td>
                </tr>
            </c:forEach>
        </c:if>
    </table>
</body>
</html>
