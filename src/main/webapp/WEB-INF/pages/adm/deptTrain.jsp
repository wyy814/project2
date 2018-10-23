<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/23 0023
  Time: 18:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        table{
            margin-top: 40px;
            margin-left: 400px;
        }
        #no{
            text-align: center;
        }
    </style>
</head>
<body>
    <jsp:include page="base.jsp"/>
    <table border="1" cellspacing="0">
        <tr>
            <td>编号</td>
            <td>培训内容</td>
            <td>培训时间</td>
            <td>培训部门</td>
        </tr>

        <c:if test="${!empty requestScope.trains}">
            <c:forEach items="${requestScope.trains}" var="train">
                <tr>
                    <td>${train.id}</td>
                    <td>${train.name}</td>
                    <td>${train.tTime}</td>
                    <td>${train.tDept}</td>
                </tr>
            </c:forEach>
        </c:if>
        <c:if test="${empty requestScope.trains}">
            <tr>
                <td id="no" colspan="5">暂无培训</td>
            </tr>
        </c:if>
    </table>
</body>
</html>
