<%--
  Created by liuxianchun on 2020/11/21
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding ="UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>注册无极账号</title>
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
            $("#s_userid").html("${msg}");
            $("#form").submit(function(){
                return checkUserid()&&checkPassword()&&checkProtocol();
               /* if(false===(checkUserid()&&checkPassword()&&checkProtocol()))
                    $("#submit").prop("disabled",true);//锁定提交按钮，不可操作*/
            });
            $("#userid").blur(function(){
                checkUserid();
            });
            $("#password").blur(function(){
                checkPassword();
            });

        }
        function checkUserid(){
            var userid = $("#userid").val();
            var s_userid = $("#s_userid");
            var reg_userid = /^\w{6,12}$/;
            var flag = reg_userid.test(userid);
            if(!flag)
                s_userid.html("请输入6~12个字母或数字");
            else
                s_userid.html("");
            return flag;
        }
        function checkPassword(){
            var password = $("#password").val();
            var s_password = $("#s_password");
            var reg_password = /^\w{6,12}$/;
            var flag = reg_password.test(password);
            if(!flag)
                s_password.html("请输入6~12个字母或数字");
            else
                s_password.html("");
            return flag;
        }
        function checkProtocol(){
            var check = $("#protocol").prop("checked");
            return check;
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
    <h1>欢迎注册</h1>
    <p>已有账号？<a href="${pageContext.request.contextPath}/page/login">登录</a></p><br>
<form class="form-horizontal" id="form" action="${pageContext.request.contextPath}/user/register" method="post">
    <div class="form-group">
        <label for="userid" class="col-lg-2 control-label">用户名</label>
        <div class="col-lg-10">
            <input type="text" class="form-control" id="userid" name="userid" placeholder="请输入用户名">
        </div>
    </div>
    <p class="error"><span id="s_userid" class="text-center"></span></p>
    <div class="form-group">
        <label for="password" class="col-lg-2 control-label">密码</label>
        <div class="col-lg-10">
            <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
        </div>
    </div>
    <p class="error"><span id="s_password" class="text-center"></span></p>
        <div class="col-lg-offset-2 col-lg-10">
            <button type="submit" class="btn btn-primary btn-block" id="submit">注册</button>
        </div>
    <br><br>
    <p class="text-center"><input type="checkbox" checked id="protocol">
        阅读并接受<a href="${pageContext.request.contextPath}/page/user_protocol">《无极用户协议》</a></p>
</form>
</div>

</body>
</html>
