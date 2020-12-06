<%@ taglib prefix="resize" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by liuxianchun on 2020/11/25
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>发表帖子</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/register.css">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/css/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/css/bootstrap/js/bootstrap-select.js"></script>
    <style>
        body{
            background-image: url("${pageContext.request.contextPath}/static/img/banner_02.jpg");
        }
        .topic{
            width:50%;
            margin-top: 100px;
            margin-left:360px;
            padding-left:8px;
            padding-right: 8px;
            background-color: rgba(239, 238, 241,0.65);  /*透明度*/
            border-radius: 8px;
            text-align:left;
        }
        #context{
            height:200px;
        }
    </style>

    <script type="text/javascript">
        $(function () {
            $("#form").submit(function () {
                return checkTopic();
            });
        });
        /*标题和内容不为空*/
        function checkTopic() {
            var reg = /\S/g;
            var title = $("#title").val();
            var context = $("#context").val();
            var flag = reg.test(title)&&reg.test(context);
            return flag;
        }
    </script>
</head>
<body>
<div class="topic">
<form id="form" action="${pageContext.request.contextPath}/topic/addTopic" method="post">
    <input type="hidden" name="userid" value="${sessionScope.user.userid}">
    <div class="form-group" style="padding-top: 8px">
        <label for="title">标题</label>
        <input type="text" class="form-control" id="title" name="title" placeholder="请输入标题" maxlength="30">
    </div>
    <div class="form-group">
        <label for="context">内容</label>
        <textarea class="form-control" style="resize:none" id="context" placeholder="请输入正文" name="context" maxlength="500"></textarea>
    </div>
    <p>请选择分类</p>
    <div class="col-lg-2">
        <select class="select 9 form-control" id="selection" name="sort">
        <option value="综合">综合</option>
        <option value="明星">明星</option>
        <option value="电影">电影</option>
        <option value="科技">科技</option>
        <option value="数码">数码</option>
        <option value="体育">体育</option>
        <option value="地区">地区</option>
        <option value="小说">小说</option>
        <option value="游戏">游戏</option>
        </select>
    </div>
<div style="text-align: center;padding-bottom: 8px">
    <button type="submit" class="btn btn-primary" style="margin-left: 230px;margin-right: 8px">发表</button>
    <a href="${pageContext.request.contextPath}/page/main" class="btn btn-primary">返回主页</a>
</div>

</form>
</div>
</body>
</html>
