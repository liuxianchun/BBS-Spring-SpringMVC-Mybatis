<%--
  Created by liuxianchun on 2020/11/21
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
        p{
            margin: 0px;
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
        #main{
            position: absolute;
            margin-left: 180px;
            margin-top: 120px;
            width:950px;
        }
        .topic{
            width:100%;
            height:150px;
            border-left:1px solid #E5E5E5;
            border-right:1px solid #E5E5E5;
            border-top: 1px solid #E1E4E6;
            border-bottom: 1px solid #E1E4E6;
        }
        .topic_person{
            margin-top: 15px;
            margin-left:10px;
            text-align: center;
            float:left;
        }
        .topic_text{
            float:right;
            width:850px;
            height:130px;
            margin-top:0;
            background-color: #F7F8FA;
            border-top:1px solid #E5E5E5;
            border-left:1px solid #E5E5E5;
        }
        .date{
            font-size:5px;
        }
        #publish{
            position: fixed;
            right: 120px;
            top:300px;
        }
        #toTop{
            position: fixed;
            right: 120px;
            top:365px;
        }
        .person_img{
            width: 80px;
            height: 80px;
        }
    </style>
    <script type="text/javascript">
        $(function(){  //离开事件
            $(".topic").hover(function () {
                $(this).css("background-color","white");
                $(this).children(".topic_text").css("background-color","#F7F8FA");
            }).mousemove(function () {    //悬停事件
                $(this).css("background-color","#DCEFFE");
                $(this).children(".topic_text").css("background-color","#DCEFFE");
            });
        });
    </script>

</head>
<body>
<div id="search" class="col-lg-8">
    <form id="form_search" class="form-group" method="post" action="${pageContext.request.contextPath}/topic/search">
        <div class="col-lg-4"><input type="text" name="keywords" class="form-control" placeholder="请输入关键词" value="${keywords}"></div>
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
                    <span class="glyphicon glyphicon-triangle-bottom" style="font-size: 5px;margin-left: 7px;" aria-hidden="true">
                    </span>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="${pageContext.request.contextPath}/user/information">账户管理</a></li>
                    <li role="separator" class="divider"></li>
                </ul>
            <li><a href="${pageContext.request.contextPath}/user/logout" class="login-out">退出登录</a></li>
        </c:if>


    </ul>
</div>

<a id="publish" href="${pageContext.request.contextPath}/page/topicAdd"><img src="${pageContext.request.contextPath}/static/img/button/button_01.jpg" alt=""></a>
<a id="toTop" href="#"><img src="${pageContext.request.contextPath}/static/img/button/button_02.jpg" alt=""></a>
<div id="main">
<c:forEach items="${pageBean.list}" var="topic">
    <div class="topic">
        <div class="topic_person">
            <input type="image" src="${pageContext.request.contextPath}/${topic.user.image}" alt="" class="person_img">
            <p>${topic.userid}</p>
            <p class="date"><fmt:formatDate value="${topic.time}" pattern="yyyy-MM-dd"/></p>
        </div>
<form name="topic_info" method="post" id="topic_title" style="margin:0" action="${pageContext.request.contextPath}/comment/topicInfo">
    <input type="hidden" name="topicid" id="topicid" value="${topic.topicid}">
    <a href="javascript:void(0);" onclick="this.parentNode.submit();">
        <span style="margin-left: 30px">【${topic.sort}】&nbsp;${topic.title}</span></a>
</form>
        <div class="topic_text">
            <%--字数大于300则截取前300--%>
            <c:if test="${topic.context.length()>300}">
                <p>${topic.context.substring(0,300)}</p>
            </c:if>
            <c:if test="${topic.context.length()<=300}">
                <p>${topic.context}</p>
            </c:if>
        </div>
    </div>
</c:forEach>
    <nav aria-label="Page navigation">
        <ul class="pagination">
            <%--页面到头，禁用上一页--%>
            <c:if test="${pageBean.currentPage==1}">
                <li class="disabled"><a href="${pageContext.request.contextPath}/page/main?curPage=${pageBean.currentPage-1}&rows=10&keywords=${keywords}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
            </c:if>
            <c:if test="${pageBean.currentPage>1}">
                <li><a href="${pageContext.request.contextPath}/page/main?curPage=${pageBean.currentPage-1}&rows=10&keywords=${keywords}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
            </c:if>
            <%--页码排列--%>
            <c:forEach begin="${pageBean.currentPage-(pageBean.currentPage-1)%5}"
                       end="${pageBean.currentPage-(pageBean.currentPage-1)%5+5>pageBean.totalPage?pageBean.totalPage:pageBean.currentPage-(pageBean.currentPage-1)%5+5}" var="i">
                <%--当前页码--%>
                <c:if test="${pageBean.currentPage==i}">
                    <li class="active"><a href="${pageContext.request.contextPath}/page/main?curPage=${i}&rows=10&keywords=${keywords}">${i}</a></li>
                </c:if>
                <%--非当前页码--%>
                <c:if test="${pageBean.currentPage!=i}">
                    <li><a href="${pageContext.request.contextPath}/page/main?curPage=${i}&rows=10&keywords=${keywords}">${i}</a></li>
                </c:if>
            </c:forEach>
                <%--页面到尾，禁用下一页--%>
            <c:if test="${pageBean.currentPage==pageBean.totalPage}">
                <li class="disabled"><a href="${pageContext.request.contextPath}/page/main?curPage=${pageBean.currentPage+1}&rows=10&keywords=${keywords}" aria-label="Previous"><span aria-hidden="true">&raquo;</span></a></li>
            </c:if>
            <c:if test="${pageBean.currentPage<pageBean.totalPage}">
                <li><a href="${pageContext.request.contextPath}/page/main?curPage=${pageBean.currentPage+1}&rows=10&keywords=${keywords}" aria-label="Previous"><span aria-hidden="true">&raquo;</span></a></li>
            </c:if>
                <span style="margin-left:18px;font-size:16px;color:cornflowerblue;vertical-align: center">一共${pageBean.totalCount}条记录,当前第${pageBean.currentPage}页</span>
        </ul>
    </nav>

</div>
</body>
</html>
