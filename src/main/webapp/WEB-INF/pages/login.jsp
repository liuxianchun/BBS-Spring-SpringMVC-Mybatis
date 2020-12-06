<%--
  Created by liuxianchun on 2020/11/21
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding ="UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录无极账号</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/register.css">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/css/bootstrap/js/bootstrap.min.js"></script>
    <style>
        body{
            background-image: url("${pageContext.request.contextPath}/static/img/banner_02.jpg");
        }
    </style>
    <script type="text/javascript">
        window.onload=function(){
            $("#error_msg").html("${msg}");
            $("#form").submit(function(){
                return checkUserid()&&checkPassword();
                /* if(false===(checkUserid()&&checkPassword()&&checkProtocol()))
                     $("#submit").prop("disabled",true);//锁定提交按钮，不可操作*/
            });
        }
        function checkUserid(){
            var userid = $("#userid").val();
            var reg_userid = /^\w{6,12}$/;
            var flag = reg_userid.test(userid);
            if(!flag)
                $("#error_msg").html("账号或密码错误");
            else
                $("#error_msg").html("");
            return flag;
        }
        function checkPassword(){
            var password = $("#password").val();
            var reg_password = /^\w{6,12}$/;
            var flag = reg_password.test(password);
            if(!flag)
                $("#error_msg").html("账号或密码错误");
            else
                $("#error_msg").html("");
            return flag;
        }
    </script>

</head>
<body>
<div class="div_left">
    <div class="container">
        <h1>无极论坛,畅想无极限</h1>
    </div>
</div>
<div class="div_login">
    <h1>欢迎登录</h1>
    <p>没有账号？<a href="${pageContext.request.contextPath}/page/register">注册</a></p><br>
    <form class="form-horizontal" id="form" action="${pageContext.request.contextPath}/user/login" method="post">
        <div class="form-group">
            <label for="userid" class="col-lg-2 control-label">用户名</label>
            <div class="col-lg-10">
                <input type="text" class="form-control" id="userid" name="userid" placeholder="请输入用户名">
            </div>
        </div>
        <p class="error"><span class="text-center"></span></p>
        <div class="form-group">
            <label for="password" class="col-lg-2 control-label">密码</label>
            <div class="col-lg-10">
                <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
            </div>
        </div>
        <p class="error"><span class="text-center"></span></p>

        <div class="col-lg-offset-2 col-lg-10">
            <button type="submit" class="btn btn-primary btn-block" id="submit">登录</button>
        </div>
        <p class="error"><span id="error_msg" class="text-center"></span></p>
    </form>
</div>
</body>
</html>
