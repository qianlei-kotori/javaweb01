<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
		<title>教务管理系统-登录</title>
	    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
	    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">
	    <link href="css/bootstrap.min.css" rel="stylesheet">
	    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
	    <link href="css/animate.css" rel="stylesheet">
	    <link href="css/style.css" rel="stylesheet">
	    <link href="css/login.css" rel="stylesheet">
	    <!--[if lt IE 9]>
	    <meta http-equiv="refresh" content="0;ie.html" />
	    <![endif]-->
	    <script>
	        if (window.top !== window.self) {
	            window.top.location = window.location;
	        }
	    </script>
	</head>
	<body class="signin">
	<div class="signinpanel">
	    <div class="row">
	        <div class="col-sm-7">
	            <div class="signin-info">
	                <div class="logopanel m-b">
	                    <h1>教务管理系统</h1>
	                </div>
	                <div class="m-b"></div>
	                <h4>欢迎使用 <strong>教务管理系统</strong></h4>
	                <ul class="m-b">
	                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势一</li>
	                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势二</li>
	                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势三</li>
	                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势四</li>
	                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势五</li>
	                </ul>
	                <strong>还没有账号？ <a href="register.jsp">立即注册»</a></strong>
	            </div>
	        </div>
	        <div class="col-sm-5">
	            <form method="post" action="/login.action">
	                <h4 class="no-margins">登录：</h4>
	                <p class="m-t-md">登录到教务管理系统</p>
	                <input type="text" class="form-control uname" placeholder="用户名" name="a_name">
	                <input type="password" class="form-control pword m-b" placeholder="密码" name="a_password">
	                <a href="">忘记密码了？</a>
	                <input class="btn btn-success btn-block" type="submit" value="登录">
	            </form>
	        </div>
	    </div>
	    <div class="signup-footer">
	        <div class="pull-left">
	            © 2015 All Rights Reserved. 教务管理系统
	        </div>
	    </div>
	</div>
	</body>
</html>
		