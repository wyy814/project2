<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/12 0012
  Time: 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .t1{
            align-content: center;
        }
        .t2{
            align-content: center;
        }
        .t3{
             align-content: center;
         }
    </style>
</head>
<body>
    <jsp:include page="base.jsp"/>
    <c:if test="${param.id==null}">
        <form action="${pageContext.request.contextPath}/userResume/insert" method="post">
            <table>
                <tr>
                    <td class="t1" colspan="4">简历</td>
                </tr>

                <tr>
                    <td>真实姓名</td>
                    <td><input type="text" name="name"></td>
                    <td>性别</td>
                    <td><input type="radio" name="sex" value="男">男
                        <input type="radio" name="sex" value="女">女</td>
                </tr>

                <tr>
                    <td>年龄</td>
                    <td><input type="number" name="age"></td>
                    <td>学历</td>
                    <td>
                        <select name="eduBg">
                            <option>学历</option>
                            <option>大专</option>
                            <option>本科</option>
                            <option>硕士</option>
                            <option>博士</option>
                            <option>其它</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td>联系方式</td>
                    <td><input type="tel" name="phone"></td>
                    <td>e-mail</td>
                    <td><input type="email" name="email"></td>
                </tr>

                <tr>
                    <td>应聘职位</td>
                    <td>
                        <select name="dept">
                            <option>-部门-</option>
                            <c:forEach items="${requestScope.depts}" var="dept">
                                <option>${dept.name}</option>
                            </c:forEach>
                        </select>

                        <select name="position">
                            <option>-职位-</option>
                            <c:forEach items="${requestScope.positions}" var="position">
                                <option>${position.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>政治面貌</td>
                    <td>
                        <select name="political">
                            <option>普通群众</option>
                            <option>团员</option>
                            <option>党员</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td>上份工作</td>
                    <td><input type="text" name="onJob" placeholder="请输入工作名称"></td>
                    <td>工作经验</td>
                    <td><input type="text" name="workExp"></td>
                </tr>

                <tr>
                    <td>期望薪资</td>
                    <td>
                        <select name="salary">
                            <option>4000-6000</option>
                            <option>6000-8000</option>
                            <option>8000-10000</option>
                            <option>10000-15000</option>
                            <option>15000-20000</option>
                            <option>其它</option>
                        </select>
                    </td>
                    <td>兴趣爱好</td>
                    <td><input type="text" name="hobby"></td>
                </tr>

                <tr>
                    <td class="t2" colspan="2"><input type="submit" value="保存"></td>
                    <td class="t3" colspan="2"><input type="button" value="返回"></td>
                </tr>
            </table>
        </form>
    </c:if>

    <c:if test="${param.id!=null}">
        <form action="${pageContext.request.contextPath}/userResume/update" method="post">
            <input hidden="hidden" name="id" value="${requestScope.userResume.id}">
            <table>
                <tr>
                    <td class="t1" colspan="4">简历</td>
                </tr>

                <tr>
                    <td>真实姓名</td>
                    <td><input type="text" name="name" value="${requestScope.userResume.name}"></td>
                    <td>性别</td>
                    <td>
                        <c:if test="${requestScope.userResume.sex=='男'}">
                            <input type="radio" name="sex" checked="checked" value="男">男
                            <input type="radio" name="sex" value="女">女
                        </c:if>
                        <c:if test="${requestScope.userResume.sex=='女'}">
                            <input type="radio" name="sex" value="男">男
                            <input type="radio" name="sex" checked="checked" value="女">女
                        </c:if>
                    </td>
                </tr>

                <tr>
                    <td>年龄</td>
                    <td><input type="number" name="age" value="${requestScope.userResume.age}"></td>
                    <td>学历</td>
                    <td>
                        <select name="eduBg">
                            <option>学历</option>
                            <option>大专</option>
                            <option>本科</option>
                            <option>硕士</option>
                            <option>博士</option>
                            <option>其它</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td>联系方式</td>
                    <td><input type="tel" name="phone" value="${requestScope.userResume.phone}"></td>
                    <td>e-mail</td>
                    <td><input type="email" name="email" value="${requestScope.userResume.email}"></td>
                </tr>

                <tr>
                    <td>应聘职位</td>
                    <td>
                        <select name="dept">
                            <option>-部门-</option>
                            <c:forEach items="${requestScope.depts}" var="dept">
                                <c:if test="${requestScope.userResume.dept==dept.name}">
                                    <option selected="selected">${dept.name}</option>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${requestScope.depts}" var="dept">
                                <c:if test="${requestScope.userResume.dept!=dept.name}">
                                    <option>${dept.name}</option>
                                </c:if>
                            </c:forEach>
                        </select>

                        <select name="position">
                            <option>-职位-</option>
                            <c:forEach items="${requestScope.positions}" var="position">
                                <c:if test="${requestScope.userResume.position==position.name}">
                                    <option selected="selected">${position.name}</option>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${requestScope.positions}" var="position">
                                <c:if test="${requestScope.userResume.position!=position.name}">
                                    <option>${position.name}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </td>
                    <td>政治面貌</td>
                    <td>
                        <select name="political">
                            <option>普通群众</option>
                            <option>团员</option>
                            <option>党员</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td>上份工作</td>
                    <td><input type="text" name="onJob" value="${requestScope.userResume.onJob}"></td>
                    <td>工作经验</td>
                    <td><input type="text" name="workExp" value="${requestScope.userResume.workExp}"></td>
                </tr>

                <tr>
                    <td>期望薪资</td>
                    <td>
                        <select name="salary">
                            <option>4000-6000</option>
                            <option>6000-8000</option>
                            <option>8000-10000</option>
                            <option>10000-15000</option>
                            <option>15000-20000</option>
                            <option>其它</option>
                        </select>
                    </td>
                    <td>兴趣爱好</td>
                    <td><input type="text" name="hobby" value="${requestScope.userResume.hobby}"></td>
                </tr>

                <tr>
                    <td class="t2" colspan="2"><input type="submit" value="保存"></td>
                    <td class="t3" colspan="2"><input type="button" value="返回"></td>
                </tr>
            </table>
    </c:if>
</body>
</html>
