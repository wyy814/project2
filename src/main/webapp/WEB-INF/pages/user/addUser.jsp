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
        .table{
            width: 10px;
            height: 20px;
            margin-top: 40px;
            margin-left: 0;
        }
        .t1{
            text-align: center;
        }
        .t2{
            text-align: center;
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
                    url:"/user/two",
                    type:"POST",
                    dataType:"json",
                    data:{"dName":dept},
                    success:function(data){
                        $.each(data,function(idx,item){
                            html+="<option>"+item.name+"</option>"
                        });
                        $(html).appendTo(".position")
                    }
                })
            });
        })
    </script>
</head>
<body>
    <jsp:include page="base.jsp"/>
    <c:if test="${requestScope.userResume.id==null}">
        <form action="/user/insert" method="post">
            <input id="uName" hidden="hidden" name="uName" value="${sessionScope.user.name}">
            <table class="table" border="1">
                <tr>
                    <td class="t1" colspan="4">简历</td>
                </tr>

                <tr>
                    <td>真实姓名</td>
                    <td><input type="text" name="name"></td>
                    <td>性别</td>
                    <td><input type="radio" name="sex" checked="checked" value="男">男
                        <input type="radio" name="sex" value="女">女</td>
                </tr>

                <tr>
                    <td>年龄</td>
                    <td><input type="number" name="age"></td>
                    <td>学历</td>
                    <td>
                        <select name="eduBg">
                            <option>大专</option>
                            <option>本科</option>
                            <option>硕士</option>
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
                        <select class="first" name="dept">
                            <option>-部门-</option>
                            <c:forEach items="${requestScope.depts}" var="dept">
                                <option>${dept.name}</option>
                            </c:forEach>
                        </select>

                        <select name="position" class="position">
                            <c:forEach items="${requestScope.positions}" var="position">
                                <option>-职位-</option>
                                <option>${position.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>政治面貌</td>
                    <td>
                        <select name="political">
                            <option>群众</option>
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
                            <option>其它</option>
                        </select>
                    </td>
                    <td>兴趣爱好</td>
                    <td><input type="text" name="hobby"></td>
                </tr>

                <tr>
                    <td class="t2" colspan="4"><input type="submit" value="保存"></td>
                </tr>
            </table>
        </form>
    </c:if>

    <c:if test="${requestScope.userResume.id!=null}">
        <form action="/user/update" method="post">
            <input hidden="hidden" name="id" value="${requestScope.userResume.id}">
            <table class="table">
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
                            <c:if test="${requestScope.userResume.eduBg=='大专'}">
                                <option selected="selected">大专</option>
                                <option>本科</option>
                                <option>硕士</option>
                                <option>其它</option>
                            </c:if>

                            <c:if test="${requestScope.userResume.eduBg=='本科'}">
                                <option>大专</option>
                                <option selected="selected">本科</option>
                                <option>硕士</option>
                                <option>其它</option>
                            </c:if>

                            <c:if test="${requestScope.userResume.eduBg=='硕士'}">
                                <option>大专</option>
                                <option>本科</option>
                                <option selected="selected">硕士</option>
                                <option>其它</option>
                            </c:if>

                            <c:if test="${requestScope.userResume.eduBg=='其它'}">
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
                    <td><input type="tel" name="phone" value="${requestScope.userResume.phone}"></td>
                    <td>e-mail</td>
                    <td><input type="email" name="email" value="${requestScope.userResume.email}"></td>
                </tr>

                <tr>
                    <td>应聘职位</td>
                    <td>
                        <select name="dept" class="first">
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

                        <select name="position" class="position">
                            <c:forEach items="${requestScope.positions}" var="position">
                                <c:if test="${requestScope.userResume.position==position.name}">
                                    <option>-职位-</option>
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
                            <c:if test="${requestScope.userResume.political=='群众'}">
                                <option selected="selected">群众</option>
                                <option>团员</option>
                                <option>党员</option>
                            </c:if>

                            <c:if test="${requestScope.userResume.political=='团员'}">
                                <option>群众</option>
                                <option selected="selected">团员</option>
                                <option>党员</option>
                            </c:if>

                            <c:if test="${requestScope.userResume.political=='党员'}">
                                <option>群众</option>
                                <option>团员</option>
                                <option selected="selected">党员</option>
                            </c:if>
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
                            <c:if test="${requestScope.userResume.salary=='4000-6000'}">
                                <option selected="selected">4000-6000</option>
                                <option>6000-8000</option>
                                <option>8000-10000</option>
                                <option>其它</option>
                            </c:if>

                            <c:if test="${requestScope.userResume.salary=='6000-8000'}">
                                <option>4000-6000</option>
                                <option selected="selected">6000-8000</option>
                                <option>8000-10000</option>
                                <option>其它</option>
                            </c:if>

                            <c:if test="${requestScope.userResume.salary=='8000-10000'}">
                                <option>4000-6000</option>
                                <option>6000-8000</option>
                                <option selected="selected">8000-10000</option>
                                <option>其它</option>
                            </c:if>

                            <c:if test="${requestScope.userResume.salary=='其它'}">
                                <option>4000-6000</option>
                                <option>6000-8000</option>
                                <option>8000-10000</option>
                                <option selected="selected">其它</option>
                            </c:if>
                        </select>
                    </td>
                    <td>兴趣爱好</td>
                    <td><input type="text" name="hobby" value="${requestScope.userResume.hobby}"></td>
                </tr>

                <tr>
                    <td class="t2" colspan="4"><input type="submit" value="保存"></td>
                </tr>
            </table>
    </c:if>
</body>
</html>
