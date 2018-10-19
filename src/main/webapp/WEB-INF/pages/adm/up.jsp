<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/18 0018
  Time: 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        #table{
            font-size: 20px;
            margin-top: 60px;
            margin-left: 300px;
        }
        #table2{
            font-size: 20px;
            margin-left: 300px;
        }
        #t1{
            text-align: center;
        }
        #t2{
            text-align: center;
        }
        #t3{
            text-align: center;
        }
    </style>
</head>
<body>
    <jsp:include page="base.jsp"/>
        <table id="table" border="1" cellspacing="0">
            <tr>
                <td id="t1" colspan="4">员工信息</td>
            </tr>

            <tr>
                <td>姓名</td>
                <td>${requestScope.own.name}</td>
                <td>性别</td>
                <td>${requestScope.own.sex}</td>
            </tr>

            <tr>
                <td>年龄</td>
                <td>${requestScope.own.age}</td>
                <td>学历</td>
                <td>${requestScope.own.eduBg}</td>
            </tr>

            <tr>
                <td>联系方式</td>
                <td>${requestScope.own.phone}</td>
                <td>e-mail</td>
                <td>${requestScope.own.email}</td>
            </tr>

            <tr>
                <td>职位</td>
                <td>${requestScope.own.dept},${requestScope.own.position}</td>
                <td>政治面貌</td>
                <td>${requestScope.own.political}</td>
            </tr>

            <tr>
                <td>入职时间</td>
                <td>${requestScope.own.inTime}</td>
                <td>兴趣爱好</td>
                <td>${requestScope.own.hobby}</td>
            </tr>
        </table>
        <br><br>

        <form action="/adm/up" method="post">
            <input hidden="hidden" name="id" value="${requestScope.own.rId}">
            <input hidden="hidden" name="eName" value="${requestScope.own.name}">
            <table id="table2" border="1" cellspacing="0">
                <tr>
                    <td id="t2" colspan="2">奖惩</td>
                </tr>

                <tr>
                    <td>奖惩类型：</td>
                    <td>
                        <select name="type">
                            <option>赏</option>
                            <option>罚</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td>奖惩理由：</td>
                    <td><input type="text" name="why" ></td>
                </tr>

                <tr>
                    <td>金额：</td>
                    <td><input type="number" name="num" ></td>
                </tr>

                <tr>
                    <td>时间：</td>
                    <td><input type="date" name="time" ></td>
                </tr>

                <tr>
                    <td id="t3" colspan="2"><input type="submit" value="确认" ></td>
                </tr>
            </table>
        </form>
</body>
</html>
