<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
			<title>登录</title>
			<link rel="stylesheet" type="text/css" href="${css}/reset.css">
            <link rel="stylesheet" href="bootstrap-3.3.7/css/bootstrap.css" />
            <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.css">
            <script type="text/javascript" src="bootstrap-3.3.7/js/bootstrap.js" ></script>
            <script type="text/javascript" src="${js}/jquery-2.2.3.min.js" ></script>
	</head>
<body>
		<div id="login"style="margin-top: 10%">
			<div class="clearfix">
				<div class="col-md-12">
					<div class="title" style="margin: auto;overflow: hidden;">
						<p style="text-align: center;color: white;font-size: 150px;margin-bottom: 0;">Welcome</p>
						<p style="text-align: center;color: white;font-size: 70px;margin-top: 0;">家里蹲教务管理系统</p>
					</div>
				</div>
			</div> 
			<div class="clearfix" style="margin-top: 2%">
				<form action="login"  method="post">
					<div id="box"  style="width: 70%;margin: auto;">
						<div  class="input-group col-md-12">
							<span style="color: white;font-size: 60px;">账&nbsp;&nbsp;&nbsp;&nbsp;号：</span>
							<input type="text" name="acount" style="background-color: rgba(0,0,0,0);border:none;width: 50%;height: 60px;font-size: 60px;outline: none;color: white;">
							<div class="row"></div>
							<br>
						</div>
						<div  class="input-group col-md-12" style="margin-top: 5%;">
							<span style="color: white;font-size: 60px;">密&nbsp;&nbsp;&nbsp;&nbsp;码：</span>
							<input type="password" name="apwd" style="background-color: rgba(0,0,0,0);border:none;width: 50%;height: 60px;font-size: 60px;outline: none;color: white;">
							<img src="img/icon-invisible.gif" onclick="tu(this)"/>
							<div class="row"></div>
						</div>
						<div class="input-group col-md-12"style="margin-top: 5%;">
							<span style="color: white;font-size: 60px;">验证码：</span>
							<input type="text" name="verifyfile" style="background-color: rgba(0,0,0,0);border:none;width: 50%;height: 60px;font-size: 60px;outline: none;color: white;">
							<div class="row"></div>
						</div>
						<img  src="/ad/verifycode/" alt="加载失败">
						<h1 style = "color:white;text-align:center">${failMsg}</h1>
						<div class="input-group col-md-12 btn-group btn-group-lg" style="margin: auto;margin-top: 5%;width: 70%;">
							<input class="btn btn-primary" style="width: 100%;height: 150px;border-radius: 75px;font-size: 90px;color: white;background-color: #FF0000;" type="submit" value="登录">
						</div>
					</div>    
				</form>
			</div>
		</div>
</body>
<script>
	var flag = false;
	function tu(e){
		if (!flag) {
			var src1 = 'img/icon-visible.gif';
			e.setAttribute("src",src1);
			e.previousElementSibling.type="text";
			flag=true;
		} else{
			var src1 = 'img/icon-invisible.gif';
			e.setAttribute("src",src1);
			e.previousElementSibling.type="password";
			flag=false;
		}
	}
</script>
</html>
