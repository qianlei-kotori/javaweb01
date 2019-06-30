<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>教务管理系统-已选课程</title>
    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">
    <!-- 全局js -->
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script>
    <!-- 自定义js -->
    <script src="js/content.js?v=1.0.0"></script>
    <!-- Bootstrap table -->
    <script src="js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
    <script src="js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>

    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
    <!--统计代码，可删除-->
</head>
<body>

<div style="width: 900px;margin: auto;margin-top: 50px">
    <table id="table">
    </table>
</div>
    <script type="application/javascript">
        $('#table').bootstrapTable({
            url: "/findEvals.action",
            queryParams: "queryParams",
            toolbar: "#toolbar",
            sidePagination: "true",
            striped: true, // 是否显示行间隔色
            //search : "true",
            uniqueId: "cid",
            pageSize: "10",
            pagination: false, // 是否分页
            sortable: true, // 是否启用排序
            columns: [{
                title: '序号',
                width:40,
                formatter:function (value,row,index) {
                    return index+1;
                }
            },
                {
                    field:'cname',
                    title: '课程名',
                },
                {
                    field: 'croom',
                    title: '教室',

                },
                {
                    field: 'ccount',
                    title: '总人数',

                },
                {
                    field: 'cnum',
                    title: '选课人数',

                },
                {
                    field: 'tname',
                    title: '教师',
                }
            ]
        });
    </script>
</body>
