<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/18 0018
  Time: 13:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        #table{
            font-size: 20px;
            margin-top: 80px;
            margin-left: 300px;
        }
    </style>
</head>
<body>
    <jsp:include page="base.jsp"/>
    <table id="table" border="1" cellspacing="0">
        <tr>
            <td>编号</td>
            <td>奖惩人员</td>
            <td>奖惩缘由</td>
            <td>奖惩时间</td>
            <td>奖金金额</td>
            <td>奖惩类型</td>
        </tr>

       <c:if test="${!empty requestScope.reAndPus}">
           <c:forEach items="${requestScope.reAndPus}" var="reAndPu">
               <tr>
                   <td>${reAndPu.id}</td>
                   <td>${reAndPu.eName}</td>
                   <td>${reAndPu.why}</td>
                   <td>${reAndPu.time}</td>
                   <td>${reAndPu.num}</td>
                   <td>${reAndPu.type}</td>
               </tr>
           </c:forEach>
       </c:if>
    </table>
</body>
</html>
