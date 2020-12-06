<%--
  Created by liuxianchun on 2020/11/30
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>个人信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/register.css">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/css/bootstrap/js/bootstrap.min.js"></script>
    <style>
        body{
            background-image: url("${pageContext.request.contextPath}/static/img/banner_02.jpg");
        }
        .topic{
            width:45%;
            margin-top: 60px;
            margin-left:400px;
            padding: 20px;
            background-color: rgba(239, 238, 241,0.65);  /*透明度*/
            border-radius: 8px;
            text-align:left;
        }
        .form-group{
            margin-left:30px;
            margin-right: 30px;
        }
    </style>

</head>
<body>
<div class="topic">
    <form id="form" class="form-horizontal" action="${pageContext.request.contextPath}/user/saveInformation" method="post" enctype="multipart/form-data">
        <input type="hidden" value="${sessionScope.user.userid}" name="userid">
        <div class="form-group" style="margin: 15px 30px">
            <label for="phone">手机号</label>
            <input type="number" class="form-control" id="phone" name="phone" placeholder="请输入手机号" value="${sessionScope.user.phone}" oninput="if(value.length>11)value=value.slice(0,11)">
        </div>
        <div class="form-group" style="margin: 15px 30px">
            <label for="email">邮箱</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="请输入邮箱" maxlength="30" value="${sessionScope.user.email}">
        </div>
        <div class="form-group" style="margin: 15px 30px">
            <label for="birthday">出生日期</label>
            <input type="date" class="form-control" id="birthday" name="birthday" value="<fmt:formatDate value='${sessionScope.user.birthday}' pattern='yyyy-MM-dd'/>">
        </div>
        <div class="form-group" style="margin: 15px 30px"><label>性别</label>
            <c:if test="${sessionScope.user.gender=='女'}">
                <input type="radio" name="gender" value="男" id="male">男
                <input type="radio" name="gender" value="女" id="female" checked>女
            </c:if>
            <c:if test="${sessionScope.user.gender!='女'}">
                <input type="radio" name="gender" value="男" id="male" checked>男
                <input type="radio" name="gender" value="女" id="female">女
            </c:if>

        </div>
        <div class="form-group" style="margin: 15px 30px"><label>头像</label>
            <input type="file" id="file" name="file" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg">
        </div>
        <div class="form-group" style="margin: 15px 30px">
            <img src="${pageContext.request.contextPath}/${sessionScope.user.image}" style="width: 100px;height:100px" alt="">
            <label>${fileMsg}</label>
        </div>
        <div style="text-align: center;padding-bottom: 8px">
            <button type="submit" class="btn btn-primary" style="margin-left: 20px;margin-right: 8px">保存</button>
            <a href="${pageContext.request.contextPath}/page/main" class="btn btn-primary">返回主页</a>
        </div>

    </form>
</div>
</body>
</html>
