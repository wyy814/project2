<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/16 0016
  Time: 13:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        #table{
            font-size: 25px;
            margin-top: 80px;
            margin-left: 300px;
        }
        #t1{
            text-align: center;
        }
        #t2{
            text-align: center;
        }
    </style>
</head>
<body>
    <jsp:include page="base.jsp"/>
    <form action="/emp/update" method="post">
        <input hidden="hidden" name="rId" value="${requestScope.own.rId}">
        <input hidden="hidden" name="dept" value="${requestScope.own.dept}">
        <input hidden="hidden" name="position" value="${requestScope.own.position}">
        <input hidden="hidden" name="inTime" value="${requestScope.own.inTime}">
        <table id="table" border="1" cellspacing="0">
            <tr>
                <td id="t1" colspan="4">个人信息</td>
            </tr>

            <tr>
                <td>真实姓名</td>
                <td><input type="text" name="name" value="${requestScope.own.name}"></td>
                <td>性别</td>
                <td>
                    <c:if test="${requestScope.own.sex=='男'}">
                        <input type="radio" name="sex" checked="checked" value="男">男
                        <input type="radio" name="sex" value="女">女
                    </c:if>
                    <c:if test="${requestScope.own.sex=='女'}">
                        <input type="radio" name="sex" value="男">男
                        <input type="radio" name="sex" checked="checked" value="女">女
                    </c:if>
                </td>
            </tr>

            <tr>
                <td>年龄</td>
                <td><input type="number" name="age" value="${requestScope.own.age}"></td>
                <td>学历</td>
                <td>
                    <select name="eduBg">
                        <c:if test="${requestScope.own.eduBg=='大专'}">
                            <option selected="selected">大专</option>
                            <option>本科</option>
                            <option>硕士</option>
                            <option>其它</option>
                        </c:if>

                        <c:if test="${requestScope.own.eduBg=='本科'}">
                            <option>大专</option>
                            <option selected="selected">本科</option>
                            <option>硕士</option>
                            <option>其它</option>
                        </c:if>

                        <c:if test="${requestScope.own.eduBg=='硕士'}">
                            <option>大专</option>
                            <option>本科</option>
                            <option selected="selected">硕士</option>
                            <option>其它</option>
                        </c:if>

                        <c:if test="${requestScope.own.eduBg=='其它'}">
                            <option>大专</option>
                            <option>本科</option>
                            <option>硕士</option>
                            <option selected="selected">其它</option>
                        </c:if>
                    </select>
                </td>
            </tr>

            <tr>
                <td>联系方式</td>
                <td><input type="tel" name="phone" value="${requestScope.own.phone}"></td>
                <td>e-mail</td>
                <td><input type="email" name="email" value="${requestScope.own.email}"></td>
            </tr>

            <tr>
                <td>应聘职位</td>
                <td>${requestScope.own.dept},${requestScope.own.position}</td>
                <td>政治面貌</td>
                <td>
                    <select name="political">
                        <c:if test="${requestScope.own.political=='群众'}">
                            <option selected="selected">群众</option>
                            <option>团员</option>
                            <option>党员</option>
                        </c:if>

                        <c:if test="${requestScope.own.political=='团员'}">
                            <option>群众</option>
                            <option selected="selected">团员</option>
                            <option>党员</option>
                        </c:if>

                        <c:if test="${requestScope.own.political=='党员'}">
                            <option>群众</option>
                            <option>团员</option>
                            <option selected="selected">党员</option>
                        </c:if>
                    </select>
                </td>
            </tr>

            <tr>
                <td>入职时间</td>
                <td>${requestScope.own.inTime}</td>
                <td>兴趣爱好</td>
                <td><input type="text" name="hobby" value="${requestScope.own.hobby}"></td>
            </tr>

            <tr>
                <td id="t2" colspan="4"><input type="submit" value="保存"></td>
            </tr>
        </table>
    </form>
</body>
</html>
