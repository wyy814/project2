<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/16 0016
  Time: 19:09
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
    <form action="/adm/add" method="post">
        <table>
            <tr>
                <td>培训</td>
            </tr>

            <c:forEach items="${requestScope.trains}" var="train">
                <tr>
                    <td><a href="/adm/edit?id=${train.id}">${train.name}</a></td>
                </tr>
            </c:forEach>

            <tr>
                <td>培训--详情</td>
            </tr>

            <tr>
                <td>培训名称：</td>
                <td><input type="text" name="name"></td>
            </tr>

            <tr>
                <td>培训时间：</td>
                <td><input type="date" name="tTime" min="2018-10-25"></td>
            </tr>

            <tr>
                <td>培训部门：</td>
                <td>
                    <select name="tDept">
                        <c:forEach items="${requestScope.depts}" var="dept">
                            <option>${dept.name}</option>
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
