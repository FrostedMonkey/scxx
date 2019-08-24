<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户信息</title>
    <link href="../static/layui-2.3.0/css/layui.css" rel="stylesheet">
    <style type="text/css">
        #form-cus-query .layui-form-label {
            width: auto;
            padding-left: 5px;
            padding-right: 5px;
        }
    </style>
</head>
<body>
<div style="padding: 0px 0 15px 0px;">
		<span class="layui-breadcrumb" lay-separator="-"> <a href="#">安全管理</a>
			<a><cite>用户管理</cite></a>
		</span>
</div>

<!-- 查询表单 -->
<form class="layui-form" id="form-user-query">
    <div class="layui-form-item">

        <div class="layui-inline">

            <label class="layui-form-label">状态</label>
            <div class="layui-input-inline">
                <select name="uStatus" lay-verify="required" lay-filter="select-user-query-user-status">
                    <option value="">全部</option>
                    <option value="00">未确定</option>
                    <option value="22">确定</option>
                    <option value="55">启用</option>
                    <option value="77">禁用</option>
                </select>
            </div>


            <label class="layui-form-label">编号</label>
            <div class="layui-input-inline" style="width: 100px;">
                <input type="text" name="uId" autocomplete="off"
                       class="layui-input">
            </div>

            <label class="layui-form-label">名称</label>
            <div class="layui-input-inline" style="width: 100px;">
                <input type="text" name="uName" autocomplete="off"
                       class="layui-input">
            </div>

            <button class="layui-btn" id="bn-user-query"><i class="layui-icon layui-icon-search"></i> 查询</button>

        </div>
    </div>
</form>

<div class="layui-btn-container">
    <button type="button" class="layui-btn" id="bn-user-add"><i class="layui-icon">&#xe608;</i> 新增</button>
    <button type="button" class="layui-btn" id="bn-user-cfm"><i class="layui-icon layui-icon-ok-circle"></i> 确定</button>
    <button type="button" class="layui-btn" id="bn-user-use"><i class="layui-icon layui-icon-auz"></i> 启用</button>
    <button type="button" class="layui-btn" id="bn-user-unuse"><i class="layui-icon layui-icon-fonts-del"></i> 禁用
    </button>
    <button class="layui-btn layui-btn-danger" id="bn-user-del-multi"><i class="layui-icon layui-icon-delete"></i> 删除
    </button>
</div>

<!-- 状态 00-未确定 22-确定 55-启用 77-禁用 99-逻辑删除 -->
<!-- 数据表格。  lay-filter的值可以理解为layui内部使用的唯一标志-->
<table id="info-user-table" lay-filter="userTable"></table>


<!-- 工具条定义 -->
<script type="text/html" id="barDemo">
    <!--  laytpl 语法， d指数据，在这里指当前行数据 -->
    {{#  if(d.uStatus == '00' ){ }}

    <a class="layui-btn layui-btn-xs" lay-event="user_edit"><i class="layui-icon">&#xe608;</i> 编辑</a>
    <a class="layui-btn layui-btn-xs" lay-event="user_cfm"><i class="layui-icon layui-icon-ok-circle"></i> 确定</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="user_del"><i class="layui-icon layui-icon-delete"></i>
        删除</a>

    {{#  }else if(d.uStatus == '22' || d.uStatus == '77' ){  }}
    <a class="layui-btn layui-btn-xs" lay-event="user_use"><i class="layui-icon layui-icon-auz"></i> 启用</a>
    <a class="layui-btn layui-btn-xs" lay-event="user_quanx"><i class="layui-icon layui-icon-set"></i> 权限</a>
    {{#  }else if(d.uStatus == '55' ){  }}

    <a class="layui-btn layui-btn-xs" lay-event="user_unuse"><i class="layui-icon layui-icon-fonts-del"></i> 禁用</a>

    {{#  }  }}


</script>
<script src="../static/js/jquery-3.3.1.min.js"></script>
<script src="../static/layui-2.3.0/layui.js"></script>
<script src="../static/js/sweetalert-2.1.0.min.js"></script>
<script src="../static/js/common.js"></script>
<script>
    var quanxianId;
    layui.use(['element', 'table', 'layer', 'form'], function () {

        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;


        //显示按钮是否可用
        var showBns = function () {
            var _user_status = $('#form-user-query select[name=uStatus]').val();
            console.log("_user_status=" + _user_status);
            if (_user_status == '') {
                $('#bn-user-add,#bn-user-del-multi,#bn-user-cfm,#bn-user-use,#bn-user-unuse').prop('disabled', true).addClass("layui-btn-disabled");
            } else if (_user_status == '00') {
                $('#bn-user-add,#bn-user-del-multi,#bn-user-cfm').prop('disabled', false).removeClass("layui-btn-disabled");
                $('#bn-user-use,#bn-user-unuse').prop('disabled', true).addClass("layui-btn-disabled");
            } else if (_user_status == '22') {
                $('#bn-user-add,#bn-user-del-multi,#bn-user-cfm,#bn-user-unuse').prop('disabled', true).addClass("layui-btn-disabled");
                $('#bn-user-use').prop('disabled', false).removeClass("layui-btn-disabled");
            } else if (_user_status == '55') {
                $('#bn-user-add,#bn-user-del-multi,#bn-user-cfm,#bn-user-use').prop('disabled', true).addClass("layui-btn-disabled");
                $('#bn-user-unuse').prop('disabled', false).removeClass("layui-btn-disabled");
            } else if (_user_status == '77') {
                $('#bn-user-add,#bn-user-del-multi,#bn-user-cfm,#bn-user-unuse').prop('disabled', true).addClass("layui-btn-disabled");
                $('#bn-user-use').prop('disabled', false).removeClass("layui-btn-disabled");
            }
        }

        showBns();//显示按钮


        //第一个实例
        var userTable = table.render({
            elem: '#info-user-table',
            url: 'user_do', //数据接口
            page: true,//显示分页条
            limits: [5, 8, 10, 15, 20],
            limit: 5,
            size: 'sm',//小尺寸表格,
            //even:true,//隔行变色,
            height: 'full-160',//高度铺满窗口，160为差值调整，与具体布局有关，需要实验

            cols: [[ //表头
                {
                    type: 'checkbox'
                }, {
                    field: 'uId',
                    title: '用户编号',
                    align: 'center'
                }, {
                    field: 'uName',
                    title: '用户名称',
                    align: 'center'
                }, {
                    field: 'uPwd',
                    title: '用户密码',
                    align: 'center'
                }, {
                    field: 'uStatus',
                    title: '用户状态',
                    align: 'center'
                    , templet: function (d) {
                        if (d.uStatus == '00') {
                            return "未确定";
                        } else if (d.uStatus == '22') {
                            return "确定";
                        } else if (d.uStatus == '55') {
                            return "启用";
                        } else if (d.uStatus == '77') {
                            return "禁用";
                        } else if (d.uStatus == '99') {
                            return "逻辑删除";
                        }
                    }

                }, {
                    title: '操作',
                    align: 'center',
                    toolbar: '#barDemo'
                }

            ]]
        });

        //查询
        $('#bn-user-query').click(function () {
            //将表单参数封装为json对象
            var arr = $("#form-user-query").serializeArray();
            var params = {};

            for (var i = 0; i < arr.length; i++) {
                params[arr[i].name] = arr[i].value;
            }

            //传递查询参数重载表格（内部为ajax请求）
            userTable.reload({
                where: params,
                page: {
                    curr: 1
                    //重新从第 1 页开始
                }
            });

            showBns();//重新显示按钮

            return false;
        });

        //监听select选择
        form.on('select(select-user-query-user-status)', function (data) {
            $('#bn-user-query').click();
        });
        var updOpenId;
        //监听工具条。注：tool是工具条事件名，cusTable是table原始容器的属性 lay-filter属性的值
        table.on('tool(userTable)', function (obj) {
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象

            if (layEvent === 'user_del') { //删除

                opr.ajaxWithConfirm({
                    title: "您确实要删除该条数据吗?",
                    text: "数据一旦删除将无法恢复!",
                    url: 'user_do/status/' + data.uId + '/99',
                    method: 'put',
                    layer: layer,
                    layuiTableIns: userTable
                });


            } else if (layEvent === 'user_edit') { //编辑
                form.val("form-user-upd", data);
                updOpenId = layer.open({
                    type: 1,
                    title: '修改用户信息',
                    area: ['800px', '540px'],
                    content: $('#dom-win-user-upd'),
                    zIndex: 100 //将层次降低，以使sweetalert能够在layer之上
                });
            } else if (layEvent === 'user_cfm') { //确定
                opr.ajaxWithConfirm({
                    title: "您确实要确定该客户信息吗?",
                    text: "客户信息一旦确定将无法编辑!",
                    url: 'user_do/status/' + data.uId + '/22',
                    method: 'put',
                    layer: layer,
                    layuiTableIns: userTable
                });
            } else if (layEvent === 'user_use') { //启用

                opr.ajaxWithConfirm({
                    title: "您确实要启用该客户信息吗?",
                    url: 'user_do/status/' + data.uId + '/55',
                    method: 'put',
                    layer: layer,
                    layuiTableIns: userTable
                });

            } else if (layEvent === 'user_unuse') { //禁用

                opr.ajaxWithConfirm({
                    title: "您确实要禁用该客户信息吗?",
                    url: 'user_do/status/' + data.uId + '/77',
                    method: 'put',
                    layer: layer,
                    layuiTableIns: userTable
                });
            } else if (layEvent === 'user_quanx') { //权限
                $.ajax({
                    url: 'user_to/doUser/' + data.uId,
                    method: 'get',
                    dataType: 'html'
                }).done(function (html) {
                    quanxianId = layer.open({
                        type: 1,
                        title: data.uName + '用户的角色权限',
                        area: ['800px', '540px'],
                        content: html,
                        zIndex: 100 //将层次降低，以使sweetalert能够在layer之上
                    });

                    form.render(null, 'form-user-quanx');//手动渲染表单

                });
            }


        });//监听工具条结束

        var addOpenId;
        //打开新增窗口
        $('#bn-user-add').click(function () {
            form.val("form-user-add", {//form-cus-add是表单的lay-filter值
                "uId": "",
                "uName": "",
                "uPwd": ""
            });
            addOpenId = layer.open({
                type: 1,
                title: '新增用户信息',
                area: ['800px', '540px'],
                content: $('#dom-win-user-add'),
                zIndex: 100 //将层次降低，以使sweetalert能够在layer之上
            });
        });

        //监听新增表单提交。bn-cus-do-add是新增表单中提交按钮的lay-filter值
        form.on('submit(bn-user-do-add)', function (data) {
            console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
            opr.ajax({
                url: 'user_do',
                data: data.field,
                method: 'post',
                layer: layer,
                layuiTableIns: userTable,
                responseOkHandler: function (result) {
                    layer.close(addOpenId);
                    return true;//返回true,继续默认后续行为
                }
            });

            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

        //监听修改表单提交。bn-cus-do-upd是修改表单中提交按钮的lay-filter值
        form.on('submit(bn-user-do-upd)', function (data) {
            //console.log(JSON.stringify(data.field));
            //console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
            opr.ajax({
                url: 'user_do',
                data: JSON.stringify(data.field),
                method: 'put',
                contentType: 'application/json;charset=UTF-8',
                layer: layer,
                layuiTableIns: userTable,
                responseOkHandler: function (result) {
                    layer.close(updOpenId);
                    return true;//返回true,继续默认后续行为
                }
            });

            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });


        //函数：改变多个客户信息状态
        var changeMultiCusStatus = function (title, text, uStatus) {
            var checkStatus = table.checkStatus('info-user-table'); //基础参数id对应的值
            console.log(checkStatus.data) //获取选中行的数据(数组)
            //console.log(checkStatus.data.length) //获取选中行数量，可作为是否有选中行的条件
            //console.log(checkStatus.isAll ) //表格是否全选
            if (checkStatus.data.length == 0) {
                swal({
                    text: '您没有选择任何数据！',
                    icon: "error",
                    buttons: false,
                    timer: 1500
                });
                return;
            }

            var arr = [];
            $.each(checkStatus.data, function () {
                arr.push(this.uId);
            });

            opr.ajaxWithConfirm({
                title: title,
                text: text,
                url: 'user_do/status/' + uStatus,
                data: JSON.stringify(arr),
                contentType: 'application/json;charset=UTF-8',
                method: 'put',
                layer: layer,
                layuiTableIns: userTable
            });


        }//函数：改变多个客户信息状态结束

        //确定多条数据
        $('#bn-user-cfm').click(function () {

            changeMultiCusStatus('您确实要确定选择的客户信息吗？', '客户信息一旦被确定，将不能再被编辑！', '22');

        });//确定多条数据

        //启用多条数据
        $('#bn-user-use').click(function () {

            changeMultiCusStatus('您确实要启用选择的客户信息吗？', '', '55');

        });//启用多条数据

        //禁用多条数据
        $('#bn-user-unuse').click(function () {

            changeMultiCusStatus('您确实要禁用选择的客户信息吗？', '客户信息一旦被禁用，将不能被使用！', '77');

        });//禁用多条数据

        //删除多条数据
        $('#bn-user-del-multi').click(function () {

            changeMultiCusStatus('您确实要删除选择的客户信息吗？', '客户信息一旦被删除，将不能被恢复！', '99');

        });//删除多条数据

    });//layui.use结束

</script>

<!-- 新增窗口内容 -->
<div style="padding: 15px; display: none;" id="dom-win-user-add">

    <form class="layui-form" lay-filter="form-user-add">

        <div class="layui-form-item">
            <label class="layui-form-label">用户ID</label>
            <div class="layui-input-block">
                <input type="text" name="uId" required lay-verify="required"
                       placeholder="请输入用户ID" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">用户名称</label>
            <div class="layui-input-block">
                <input type="text" name="uName" required lay-verify="required"
                       placeholder="请输入用户姓名" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">用户密码</label>
            <div class="layui-input-block">
                <input type="text" name="uPwd" required lay-verify="required"
                       placeholder="请输入用户密码" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="bn-user-do-add">提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>

</div>

<!-- 修改窗口内容 -->
<div style="padding: 15px; display: none;" id="dom-win-user-upd">

    <form class="layui-form" lay-filter="form-user-upd">

        <div class="layui-form-item">
            <label class="layui-form-label">用户编号</label>
            <div class="layui-input-block">
                <input type="text" id="input-user-upd-user-id" name="uId" required lay-verify="required"
                       readonly="readonly"
                       autocomplete="off" class="layui-input"
                       onclick="layer.tips('编号不可编辑。', this,{tips:[4,'#6f6f6f'],time: 1500});">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">用户名称</label>
            <div class="layui-input-block">
                <input type="text" name="uName" required lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">用户密码</label>
            <div class="layui-input-block">
                <input type="text" name="uPwd" required lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="bn-user-do-upd">提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>

</div>
</body>
</html>