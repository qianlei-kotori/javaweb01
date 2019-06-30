<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <title>教务管理系统-修改密码</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<div style="width: 500px;margin: auto auto;margin-top: 100px">
    <form class="form-horizontal" role="form" id="form" action="/addStudent.action" method="post">
        <input type="hidden" name="s_id" value="0" id="stu_id">
        <div class="form-group">
            <label for="stu_name" class="col-sm-2 control-label">姓名</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="stu_name" placeholder="请输入姓名" name="s_name">
            </div>
        </div>
        <div class="form-group">
            <label for="stu_age" class="col-sm-2 control-label">旧密码</label>
            <div class="col-sm-10">
                <input type="password" class="form-control pword m-b" placeholder="旧密码" name="a_password">
	       </div>
        </div>
        <div class="form-group">
            <label for="stu_age" class="col-sm-2 control-label">新密码</label>
            <div class="col-sm-10">
                <input type="password" class="form-control pword m-b" placeholder="新密码" name="a_password">
	       </div>
        </div>
        <div id="submit">
        	<button type="submit" class="btn btn-primary block full-width m-b">确定</button>
        </div>
    </form>
</div>
</body>
</html>
    