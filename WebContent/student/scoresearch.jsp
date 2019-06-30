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
		<script type="text/javascript" src="${js}/jquery-2.2.3.min.js" ></script>
		<script type="text/javascript" src="${js}/jquery.rapid.js" ></script>
		<title>分数查询</title>
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
				<li>
					 <a href="StudentModel?action=searchcourse">所有课程</a>
				</li>
				<li >
					 <a href="StudentModel?action=havechosen">已选课程</a>
				</li>
				<li class="active">
					 <a href="StudentModel?action=score">成绩</a>
				</li>
				<li>
					 <a href="StudentModel?action=coursetable">课程表</a>
				</li>
			</ul>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-12 column">
				<h1 class="page-header">                   
                        Score Table <small>成绩表</small>
				</h1>
		<div class="panel panel-danger">
        <div class="panel-heading">成绩表<i class="fa fa-thumb-tack pull-right"></i></div>
        <div class="panel-body">
			<div class="row clearfix">
				<div class="col-md-6 column">
					 <a href="#" class="btn btn-danger disabled">课程成绩</a>
				</div>
				<div class="col-md-6 column">              
						<a href="StudentModel?action=editstudent" class="btn btn-default">修改个人信息</a>              
				</div>
			</div>
			<div class="row clearfix">
    <table class="table">
						<thead>
							<tr>
                                <th>课程号</th>
                                <th>课程名</th>
                                <th>分数</th>
							</tr>
						</thead>
						<tbody>
                       <c:forEach items="${score}" var="score">
							<tr>
								<td name="sid">${score.cid}</td>
                                <td>${score.cname}</td>
								<td>${score.score==0?"未出":score.score}</td>
							</tr>
                       <c:if test="${empty  score}">
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
</html>