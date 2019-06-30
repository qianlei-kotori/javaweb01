<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <title>教务管理系统-新增学生</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<div style="width: 700px;margin: auto auto;margin-top: 100px">
    <form class="form-horizontal" role="form" id="form" action="/addStudent.action" method="post">
        <h3>新增学生</h3>
        <input type="hidden" name="s_id" value="0" id="stu_id">
        <div class="form-group">
            <label for="stu_name" class="col-sm-2 control-label">姓名</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="stu_name" placeholder="请输入姓名" name="s_name">
            </div>
        </div>
        <div class="form-group">
            <label for="stu_age" class="col-sm-2 control-label">年龄</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="stu_age"
                       placeholder="请输入年龄" name="s_age">
            </div>
        </div>
        <div class="form-group">
            <label for="stu_sex1" class="col-sm-2 control-label">性别</label>
            <div class="radio">
                <label>
                    <input type="radio" name="s_sex" id="stu_sex1" value="男" checked>男
                </label>
                <label>
                    <input type="radio" name="s_sex" id="stu_sex2" value="女">女
                </label>
            </div>
        </div>

        <div class="form-group">
            <label for="stu_school" class="col-sm-2 control-label">毕业院校</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="stu_school" placeholder="请输入学校" name="s_college">
            </div>
        </div>
        <div class="form-group">
            <label for="stu_pro" class="col-sm-2 control-label">所学专业</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="stu_pro" placeholder="请输入专业" name="s_major">
            </div>
        </div>
        <div class="form-group">
            <label for="stu_address" class="col-sm-2 control-label">家庭住址</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="stu_address" placeholder="请输入家庭住址" name="s_address">
            </div>
        </div>
        <div class="form-group">
            <label for="stu_pertel" class="col-sm-2 control-label">紧急联系人</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="stu_pertel" placeholder="请输入紧急联系人" name="s_phone">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default" onclick="document.getElementById('form').submit()">确定</button>
            </div>
        </div>
    </form>
</div>
<!--
    id
   姓名
   年龄
   专业
   班级
   学校
   家庭住址
   紧急联系人
-->
<script type="application/javascript">

    //查询所有的班级
    $(function () {
        var state=window.localStorage.value;
        var s_id;
        if(state!=0){
            $.ajax({
                url:"/addStudent.action",
                data:{"s_id":state},
                success:function (obj) {
                    //alert(obj)
                    // alert(obj[0].stu_name);
                    $("#s_name").val(obj[0].s_name);
                    $("#s_id").val(obj[0].s_id);
                    $("#s_address").val(obj[0].s_address);
                    if(obj[0].s_sex=='男'){
                        $("#stu_sex1").attr("checked","checked");
                    }else{
                        $("#stu_sex2").attr("checked","checked");
                    }
                    $("#s_age").val(obj[0].s_age);
                    $("#s_major").val(obj[0].s_major);
                    $("#s_phone").val(obj[0].s_phone);
                    $("#s_college").val(obj[0].s_college);
                }
            });
        }
    });
</script>
</body>
</html>
    