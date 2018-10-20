<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/20 0020
  Time: 9:32
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
        #table1{
            margin-left: 360px;
        }
    </style>
    <script type="text/javascript" src="/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#back").click(function () {
                alert("驳回成功");
            })
        })
    </script>
</head>
<body>
    <jsp:include page="base.jsp"/>
    <table id="table" border="1" cellspacing="0">
        <tr>
            <td>异议员工编号</td>
            <td>异议缘由</td>
            <td>工资发放时间</td>
        </tr>

        <c:if test="${!empty requestScope.salaries}">
            <c:forEach items="${requestScope.salaries}" var="salary">
                <tr>
                    <td>${salary.id}</td>
                    <td>${salary.rec}</td>
                    <td>${salary.time}</td>
                </tr>
            </c:forEach>
        </c:if>
    </table>

    <table id="table1" border="1" cellspacing="0">
        <tr>
            <td>基本工资</td>
            <td>绩效工资</td>
            <td>奖惩工资</td>
            <td>社保</td>
            <td>总工资</td>
            <td>操作</td>
        </tr>

        <c:if test="${!empty requestScope.salaries}">
            <c:forEach items="${requestScope.salaries}" var="salary">
                <tr>
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
                    <td><a id="back" href="/adm/back?id=${salary.id}">驳回</a></td>
                </tr>
            </c:forEach>
        </c:if>
    </table>
</body>
</html>
