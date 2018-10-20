<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/19 0019
  Time: 15:50
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
            $(".in").click(function () {
                var $td = $(this).parent().parent().children();
                var rId = $td[0].innerHTML;
                var name = $td[1].innerHTML;
                var grade = $(".grade").val();
                var url = "/adm/in";
                var args = {"rId":rId,"grade":grade};
                $.post(url,args,function (date) {
                    if(date=="ok"){
                        alert(name+"的绩效增加成功");
                    }
                });
                return false;
            })
        })
    </script>
</head>
<body>
    <jsp:include page="base.jsp"/>
    <form>
        <table id="table" border="1" cellspacing="0">
            <tr>
                <td>编号</td>
                <td>姓名</td>
                <td>部门</td>
                <td>职位</td>
                <td>操作</td>
            </tr>

            <c:if test="${!empty requestScope.owns}">
                <c:forEach items="${requestScope.owns}" var="own">
                    <tr>
                        <td>${own.rId}</td>
                        <td>${own.name}</td>
                        <td>${own.dept}</td>
                        <td>${own.position}</td>
                        <td><input class="grade" type="number" name="grade" placeholder="新增当月绩效"></td>
                        <td><input class="in" type="submit" value="确认"></td>
                    </tr>
                </c:forEach>
            </c:if>
        </table>
    </form>
</body>
</html>
