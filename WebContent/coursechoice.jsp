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
		<title>学生选课</title>
	</head>
	<style>
		.li{
			margin-bottom: 20px;
		}
	</style>
	<body>
	<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<ul class="nav nav-tabs">
				<li class="active">
					 <a href="StudentModel">所有课程</a>
				</li>
				<li >
					 <a href="havechosen">已选课程</a>
				</li>
				<li>
					 <a href="scoresearch">成绩</a>
				</li>
				<li>
					 <a href="coursetable">课程表</a>
				</li>
			</ul>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-12 column">
				<h1 class="page-header">                   
                        CourseChoice Table <small>选课表</small>
				</h1>
		<div class="panel panel-danger">
        <div class="panel-heading">选课表<i class="fa fa-thumb-tack pull-right"></i></div>
        <div class="panel-body">
			<div class="row clearfix">
				<div class="col-md-6 column">
					 <a href="#" class="btn btn-danger disabled">课程信息</a>
				</div>
				<div class="col-md-6 column">
						<p style="color:red;font-size:30px;">${err}</p>               
				</div>
			</div>
			<div class="row clearfix">
    <table class="table">
						<thead>
							<tr>
                                <th>课程号</th>
                                <th>课程名</th>
                                <th>教室</th>
								<th>课时</th>
								<th>选课人数</th>
								<th>任课教师</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
                       <c:forEach items="${course}" var="course">
							<tr>
								<td name="sid">${course.cid}</td>
                                <td>${course.cname}</td>
								<td>${course.croom}</td>
								<td>${course.ccount}</td>
								<td>${course.cum}</td>
								<td>${course.tname}</td>
								<td>
									<a onclick="add('${course.cid}')" class="btn btn-danger"><i class="	fa fa-plus-square"></i>&nbsp;选课</a>
								</td>
							</tr>
                       <c:if test="${empty  course}">
                        <tr>
                            <td colspan="5" class="text-center">暂时没有数据哦~</td>
                        </tr>
                        </c:if>
                       </c:forEach>
						</tbody>
					</table>
			<nav aria-label="Page navigations" class="text-right">
                        <ul class="pagination">
                            <li>
                                <a href="#" aria-label="Previous">
                                    <span aria-hidden="true">《</span>
                                </a>
                            </li>
                            <li href="#"><a>1</a></li>
                            <li href="#"><a>2</a></li>
                            <li href="#"><a>3</a></li>
                            <li href="#"><a>4</a></li>
                            <li href="#"><a>5</a></li>
                            <li>
                                <a href="#" aria-label="Next">
                                    <span aria-hidden="true">》</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
			</div>
		</div>
	</div>
	  </div>
            </div>
</div>

	</body>
	<script type="text/javascript">
	function add(cid){
		var flag = window.confirm("确定选这门课吗？");
		if(flag){
			window.location.href="addcourse?cid="+cid;
		}
	}
	</script>
</html>