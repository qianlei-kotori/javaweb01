<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<link rel="stylesheet" href="bootstrap-3.3.7/css/bootstrap.css" />
		<link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.css">
		<script type="text/javascript" src="bootstrap-3.3.7/js/bootstrap.js" ></script>
		<script type="text/javascript" src="js/jquery-2.2.3.min.js" ></script>
		<script type="text/javascript" src="js/jquery.rapid.js" ></script>
		<title>修改信息</title>
	</head>
	<body>
	<div class="container">
	<div class="panel panel-danger">
	<div class="row clearfix panel panel-heading">
		<div class="col-md-12 column ">
			<div class="page-header " style="text-align: center;">
				<h1>修改信息</h1>
			</div>
		</div>
	</div>
            <form class="form-horizontal" action="StudentModel?action=toeditstudent" method="post">
		    <div class="row clearfix">
				<div class="col-md-12 column" >
						<span class="label label-default" for="sid" >学号</span>
				    	<input type="text" class="form-control" id="sid" value="${student.sid }" disabled="disabled" name="xuehao">
					</div>
			</div>
			<div class="row clearfix">
				<div class="col-md-12 column" >
						<span class="label label-default" for="sname" >姓名</span>
				    	<input type="text" class="form-control" id="sname" value="${student.sname }" disabled="disabled" name="sname"  autocomplete="off">
					</div>
			</div>
			<div class="row clearfix">
				<div class="col-md-12 column" >
						<span class="label label-default" for="spwd">密码</span>
				    	<input type="password" class="form-control" id="spwd" value="${student.spwd }" onfocus="foc(this)" name="spwd" onblur="spwdx(this)" autocomplete="off">
					</div>
			</div>
			<div class="row clearfix">
				<div class="col-md-12 column" >
						<span class="label label-default" for="sroom">寝室</span>
				    	<input type="text" class="form-control" id="sroom" value="${student.sroom }" onfocus="foc(this)" name="sroom" onblur="sroomx(this)" autocomplete="off">
					</div>
			</div>
			<div class="row clearfix">
				<div class="col-md-6 column" >
						<span class="label label-default" >性别</span>
				    	<div class="btn-group">
						<select class="btn btn-default" name="ssex">
							<span>
							<option value="男" ${student.ssex=='男'?'selected':''}>男</option>
							<option value="女" ${student.ssex=='女'?'selected':''}>女</option>
							</span>
						</select>
					</div>
					</div>
					<div class="col-md-6 column" >
						<span class="label label-default" >学院</span>
				    	<div class="btn-group">
						<select class="btn btn-default" name="scollege">
							<span>
							<option value="计算机学院" ${student.scollege=='计算机学院'?'selected':''}>计算机学院</option>
							<option value="会计学院" ${student.scollege=='会计学院'?'selected':''}>会计学院</option>
							</span>
						</select>
					</div>
					</div>
			</div>		
				<div class="col-md-12 column">
					 <input type="submit"  class="btn btn-danger btn-lg btn-block" name="pic" value="提交">
				</div>
				</form>
			</div>
</div>
	</body>
	<script>
		function foc(e){
			e.style.backgroundColor = "orange";
		}
		function spwdx(e){
			if(e.value!=""){
				e.style.backgroundColor = "white";
			}else{		
				alert("密码不能为空！");
			}
		}
		function sroomx(e){
			var num = /^\d+#\d{3}$/;
			if(!num.test(e.value)){
				alert("格式不正确，如1#101");
			}else{
				e.style.backgroundColor = "white";
			}
		}
	</script>
</html>
