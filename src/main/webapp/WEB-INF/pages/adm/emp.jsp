<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/17 0017
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        select{
            margin-top: 18px;
            margin-left: 400px;
        }
        table{
            margin-top: 20px;
            margin-left: 400px;
        }
        #cz{
            text-align: center;
        }
        #main{
             text-align: center;
        }
    </style>
    <script type="text/javascript" src="/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".delete").click(function () {
                var $td=$(this).parent().parent().children();
                var name=$td[1].innerHTML;
                var flag=confirm("确定要删除"+name+"吗？");
                if(!flag){
                    return false;
                }else {
                    var rId=$td[0].innerHTML;
                    var url="/adm/deleteOwn";
                    var args={"rId":rId};
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
    <table border="1" cellspacing="0">
        <tr>
            <td id="main" colspan="8">在职人员<a href="/adm/see">查看离职人员</a></td>
        </tr>

        <tr>
            <td>编号</td>
            <td>姓名</td>
            <td>部门</td>
            <td>职位</td>
            <td id="cz" colspan="4">操作</td>
        </tr>
        <c:if test="${!empty requestScope.owns}">
            <c:forEach items="${requestScope.owns}" var="own">
                <tr>
                    <td>${own.rId}</td>
                    <td><a href="/adm/name?rId=${own.rId}">${own.name}</a></td>
                    <td>${own.dept}</td>
                    <td>${own.position}</td>
                    <td><a href="/adm/move?rId=${own.rId}">人事调动</a></td>
                    <td><a>考勤</a></td>
                    <td><a>工资发放</a></td>
                    <td><a class="delete" href="#">开除</a></td>
                </tr>
            </c:forEach>
        </c:if>
    </table>
</body>
</html>
