<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/17 0017
  Time: 18:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        table{
            font-size: 30px;
            margin-top: 80px;
            margin-left: 400px;
        }
    </style>
    <script type="text/javascript" src="/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".first").blur(function(){
                var dept = $(this).val();
                $(".position").empty();
                var html="";
                $.ajax({
                    url:"/adm/two",
                    type:"POST",
                    dataType:"json",
                    data:{"dName":dept},
                    success:function(data){
                        $.each(data,function(idx,item){
                            html+="<option>"+item.name+"</option>"
                        });
                        $(html).appendTo(".position");
                    }
                })
            });
        })
    </script>
</head>
<body>
    <jsp:include page="base.jsp"/>
    <form action="/adm/updateDp" method="post">
        <input hidden="hidden" name="rId" value="${requestScope.own.rId}">
        <table>
            <tr>
                <td>部门</td>
                <td>职位</td>
            </tr>

            <tr>
                <td>
                    <select name="dept" class="first">
                        <c:forEach items="${requestScope.depts}" var="dept">
                            <c:if test="${requestScope.own.dept==dept.name}">
                                <option selected="selected">${dept.name}</option>
                            </c:if>
                        </c:forEach>
                        <c:forEach items="${requestScope.depts}" var="dept">
                            <c:if test="${requestScope.own.dept!=dept.name}">
                                <option>${dept.name}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </td>

                <td>
                    <select name="position" class="position">
                        <c:forEach items="${requestScope.positions}" var="position">
                            <c:if test="${requestScope.own.position==position.name}">
                                <option selected="selected">${position.name}</option>
                            </c:if>
                        </c:forEach>
                        <c:forEach items="${requestScope.positions}" var="position">
                            <c:if test="${requestScope.own.position!=position.name}">
                                <option>${position.name}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </td>
            </tr>

            <tr>
                <td><input type="submit" value="确认调动"></td>
            </tr>
        </table>
    </form>
</body>
</html>
