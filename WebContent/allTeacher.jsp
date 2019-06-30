<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教评后台管理系统-教师信息</title>
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
                <button type="button" class="btn btn-outline btn-default" data-target='#myModal' data-toggle='modal' onclick="findItem_Code()">
                    <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
                </button>
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
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">教师信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" action="/saveTeacherAndClassName.do" method="post" id="form">
                    <input type="hidden" id="hidden" name="tea_id" value="0">
                    <div class="form-group">
                        <label for="firstname" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="tea_name" class="form-control" id="firstname" placeholder="请输入姓名">
                        </div>
                    </div>
                    <div class="form-group">
                        <!--<label for="lastname1" class="col-sm-2 control-label">专业</label>
                        <div class="col-sm-10">
                            <input type="text" name="item_name" class="form-control" id="lastname1" placeholder="请输入专业">
                        </div>-->
                        <label for="firstname1" class="col-sm-2 control-label">专业</label>
                        <div class="col-sm-4">
                            <select class="form-control" id="firstname1" style="width: 200px" name="item_code">
                            </select>
                        </div>
                    </div>
                    <div class="form-group"> <input type="hidden" id="hidden1" name="cla_id" value="0">
                        <label for="lastname2" class="col-sm-2 control-label">班级</label>
                        <div class="col-sm-10">
                            <input type="text" name="cla_name" class="form-control" id="lastname2" placeholder="请输入班级">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-success" onclick="document.getElementById('form').submit();">确定</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<script type="application/javascript">
    $('#table').bootstrapTable({
        url: "/findTeachers.action",
        type:"post",
        queryParams: "queryParams",
        toolbar: "#toolbar",
        search: true,
        showColumns: true,                  //是否显示所有的列
        showRefresh: true,                  //是否显示刷新按钮
        sidePagination: "true",
        striped: true, // 是否显示行间隔色
        //search : "true",
        uniqueId: "t_id",
        pageSize: "5",
        pagination: true, // 是否分页
        sortable: true, // 是否启用排序
        columns: [{
            title:'序号',
            formatter:function(value,row,index){
                return index+1;
            }
        },{
            field: 't_name',
            title: '姓名'
        },
            {
                field: 't_major',
                title: '专业'
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
        var result = "";
        result += "<a href='#' class='btn btn-xs blue' onclick='updateTeacher("+row.t_id+")' data-target='#myModal' data-toggle='modal'  title='编辑'><span class='glyphicon glyphicon-pencil'></span></a>";
        result += "<a href='javascript:;' class='btn btn-xs red' onclick='delTeacher("+row.t_id+")'  title='删除'><span class='glyphicon glyphicon-remove'></span></a>"
        result +="<a href='javascript:;' class='btn btn-xs red' onclick='saveNum("+row.c_id+")'  title='教评'><span class='fa fa-check-square-o'></span></a>";
        return result;
    }
</script>
<script type="application/javascript">
    function saveNum(id) {
        $.ajax({
            url:"/findCode.do",
            data:{"classname_id":id},
            success:function (obj) {
                alert(obj);
            }
        });
    }

    function updateTeacher(id) {
        $.ajax({
            url:"/findTeacher_update.do",
            data:{"tea_id":id},
            success:function (obj) {
                // alert(obj.teacher.tea_name);
                $("#hidden").val(obj.teacher.tea_id);
                $("#hidden1").val(obj.cla_id);
                $("#firstname").val(obj.teacher.tea_name);
                $("#lastname2").val(obj.cla_name);
                $("#firstname1").html("<option value='"+obj.teacher.item_code+"'>"+obj.item_name+"</option>")
                findItem_Code1(obj);
            }
        });
    }

    function findItem_Code1(ob) {
        $.ajax({
            url:"/findItem_Code.do",
            success:function (obj) {
                var s="<option value='0'>请选择专业</option>";
                for (var i=0;i<obj.length;i++){
                    if(obj[i].item_name==ob.item_name){
                        s+="<option selected value='"+obj[i].item_code+"'>"+obj[i].item_name+"</option>";
                    }else{
                        s+="<option value='"+obj[i].item_code+"'>"+obj[i].item_name+"</option>";
                    }
                }
                $("#firstname1").html(s);
            }
        });
    }

    function findItem_Code() {
        $.ajax({
            url:"/findItem_Code.do",
            success:function (obj) {
                var s="<option value='0'>请选择专业</option>";
                for (var i=0;i<obj.length;i++){
                    s+="<option value='"+obj[i].item_code+"'>"+obj[i].item_name+"</option>";
                }
                $("#firstname1").html(s);
            }
        });
    }

    function delTeacher(id) {
        $.ajax({
            url:"/delTeacher.do",
            data:{"id":id},
            success:function (obj) {
                alert(obj);
                //location.reload(true);
                location.href="teacher.jsp";
            }
        });
    }
</script>
</body>
</html>