<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" 
           uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<link rel="stylesheet" href="bootstrap-3.3.7/css/bootstrap.css" />
		<link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.css">
		<script type="text/javascript" src="bootstrap-3.3.7/js/bootstrap.js" ></script>
		<script type="text/javascript" src="${js}/jquery-2.2.3.min.js" ></script>
		<script type="text/javascript" src="${js}/jquery.rapid.js" ></script>
		<title>课程表</title>
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
				<li>
					 <a href="StudentModel?action=score">成绩</a>
				</li>
				<li class="active">
					 <a href="StudentModel?action=coursetable">课程表</a>
				</li>
			</ul>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-12 column">
				<h1 class="page-header">                   
                        Course Table <small>课程表</small>
				</h1>
		<div class="panel panel-danger">
        <div class="panel-heading">课程表<i class="fa fa-thumb-tack pull-right"></i></div>
        <div class="panel-body">
			<div class="row clearfix">
				<div class="col-md-6 column">
					 <a href="#" class="btn btn-danger disabled">每周课程</a>
				</div>
				<div class="col-md-6 column">              
						<a href="StudentModel?action=editstudent" class="btn btn-default">修改个人信息</a>              
				</div>
			</div>
			<div class="row clearfix">
    <table class="table">
						<thead>
							<tr>
								<th>  </th>
                                <th>星期一</th>
                                <th>星期二</th>
                                <th>星期三</th>
                                <th>星期四</th>
                                <th>星期五</th>
                                <th>星期六</th>
                                <th>星期日</th>
							</tr>
						</thead>
						
						<tbody>
							<tr>
							<td><b>1，2节</b></td>
								<td>
									<c:forEach items="${course}" var="course">
									<c:set var="theString" value="${course.ctime}"/>
									<c:if test="${fn:contains(theString, '周一/1,2')}">
   									<p>${course.cname}/<p>
   									<p>${course.croom}/<p>
   									<p>${course.tname}<p>
									</c:if>
									</c:forEach>
								</td>
                                <td>
									<c:forEach items="${course}" var="course">
									<c:set var="theString" value="${course.ctime}"/>
									<c:if test="${fn:contains(theString, '周二/1,2')}">
   									<p>${course.cname}/<p>
   									<p>${course.croom}/<p>
   									<p>${course.tname}<p>
									</c:if>
									</c:forEach>
                                </td>
								<td>
									<c:forEach items="${course}" var="course">
									<c:set var="theString" value="${course.ctime}"/>
									<c:if test="${fn:contains(theString, '周三/1,2')}">
   									<p>${course.cname}/<p>
   									<p>${course.croom}/<p>
   									<p>${course.tname}<p>
									</c:if>
									</c:forEach>
								</td>
								<td>
									<c:forEach items="${course}" var="course">
									<c:set var="theString" value="${course.ctime}"/>
									<c:if test="${fn:contains(theString, '周四/1,2')}">
   									<p>${course.cname}/<p>
   									<p>${course.croom}/<p>
   									<p>${course.tname}<p>
									</c:if>
									</c:forEach>
								</td>
								<td>
									<c:forEach items="${course}" var="course">
									<c:set var="theString" value="${course.ctime}"/>
									<c:if test="${fn:contains(theString, '周五/1,2')}">
   									<p>${course.cname}/<p>
   									<p>${course.croom}/<p>
   									<p>${course.tname}<p>
									</c:if>
									</c:forEach>
								</td>
								<td>
									<c:forEach items="${course}" var="course">
									<c:set var="theString" value="${course.ctime}"/>
									<c:if test="${fn:contains(theString, '周六/1,2')}">
   									<p>${course.cname}/<p>
   									<p>${course.croom}/<p>
   									<p>${course.tname}<p>
									</c:if>
									</c:forEach>
								</td>
								<td>
									<c:forEach items="${course}" var="course">
									<c:set var="theString" value="${course.ctime}"/>
									<c:if test="${fn:contains(theString, '周日/1,2')}">
   									<p>${course.cname}/<p>
   									<p>${course.croom}/<p>
   									<p>${course.tname}<p>
									</c:if>
									</c:forEach>
								</td>
							</tr>
							<tr>
								<td><b>3，4节</b></td>
								<td>
									<c:forEach items="${course}" var="course">
									<c:set var="theString" value="${course.ctime}"/>
									<c:if test="${fn:contains(theString, '周一/3,4')}">
   									<p>${course.cname}/<p>
   									<p>${course.croom}/<p>
   									<p>${course.tname}<p>
									</c:if>
									</c:forEach>
								</td>
                                <td>
                                	<c:forEach items="${course}" var="course">
									<c:set var="theString" value="${course.ctime}"/>
									<c:if test="${fn:contains(theString, '周二/3,4')}">
   									<p>${course.cname}/<p>
   									<p>${course.croom}/<p>
   									<p>${course.tname}<p>
									</c:if>
									</c:forEach>
                                </td>
								<td>
									<c:forEach items="${course}" var="course">
									<c:set var="theString" value="${course.ctime}"/>
									<c:if test="${fn:contains(theString, '周三/3,4')}">
   									<p>${course.cname}/<p>
   									<p>${course.croom}/<p>
   									<p>${course.tname}<p>
									</c:if>
									</c:forEach>
								</td>
								<td>
									<c:forEach items="${course}" var="course">
									<c:set var="theString" value="${course.ctime}"/>
									<c:if test="${fn:contains(theString, '周四/3,4')}">
   									<p>${course.cname}/<p>
   									<p>${course.croom}/<p>
   									<p>${course.tname}<p>
									</c:if>
									</c:forEach>
								</td>
								<td>
									<c:forEach items="${course}" var="course">
									<c:set var="theString" value="${course.ctime}"/>
									<c:if test="${fn:contains(theString, '周五/3,4')}">
   									<p>${course.cname}/<p>
   									<p>${course.croom}/<p>
   									<p>${course.tname}<p>
									</c:if>
									</c:forEach>
								</td>
								<td>
									<c:forEach items="${course}" var="course">
									<c:set var="theString" value="${course.ctime}"/>
									<c:if test="${fn:contains(theString, '周六/3,4')}">
   									<p>${course.cname}/<p>
   									<p>${course.croom}/<p>
   									<p>${course.tname}<p>
									</c:if>
									</c:forEach>
								</td>
								<td>
									<c:forEach items="${course}" var="course">
									<c:set var="theString" value="${course.ctime}"/>
									<c:if test="${fn:contains(theString, '周日/3,4')}">
   									<p>${course.cname}/<p>
   									<p>${course.croom}/<p>
   									<p>${course.tname}<p>
									</c:if>
									</c:forEach>
								</td>
							</tr>
							<tr>
								<td><b>5，6节</b></td>
								<td>
									<c:forEach items="${course}" var="course">
									<c:set var="theString" value="${course.ctime}"/>
									<c:if test="${fn:contains(theString, '周一/5,6')}">
   									<p>${course.cname}/<p>
   									<p>${course.croom}/<p>
   									<p>${course.tname}<p>
									</c:if>
									</c:forEach>
								</td>
                                <td>
                                	<c:forEach items="${course}" var="course">
									<c:set var="theString" value="${course.ctime}"/>
									<c:if test="${fn:contains(theString, '周二/5,6')}">
   									<p>${course.cname}/<p>
   									<p>${course.croom}/<p>
   									<p>${course.tname}<p>
									</c:if>
									</c:forEach>
                                </td>
								<td>
									<c:forEach items="${course}" var="course">
									<c:set var="theString" value="${course.ctime}"/>
									<c:if test="${fn:contains(theString, '周三/5,6')}">
   									<p>${course.cname}/<p>
   									<p>${course.croom}/<p>
   									<p>${course.tname}<p>
									</c:if>
									</c:forEach>
								</td>
								<td>
									<c:forEach items="${course}" var="course">
									<c:set var="theString" value="${course.ctime}"/>
									<c:if test="${fn:contains(theString, '周四/5,6')}">
   									<p>${course.cname}/<p>
   									<p>${course.croom}/<p>
   									<p>${course.tname}<p>
									</c:if>
									</c:forEach>
								</td>
								<td>
									<c:forEach items="${course}" var="course">
									<c:set var="theString" value="${course.ctime}"/>
									<c:if test="${fn:contains(theString, '周五/5,6')}">
   									<p>${course.cname}/<p>
   									<p>${course.croom}/<p>
   									<p>${course.tname}<p>
									</c:if>
									</c:forEach>
								</td>
								<td>
									<c:forEach items="${course}" var="course">
									<c:set var="theString" value="${course.ctime}"/>
									<c:if test="${fn:contains(theString, '周六/5,6')}">
   									<p>${course.cname}/<p>
   									<p>${course.croom}/<p>
   									<p>${course.tname}<p>
									</c:if>
									</c:forEach>
								</td>
								<td>
									<c:forEach items="${course}" var="course">
									<c:set var="theString" value="${course.ctime}"/>
									<c:if test="${fn:contains(theString, '周日/5,6')}">
   									<p>${course.cname}/<p>
   									<p>${course.croom}/<p>
   									<p>${course.tname}<p>
									</c:if>
									</c:forEach>
								</td>
							</tr>
							<tr>
								<td><b>7，8节</b></td>
								<td>
									<c:forEach items="${course}" var="course">
									<c:set var="theString" value="${course.ctime}"/>
									<c:if test="${fn:contains(theString, '周一/7,8')}">
   									<p>${course.cname}/<p>
   									<p>${course.croom}/<p>
   									<p>${course.tname}<p>
									</c:if>
									</c:forEach>
								</td>
                                <td>
                                <c:forEach items="${course}" var="course">
									<c:set var="theString" value="${course.ctime}"/>
									<c:if test="${fn:contains(theString, '周二/7,8')}">
   									<p>${course.cname}/<p>
   									<p>${course.croom}/<p>
   									<p>${course.tname}<p>
									</c:if>
									</c:forEach>
                                </td>
								<td>
									<c:forEach items="${course}" var="course">
									<c:set var="theString" value="${course.ctime}"/>
									<c:if test="${fn:contains(theString, '周三/7,8')}">
   									<p>${course.cname}/<p>
   									<p>${course.croom}/<p>
   									<p>${course.tname}<p>
									</c:if>
									</c:forEach>
								</td>
								<td>
									<c:forEach items="${course}" var="course">
									<c:set var="theString" value="${course.ctime}"/>
									<c:if test="${fn:contains(theString, '周四/7,8')}">
   									<p>${course.cname}/<p>
   									<p>${course.croom}/<p>
   									<p>${course.tname}<p>
									</c:if>
									</c:forEach>
								</td>
								<td>
									<c:forEach items="${course}" var="course">
									<c:set var="theString" value="${course.ctime}"/>
									<c:if test="${fn:contains(theString, '周五/7,8')}">
   									<p>${course.cname}/<p>
   									<p>${course.croom}/<p>
   									<p>${course.tname}<p>
									</c:if>
									</c:forEach>
								</td>
								<td>
									<c:forEach items="${course}" var="course">
									<c:set var="theString" value="${course.ctime}"/>
									<c:if test="${fn:contains(theString, '周六/7,8')}">
   									<p>${course.cname}/<p>
   									<p>${course.croom}/<p>
   									<p>${course.tname}<p>
									</c:if>
									</c:forEach></td>
								<td>
									<c:forEach items="${course}" var="course">
									<c:set var="theString" value="${course.ctime}"/>
									<c:if test="${fn:contains(theString, '周日/7,8')}">
   									<p>${course.cname}/<p>
   									<p>${course.croom}/<p>
   									<p>${course.tname}<p>
									</c:if>
									</c:forEach>
								</td>
							</tr>
							<tr>
								<td><b>9，10节</b></td>
								<td>
									<c:forEach items="${course}" var="course">
									<c:set var="theString" value="${course.ctime}"/>
									<c:if test="${fn:contains(theString, '周一/9,10')}">
   									<p>${course.cname}/<p>
   									<p>${course.croom}/<p>
   									<p>${course.tname}<p>
									</c:if>
									</c:forEach>
								</td>
                                <td>
                                	<c:forEach items="${course}" var="course">
									<c:set var="theString" value="${course.ctime}"/>
									<c:if test="${fn:contains(theString, '周二/9,10')}">
   									<p>${course.cname}/<p>
   									<p>${course.croom}/<p>
   									<p>${course.tname}<p>
									</c:if>
									</c:forEach>
                                </td>
								<td>
									<c:forEach items="${course}" var="course">
									<c:set var="theString" value="${course.ctime}"/>
									<c:if test="${fn:contains(theString, '周三/9,10')}">
   									<p>${course.cname}/<p>
   									<p>${course.croom}/<p>
   									<p>${course.tname}<p>
									</c:if>
									</c:forEach>
								</td>
								<td>
									<c:forEach items="${course}" var="course">
									<c:set var="theString" value="${course.ctime}"/>
									<c:if test="${fn:contains(theString, '周四/9,10')}">
   									<p>${course.cname}/<p>
   									<p>${course.croom}/<p>
   									<p>${course.tname}<p>
									</c:if>
									</c:forEach>
								</td>
								<td>
									<c:forEach items="${course}" var="course">
									<c:set var="theString" value="${course.ctime}"/>
									<c:if test="${fn:contains(theString, '周五/9,10')}">
   									<p>${course.cname}/<p>
   									<p>${course.croom}/<p>
   									<p>${course.tname}<p>
									</c:if>
									</c:forEach>
								</td>
								<td>
									<c:forEach items="${course}" var="course">
									<c:set var="theString" value="${course.ctime}"/>
									<c:if test="${fn:contains(theString, '周六/9,10')}">
   									<p>${course.cname}/<p>
   									<p>${course.croom}/<p>
   									<p>${course.tname}<p>
									</c:if>
									</c:forEach>
								</td>
								<td>
									<c:forEach items="${course}" var="course">
									<c:set var="theString" value="${course.ctime}"/>
									<c:if test="${fn:contains(theString, '周日/9,10')}">
   									<p>${course.cname}/<p>
   									<p>${course.croom}/<p>
   									<p>${course.tname}<p>
									</c:if>
									</c:forEach>
								</td>
							</tr>     
						</tbody>
					</table>
			</div>
		</div>
	</div>
	  </div>
            </div>
</div>

	</body>
</html>