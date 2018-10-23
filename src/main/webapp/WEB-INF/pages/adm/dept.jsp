<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/16 0016
  Time: 16:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        table{
            font-size: 20px;
            margin-top: 10px;
            margin-left: 300px;
        }
    </style>
    <script type="text/javascript" src="/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".deleteDept").click(function () {
                var $td = $(this).parent().parent().children();
                var dept = $td[0].innerHTML;
                var flag=confirm("确定要删除"+dept+"吗？");
                if(!flag){
                    return false;
                }else {
                    var url="/adm/deleteDept";
                    var args={"dept":dept};
                    $.post(url,args,function (data) {
                        if(data=="ok"){
                            $td.remove();
                        }
                        if(data=="no"){
                            alert("该部门有员工，不能删除");
                        }
                    });
                    return false;
                }
            });
            $(".deletePosition").click(function () {
                var $td = $(this).parent().parent().children();
                var dept = $td[0].innerHTML;
                var position = $td[1].innerHTML;
                var flag=confirm("确定要删除"+dept+"的"+position+"职位吗？");
                if(!flag){
                    return false;
                }else {
                    var url="/adm/deletePosition";
                    var args={"dept":dept,"position":position};
                    $.post(url,args,function (data) {
                        if(data=="ok"){
                            $td.remove();
                        }
                        if(data=="no"){
                            alert("该职位有员工，不能删除");
                        }
                    });
                    return false;
                }
            })
        })
    </script>
</head>
<body>
    <jsp:include page="base.jsp"/>
    <form action="/adm/dp" method="post">
        <table>
            <tr>
                <td>部门</td>
                <td>操作</td>
            </tr>

            <c:forEach items="${requestScope.depts}" var="dept">
                <tr>
                    <td>${dept.name}</td>
                    <td><a class="deleteDept" href="#">删除</a></td>
                </tr>
            </c:forEach>

            <tr>
                <td><input type="text" name="dept"></td>
            </tr>

            <tr>
                <td>部门</td>
                <td>职位</td>
                <td>操作</td>
            </tr>

            <c:forEach items="${requestScope.positions}" var="position">
                <tr>
                    <td>${position.dName}</td>
                    <td>${position.name}</td>
                    <td><a class="deletePosition" href="#">删除</a></td>
                </tr>
            </c:forEach>

            <tr>
                <td><input type="text" name="positionForDept"></td>
                <td><input type="text" name="position"></td>
            </tr>

            <tr>
                <td><input type="submit" value="确定增加"></td>
            </tr>
        </table>
    </form>
</body>
</html>
