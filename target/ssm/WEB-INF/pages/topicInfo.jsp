<%--
  Created by liuxianchun on 2020/11/25
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>无极论坛</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/register.css">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/css/bootstrap/js/bootstrap.min.js"></script>

    <style>
        .topic{
            width:100%;
            height:260px;
            margin-bottom:15px;
            border-left:1px solid #E5E5E5;
            border-right:1px solid #E5E5E5;
            border-top: 1px solid #E1E4E6;
            border-bottom: 1px solid #E1E4E6;
        }
        #main{
            position: absolute;
            margin-left: 240px;
            margin-top: 120px;
            width:950px;
        }
        #reply{
            height:250px;
            margin-top:35px;
            margin-bottom: 40px;
        }
        .topic_person{
            margin-top: 40px;
            margin-left: 10px;
            text-align:center;
            float:left;
        }
        .topic_text{
            float:right;
            width:850px;
            height:240px;
            margin-top:0;
            background-color: #F7F8FA;
            border-top:1px solid #E5E5E5;
            border-left:1px solid #E5E5E5;
        }
        .topic_context{
            width: 100%;
            height: 213px;
        }
        .comment{
            width:100%;
            height:260px;
            margin-bottom:15px;
            border-left:1px solid #E5E5E5;
            border-right:1px solid #E5E5E5;
            border-top: 1px solid #E1E4E6;
            border-bottom: 1px solid #E1E4E6;
        }
        .comment_text{
            float:right;
            width:850px;
            height:100%;
            margin-top:0;
            background-color: #F7F8FA;
            border-top:1px solid #E5E5E5;
            border-left:1px solid #E5E5E5;
        }
        .time{
            height:24px;
            float:right;
            font-size:5px;
            margin-top: 4px;
            margin-right: 5px;
        }
        .text{
            width: 100%;
            height:230px;
        }
        .logo{
            position: absolute;
            float:left;
            margin-top:25px;
            margin-left:300px;
            height:80px;
        }
        .logo >img{
            width:117px;
            height:57px;
        }
        #toReply{
            position: fixed;
            right: 120px;
            top:300px;
        }
        #toTop{
            position: fixed;
            right: 120px;
            top:365px;
        }
        #setting{
            float:right;
            margin-top: 25px;
            margin-right: 10px;
        }
        #search{
            position: absolute;
            float:left;
            margin-top:35px;
            margin-left:500px;
        }
        .person_img{
            width: 80px;
            height: 80px;
        }
    </style>
</head>
<body>
<div id="search" class="col-lg-7">
    <form id="form_search" class="form-group" method="post" action="#">
        <div class="col-lg-4"><input type="text" class="form-control" placeholder="请输入关键词"></div>
        <div class="col-lg-2"><button type="submit" class="btn btn-primary">搜索论坛</button></div>
    </form>
</div>
<a class="logo" href="${pageContext.request.contextPath}/page/main"><img src="${pageContext.request.contextPath}/static/img/logo.jpg" alt=""></a>

<div role="cell" id="setting">
    <ul class="nav nav-pills">
        <c:if test="${empty sessionScope.user}">
            <li><a href="${pageContext.request.contextPath}/page/login" style="color: #F22E00">请登录</a></li>
            <li><a href="${pageContext.request.contextPath}/page/register">注册</a></li>
        </c:if>
        <c:if test="${!empty sessionScope.user}">
            <li class="info-a">
                <a href="${pageContext.request.contextPath}/user/information" style="color: #F22E00">
                    <img style="width:30px;height: 30px" class="img-circle image-responsive" src="${pageContext.request.contextPath}/${user.image}" alt="">
                        ${sessionScope.user.userid}
                </a>
                <ul class="dropdown-menu">
                    <li><a href="${pageContext.request.contextPath}/user/information">账户管理</a></li>
                    <li role="separator" class="divider"></li>
                </ul>
            <li><a href="${pageContext.request.contextPath}/user/logout" class="login-out">退出登录</a></li>
        </c:if>
    </ul>
</div>
<a id="toReply" href="#reply"><img src="${pageContext.request.contextPath}/static/img/button/button_03.jpg" alt=""></a>
<a id="toTop" href="#"><img src="${pageContext.request.contextPath}/static/img/button/button_02.jpg" alt=""></a>
<div id="main">
<div class="topic">
    <div class="topic_person">
        <input type="image" src="${pageContext.request.contextPath}/${topic.user.image}" alt="" class="person_img">
        <p>${topic.userid}</p><br>
        <p style="font-size:12px;color: #2e6da4">楼主</p>
    </div>
        <span style="margin-left: 30px;color: #F22E00">【${topic.sort}】&nbsp;${topic.title}</span>
    <div class="topic_text"><div class="topic_context">${topic.context}</div>
    <div class="time">1楼&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${topic.time}" pattern="yyyy-MM-dd HH:mm:ss"/></div></div>
</div>
        <c:forEach items="${comments}" var="comment" varStatus="con">
            <div class="comment">
                <div class="topic_person">
                    <input type="image" src="${pageContext.request.contextPath}/${comment.user.image}" alt="" class="person_img">
                    <p>${comment.userid}</p><br>
                    <c:if test="${topic.userid==comment.userid}">
                        <p style="font-size:12px;color: #2e6da4">楼主</p>
                    </c:if>
                </div>
                <div class="comment_text">
                    <div class="text">${comment.context}</div>
                <div class="time">${con.count+1}楼&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${comment.time}" pattern="yyyy-MM-dd HH:mm:ss"/></div></div>
            </div>
        </c:forEach>

    <div class="form-group" id="reply">
        <label for="context">发表回复</label>
        <form action="${pageContext.request.contextPath}/comment/addComment" method="post">
            <input type="hidden" name="userid" value="${pageScope.user.userid}">
            <input type="hidden" name="topicid" value="${topic.topicid}">
            <textarea class="form-control" style="resize:none;height:180px" id="context" placeholder="请输入正文" name="context" maxlength="500"></textarea>
            <div style="text-align: center;padding-top: 12px">
                <button type="submit" class="btn btn-primary">发表</button>
            </div></form>
    </div>
</div>


</body>
</html>
