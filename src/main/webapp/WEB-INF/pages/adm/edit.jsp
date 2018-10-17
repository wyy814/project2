<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/16 0016
  Time: 20:00
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
    <form action="/adm/update" method="post">
        <input hidden="hidden" name="id" value="${requestScope.train.id}">
        <table>
            <tr>
                <td>培训--详情</td>
            </tr>

            <tr>
                <td>培训名称：</td>
                <td><input type="text" name="name" value="${requestScope.train.name}"></td>
            </tr>

            <tr>
                <td>培训时间：</td>
                <td><input type="date" name="tTime" value="${requestScope.train.tTime}" min="2018-10-25"></td>
            </tr>

            <tr>
                <td>培训部门：</td>
                <td>
                    <select name="tDept">
                        <c:forEach items="${requestScope.depts}" var="dept">
                            <c:if test="${requestScope.train.tDept==dept.name}">
                                <option selected="selected">${dept.name}</option>
                            </c:if>
                        </c:forEach>

                        <c:forEach items="${requestScope.depts}" var="dept">
                            <c:if test="${requestScope.train.tDept!=dept.name}">
                                <option>${dept.name}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </td>
            </tr>

            <tr>
                <td><input type="submit" value="确认"></td>
            </tr>
        </table>
    </form>
</body>
</html>
