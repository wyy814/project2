<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/19 0019
  Time: 19:40
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
        #no{
            text-align: center;
        }
    </style>
</head>
<body>
    <jsp:include page="base.jsp"/>
    <table id="table" border="1" cellspacing="0">
        <tr>
            <td>员工</td>
            <td>基本工资</td>
            <td>绩效工资</td>
            <td>奖惩工资</td>
            <td>社保</td>
            <td>总工资</td>
        </tr>

        <c:if test="${!empty requestScope.salaries}">
            <c:forEach items="${requestScope.salaries}" var="salary">
                <tr>
                    <td>${salary.id}</td>
                    <td>${salary.bSalary}</td>
                    <td>${salary.pSalary}</td>
                    <td>${salary.rpSalary}</td>
                    <td>${salary.sSalary}</td>
                    <c:if test="${salary.bSalary+salary.pSalary+salary.rpSalary+salary.sSalary>=0}">
                        <td>${salary.bSalary+salary.pSalary+salary.rpSalary+salary.sSalary}</td>
                    </c:if>
                    <c:if test="${salary.bSalary+salary.pSalary+salary.rpSalary+salary.sSalary<0}">
                        <td>0</td>
                    </c:if>
                </tr>
            </c:forEach>
        </c:if>
        <c:if test="${empty requestScope.salaries}">
            <tr>
                <td id="no" colspan="5">暂无工资记录</td>
            </tr>
        </c:if>
    </table>
</body>
</html>
