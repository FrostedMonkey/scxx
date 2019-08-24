<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>角色管理</title>
    <link rel="stylesheet" href="../static/layui-2.3.0/css/layui.css">
    <style type="text/css">
        #form-role-query .layui-form-label {
            width: auto;
            padding-left: 5px;
            padding-right: 5px;
        }
    </style>
</head>
<body>
<div style="padding: 0px 0 15px 0px;">
		<span class="layui-breadcrumb" lay-separator="-"> <a href="#">基础信息管理</a>
			<a><cite>客户信息维护</cite></a>
		</span>
</div>
<!-- 查询表单 -->
<form class="layui-form" id="form-role-query">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-inline">
                <select name="roStatus" lay-verify="required" lay-filter="select-role-query-role-status">
                    <option value="">全部</option>
                    <option value="00">未确定</option>
                    <option value="22">确定</option>
                    <option value="55">启用</option>
                    <option value="77">禁用</option>
                </select>
            </div>
            <label class="layui-form-label">编号</label>
            <div class="layui-input-inline" style="width: 100px;">
                <input type="number" name="roId" autocomplete="off"
                       class="layui-input">
            </div>
            <label class="layui-form-label">名称</label>
            <div class="layui-input-inline" style="width: 100px;">
                <input type="text" name="roName" autocomplete="off"
                       class="layui-input">
            </div>
            <label class="layui-form-label">说明</label>
            <div class="layui-input-inline" style="width: 100px;">
                <input type="text" name="roRemark" autocomplete="off"
                       class="layui-input">
            </div>
            <button class="layui-btn" id="bn-role-query"><i class="layui-icon layui-icon-search"></i> 查询</button>

        </div>
    </div>
</form>
<!-- 授权面板 -->
<!-- 	权限窗口内容 
	<div style="padding: 10px; display: none;" id="dom-win-ro-module">
		<form class="layui-form" lay-filter="form-role-module">
			<div id="dom-role-module" style="overflow:auto;height:400px;padding: 8px;margin-bottom:15px;border:1px solid #DADADA;border-radius:3px;" ></div>
			<div style="text-align:center;" >			   
			      <button type="button" id="bn-ro-module-all-yes" class="layui-btn layui-btn-primary" style="width:100px;" ><i class="layui-icon layui-icon-ok"></i> 全选</button>
			      <button type="button" id="bn-ro-module-all-no" class="layui-btn layui-btn-primary" style="width:100px;" ><i class="layui-icon layui-icon-close"></i> 全撤</button>
			      <button type="reset"  class="layui-btn layui-btn-primary" style="width:100px;" >重置</button>
			      <button class="layui-btn" style="width:120px;" lay-submit lay-filter="bn-ro-do-module">提交</button>  
			</div>
		</form>
	</div>
	授权面板结束 -->

<!-- 多操作按钮 -->
<div class="layui-btn-container">
    <button type="button" class="layui-btn" id="bn-role-add"><i class="layui-icon">&#xe608;</i> 新增</button>
    <button type="button" class="layui-btn" id="bn-role-cfm"><i class="layui-icon layui-icon-ok-circle"></i> 确定</button>
    <button type="button" class="layui-btn" id="bn-role-use"><i class="layui-icon layui-icon-auz"></i> 启用</button>
    <button type="button" class="layui-btn" id="bn-role-unuse"><i class="layui-icon layui-icon-fonts-del"></i> 禁用
    </button>
    <button class="layui-btn layui-btn-danger" id="bn-role-del-multi"><i class="layui-icon layui-icon-delete"></i> 删除
    </button>
</div>

<!-- 新增窗口内容 -->
<div style="padding: 15px; display: none;" id="dom-win-role-add">

    <form class="layui-form" lay-filter="form-role-add">

        <div class="layui-form-item">
            <label class="layui-form-label">角色名称</label>
            <div class="layui-input-block">
                <input type="text" name="roName" required lay-verify="required"
                       placeholder="请输入角色名称" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">角色信息</label>
            <div class="layui-input-block">
                <input type="text" name="roRemark" required lay-verify="required"
                       placeholder="请输入角色信息" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="bn-role-do-add">提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
<!-- 新增窗口内容结束 -->


<!-- 修改窗口内容 -->
<div style="padding: 15px; display: none;" id="dom-win-role-upd">
    <form class="layui-form" lay-filter="form-role-upd">
        <div class="layui-form-item">
            <label class="layui-form-label">角色编号</label>
            <div class="layui-input-block">
                <input type="text" id="input-role-upd-role-id" name="roId" required lay-verify="required"
                       readonly="readonly"
                       autocomplete="off" class="layui-input"
                       onclick="layer.tips('编号不可编辑。', this,{tips:[4,'#6f6f6f'],time: 1500});">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">角色名称</label>
            <div class="layui-input-block">
                <input type="text" name="roName" required lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">角色说明</label>
            <div class="layui-input-block">
                <input type="text" name="roRemark" required lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="bn-role-do-upd">提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
<!-- 修改窗口内容结束-->

<table id="stafy-role-table" lay-filter="roleTable"></table>

<script src="../static/js/jquery-3.3.1.min.js"></script>
<script src="../static/layui-2.3.0/layui.js"></script>
<script src="../static/js/sweetalert-2.1.0.min.js"></script>
<script src="../static/js/common.js"></script>
<!--自定义工具栏 -->
<script type="text/html" id="barDemo">
    {{#  if(d.roStatus == '00'){ }}
    <a class="layui-btn layui-btn-xs" lay-event="role_edit"><i class="layui-icon">&#xe608;</i> 编辑</a>
    <a class="layui-btn layui-btn-xs" lay-event="role_cfm"><i class="layui-icon layui-icon-ok-circle"></i> 确定</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="role_del"><i class="layui-icon layui-icon-delete"></i>
        删除</a>
    {{#  }else if(d.roStatus=='22'||d.roStatus=='77'){ }}
    <a class="layui-btn layui-btn-xs" lay-event="role_use"><i class="layui-icon layui-icon-auz"></i> 启用</a>
    <a class="layui-btn layui-btn-xs" lay-event="role_module"><i class="layui-icon layui-icon-set-fill"></i> 权限</a>
    {{#  }else if(d.roStatus=='55'){ }}
    <a class="layui-btn layui-btn-xs" lay-event="role_unuse"><i class="layui-icon layui-icon-fonts-del"></i> 禁用</a>
    <a class="layui-btn layui-btn-xs" lay-event="role_module"><i class="layui-icon layui-icon-set-fill"></i> 权限</a>
    {{#  }  }}
</script>

<script>
    var layerIdx2;
    layui.use(['element', 'table', 'layer', 'form'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        //显示按钮是否可用
        var showBns = function () {
            var role_status = $('#form-role-query select[name=roStatus]').val();
            if (role_status == '') {
                $('#bn-role-add,#bn-role-del-multi,#bn-role-cfm,#bn-role-use,#bn-role-unuse').prop('disabled', true).addClass("layui-btn-disabled");
            } else if (role_status == '00') {
                $('#bn-role-add,#bn-role-del-multi,#bn-role-cfm').prop('disabled', false).removeClass("layui-btn-disabled");
                $('#bn-role-use,#bn-role-unuse').prop('disabled', true).addClass("layui-btn-disabled");
            } else if (role_status == '22') {
                $('#bn-role-add,#bn-role-del-multi,#bn-role-cfm,#bn-role-unuse').prop('disabled', true).addClass("layui-btn-disabled");
                $('#bn-role-use').prop('disabled', false).removeClass("layui-btn-disabled");
            } else if (role_status == '55') {
                $('#bn-role-add,#bn-role-del-multi,#bn-role-cfm,#bn-role-use').prop('disabled', true).addClass("layui-btn-disabled");
                $('#bn-role-unuse').prop('disabled', false).removeClass("layui-btn-disabled");
            } else if (role_status == '77') {
                $('#bn-role-add,#bn-role-del-multi,#bn-role-cfm,#bn-role-unuse').prop('disabled', true).addClass("layui-btn-disabled");
                $('#bn-role-use').prop('disabled', false).removeClass("layui-btn-disabled");
            }
        }

        showBns();//显示按钮
        //第一个实例
        var roleTable = table.render({
            elem: '#stafy-role-table',
            url: 'role', //数据接口
            page: true, //开启分页
            limits: [5, 10, 15, 20, 30],
            limit: 5,
            cols: [[ //表头
                {
                    type: 'checkbox'
                }, {
                    field: 'roId',
                    title: 'ID'
                }, {
                    field: 'roName',
                    title: '角色名称'
                }, {
                    field: 'roRemark',
                    title: '角色信息'
                }, {
                    field: 'roStatus',
                    title: '操作',
                    templet: function (d) {
                        if (d.roStatus == '00') {
                            return '未确定';
                        } else if (d.roStatus == '22') {
                            return '确定';
                        } else if (d.roStatus == '55') {
                            return '启用';
                        } else if (d.roStatus == '77') {
                            return '禁用';
                        } else if (d.roStatus == '99') {
                            return '逻辑删除';
                        }
                    }
                }, {
                    title: '状态',
                    toolbar: '#barDemo'
                }]]
        });
        //监听工具条
        table.on('tool(roleTable)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象
            if (layEvent === 'role_del') { //删除
                console.log(data.roId);
                opr.ajaxWithConfirm({
                    title: "您确实要删除该条数据吗?",
                    text: "数据一旦删除将无法恢复!",
                    url: 'role/' + data.roId,
                    method: 'delete',
                    layer: layer,
                    layuiTableIns: roleTable
                });
            } else if (layEvent === 'role_edit') { //编辑
                opr.ajax({
                    url: 'role/' + data.roId,
                    method: 'get',
                    layer: layer,
                    responseOkHandler: function (role) {

                        //form-cus-upd是表单的lay-filter值
                        form.val("form-role-upd", role);

                        layerIdx = layer.open({
                            type: 1,
                            title: '修改客户信息',
                            area: ['800px', '540px'],
                            content: $('#dom-win-role-upd'),
                            zIndex: 100 //将层次降低，以使sweetalert能够在layer之上
                        });

                    }
                });

            } else if (layEvent === 'role_cfm') { //确定
                opr.ajaxWithConfirm({
                    title: "您确实要确定该客户信息吗?",
                    text: "客户信息一旦确定将无法编辑!",
                    url: 'role/status/' + data.roId + '/22',
                    method: 'put',
                    layer: layer,
                    layuiTableIns: roleTable
                });
            } else if (layEvent === 'role_use') { //启用

                opr.ajaxWithConfirm({
                    title: "您确实要启用该客户信息吗?",
                    url: 'role/status/' + data.roId + '/55',
                    method: 'put',
                    layer: layer,
                    layuiTableIns: roleTable
                });

            } else if (layEvent === 'role_unuse') { //禁用

                opr.ajaxWithConfirm({
                    title: "您确实要禁用该客户信息吗?",
                    url: 'role/status/' + data.roId + '/77',
                    method: 'put',
                    layer: layer,
                    layuiTableIns: roleTable
                });
            } else if (layEvent == 'role_module') {//权限
                $.ajax({
                    url: 'role/module_to/' + data.roId,
                    method: 'get',
                    dataType: 'html'

                }).done(function (result) {
                    layerIdx2 = layer.open({
                        type: 1,
                        title: data.roName + '角色的权限',
                        area: ['800px', '540px'],
                        content: result, //这里content是一个普通的String
                        zIndex: 100,
                    });
                    form.render(null, 'form-role-module');//手动渲染表单
                });
            }

        });//监听工具条结束
        //查询
        $('#bn-role-query').click(function () {
            /* 		var reg = /^d+(.d+)?$/;
                    if(!reg.test($(this).val())){
                        swal("编号必须为数字");
                    } */
            //将表单参数封装为json对象
            var arr = $("#form-role-query").serializeArray();
            var params = {};

            for (var i = 0; i < arr.length; i++) {
                params[arr[i].name] = arr[i].value;
            }

            //传递查询参数重载表格（内部为ajax请求）
            roleTable.reload({
                where: params,
                page: {
                    curr: 1
                    //重新从第 1 页开始
                }
            });
            showBns();//重新显示按钮
            return false;
        });//查询结束
        //监听select选择
        form.on('select(select-role-query-role-status)', function (data) {
            $('#bn-role-query').click();
        });//监听select选择结束

        //打开新增窗口
        var layerIdx;
        $('#bn-role-add').click(function () {
            form.val("form-role-add", {//form-cus-add是表单的lay-filter值
                "roName": "",
                "roRemark": ""
            });
            layerIdx = layer.open({
                type: 1,
                title: '新增客户信息',
                area: ['800px', '540px'],
                content: $('#dom-win-role-add'),
                zIndex: 100 //将层次降低，以使sweetalert能够在layer之上
            });

        });//打开新增窗口结束

        //监听新增表单提交。bn-cus-do-add是新增表单中提交按钮的lay-filter值
        form.on('submit(bn-role-do-add)', function (data) {
            console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
            opr.ajax({
                url: 'role',
                data: data.field,
                method: 'post',
                layer: layer,
                layuiTableIns: roleTable,
                responseOkHandler: function (result) {
                    layer.close(layerIdx);
                    return true;//返回true,继续默认后续行为
                }
            });
            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

        //监听修改表单提交
        form.on('submit(bn-role-do-upd)', function (data) {
            console.log(data.field);
            console.log(JSON.stringify(data.field));
            opr.ajax({
                url: 'role',
                data: JSON.stringify(data.field),
                method: 'put',
                contentType: 'application/json;charset=UTF-8',
                layer: layer,
                layuiTableIns: roleTable,
                responseOkHandler: function (result) {
                    layer.close(layerIdx);
                    return true;//返回true,继续默认后续行为
                }
            });

            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });//监听修改表单提交结束

        //删除多条数据
        $('#bn-role-del-multi').click(function () {

            var checkStatus = table.checkStatus('stafy-role-table'); //基础参数id对应的值
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
                arr.push(this.roId);
            });

            opr.ajaxWithConfirm({
                title: "您确实要删除选择的数据吗?",
                text: "数据一旦删除将无法恢复!",
                url: 'role',
                data: JSON.stringify(arr),
                contentType: 'application/json;charset=UTF-8',
                method: 'delete',
                layer: layer,
                layuiTableIns: roleTable
            });
        });//删除多条数据结束

        //函数：改变多个客户信息状态
        var changeMultiCusStatus = function (title, text, roStatus) {
            var checkStatus = table.checkStatus('stafy-role-table'); //基础参数id对应的值
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
                arr.push(this.roId);
            });

            opr.ajaxWithConfirm({
                title: title,
                text: text,
                url: 'role/status/' + roStatus,
                data: JSON.stringify(arr),
                contentType: 'application/json;charset=UTF-8',
                method: 'put',
                layer: layer,
                layuiTableIns: roleTable
            });
        }//函数：改变多个客户信息状态结束
        //确定多条数据
        $('#bn-role-cfm').click(function () {
            changeMultiCusStatus('您确实要确定选择的客户信息吗？', '客户信息一旦被确定，将不能再被编辑！', '22');
        });//确定多条数据
        //启用多条数据
        $('#bn-role-use').click(function () {
            changeMultiCusStatus('您确实要启用选择的客户信息吗？', '', '55');
        });//启用多条数据

        //禁用多条数据
        $('#bn-role-unuse').click(function () {
            changeMultiCusStatus('您确实要禁用选择的客户信息吗？', '客户信息一旦被禁用，将不能被使用！', '77');
        });//禁用多条数据


    });
</script>
</body>
</html>