<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/16 0016
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        #table{
            font-size: 25px;
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
                    url:"/emp/dept",
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
    <table id="table">
        <tr>
            <td>部门</td>
            <td>
                <select class="first">
                    <c:forEach items="${requestScope.depts}" var="dept">
                        <option>${dept.name}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>

        <tr></tr>

        <tr>
            <td>职位</td>
            <td>
                <select class="position">
                    <c:forEach items="${requestScope.positions}" var="position">
                        <option>${position.name}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
    </table>
</body>
</html>
