<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/19 0019
  Time: 18:18
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
    <script type="text/javascript" src="/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#wrong").click(function () {
                var id = $("#id").val();
                var rec = window.prompt("请输入异议理由");
                var url = "/emp/wrong";
                var args = {"id":id,"rec":rec};
                $.post(url,args,function (data) {
                    if(data=="ok"){
                        alert("提交成功");
                    }
                });
                return false;
            })
        })
    </script>
</head>
<body>
    <jsp:include page="base.jsp"/>
    <input id="id" hidden="hidden" name="id" value="${requestScope.salary.id}">
    <table id="table" border="1" cellspacing="0">
        <tr>
            <td>基本工资</td>
            <td>绩效工资</td>
            <td>奖惩工资</td>
            <td>社保</td>
            <td>总工资</td>
            <td>是否有异议</td>
        </tr>

        <c:if test="${!empty requestScope.salary}">
            <tr>
                <td>${requestScope.salary.bSalary}</td>
                <td>${requestScope.salary.pSalary}</td>
                <td>${requestScope.salary.rpSalary}</td>
                <td>${requestScope.salary.sSalary}</td>
                <c:if test="${requestScope.salary.bSalary+requestScope.salary.pSalary+requestScope.salary.rpSalary+requestScope.salary.sSalary>=0}">
                    <td>${requestScope.salary.bSalary+requestScope.salary.pSalary+requestScope.salary.rpSalary+requestScope.salary.sSalary}</td>
                </c:if>
                <c:if test="${requestScope.salary.bSalary+requestScope.salary.pSalary+requestScope.salary.rpSalary+requestScope.salary.sSalary<0}">
                    <td>0</td>
                </c:if>
                <td><a id="wrong" href="#">异议</a></td>
            </tr>
        </c:if>
    </table>
</body>
</html>
