<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/15 0015
  Time: 15:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        #table{
            font-size: 20px;
            margin-top: 80px;
            margin-left: 400px;
        }
    </style>
    <script type="text/javascript" src="/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".delete").click(function () {
                var $td=$(this).parent().parent().children();
                var aName=$td[1].innerHTML;
                var flag=confirm("确定要删除"+aName+"的信息吗？");
                if(!flag){
                    return false;
                }else {
                    var id=$td[0].innerHTML;
                    var url="/adm/delete";
                    var args={"id":id};
                    $.post(url,args,function (data) {
                        if(data=="ok"){
                            $td.remove();
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
    <table id="table" border="1" cellspacing="0">
        <tr>
            <td>序号</td>
            <td>应聘者</td>
            <td>投递时间</td>
            <td>查看状态</td>
            <td>面试状态</td>
            <td>操作1</td>
            <td>操作2</td>
        </tr>

        <c:if test="${!empty requestScope.applies}">
            <c:forEach items="${requestScope.applies}" var="apply">
                <tr>
                    <td>${apply.id}</td>
                    <td>${apply.aName}</td>
                    <td>${apply.dTime}</td>
                    <td>${apply.cState}</td>
                    <td>${apply.inState}</td>
                    <td><a href="/adm/showResume?rId=${apply.rId}">查看</a></td>
                    <td><a class="delete" href="#">删除</a></td>
                </tr>
            </c:forEach>
        </c:if>
    </table>
</body>
</html>
