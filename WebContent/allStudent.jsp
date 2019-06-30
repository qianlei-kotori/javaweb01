<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>教评后台管理系统-学生信息</title>
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
<div class="col-sm-12">
    <!-- Example Events -->
    <div class="example-wrap">
        <div class="example">
            <div class="btn-group hidden-xs" id="exampleTableEventsToolbar" role="group">
                <button type="button" class="btn btn-outline btn-default" onclick="tiao()">
                    <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
                </button>
                <script>
                    function tiao() {
                        location.href="addStudent.jsp";
                    }
                </script>
                <button type="button" class="btn btn-outline btn-default">
                    <i class="glyphicon glyphicon-heart" aria-hidden="true"></i>
                </button>
                <button type="button" class="btn btn-outline btn-default">
                    <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
                </button>
            </div>
            <table id="table">
            </table>
        </div>
    </div>
</div>

<!-- 按钮触发模态框 -->
<!--<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">开始演示模态框</button>-->
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 700px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">学生信息</h4>
            </div>
            <div class="modal-body" >
                <table id="studenttable"></table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<script type="application/javascript">
    function findStudent(s_id) {
       $("#studenttable").bootstrapTable("destroy");
        $('#studenttable').bootstrapTable({
            url: "/findStudentById.action",
            queryParams:function () {

                var temp={
                    s_id:s_id
                };

                return temp;
            },
            columns: [{
                field: 's_name',
                title: '姓名'
            },
                {
                    field: 's_age',
                    title: '年龄'
                },
                {
                    field:'s_sex',
                    title:'性别'
                },
                {
                    field: 's_major',
                    title: '所学专业'
                },
                {
                    field: 's_college',
                    title: '毕业院校'
                },
                {
                    field: 'c_name',
                    title: '班级'
                },
                {
                    field: 's_address',
                    title: '家庭住址'
                },{
                    field: 's_phone',
                    title: '紧急联系人'
                }
            ]
        });
    }
    $(function () {
        $('#table').bootstrapTable({
            url: "/findStudents.action",
            toolbar: "#toolbar",
            search: true,
            showColumns: true,                  //是否显示所有的列
            showRefresh: true,                  //是否显示刷新按钮
            sidePagination: "true",
            striped: true, // 是否显示行间隔色
            //search : "true",
            uniqueId: "sid",
            pageSize: "5",
            pagination: true, // 是否分页
            sortable: true, // 是否启用排序
            columns: [{
                field: 's_id',
                title: '序号',
            },
                {
                    field: 's_name',
                    title: '姓名'
                },
                {
                    field: 's_college',
                    title: '毕业院校'
                },
                {
                    field: 'c_name',
                    title: '班级'
                },
                {
                    field: 'price',
                    title: '操作',
                    width: 120,
                    align: 'center',
                    valign: 'middle',
                    formatter: actionFormatter,
                },

            ]
        });

        //操作栏的格式化
        function actionFormatter(value, row, index) {
            var id = value;
            var result = "";
            result += "<a href='javascript:;' class='btn btn-xs green'  onclick='findStudent(" +row.sid+ ")' data-target='#myModal' data-toggle='modal'  title='查看'  ><span class='glyph" +
                "icon glyphicon-search'></span></a>";
            result += "<a href='addStudent.html' class='btn btn-xs blue' onclick='updateStudent(" + row.sid + ")'  title='编辑'><span class='glyphicon glyphicon-pencil'></span></a>";
            result += "<a href='javascript:;' class='btn btn-xs red' onclick='delStudent(" + row.sid + ")'  title='删除'><span class='glyphicon glyphicon-remove'></span></a>";
            return result;
        }


       });

    function updateStudent(s_id) {
        window.localStorage.value = s_id;
        location.href = "addStudent.jsp";
    }

    function delStudent(s_id) {
        $.ajax({
            url: "/delStudent.action",
            data: {"sid": sid},
            success: function (obj) {
                alert(obj);
                location.href = "allStudent.jsp";
            }
        });
    }
</script>
</body>
</html>