<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html >
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>客户信息维护</title>
    <link rel="stylesheet" href="../static/layui-2.3.0/css/layui.css">
    <style type="text/css">
        #form-sta-query .layui-form-label {
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
<form class="layui-form" id="form-sta-query">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-inline">
                <select name="standardStatus" lay-verify="required" lay-filter="select-sta-query-sta-status">
                    <option value="">全部</option>
                    <option value="00">未确定</option>
                    <option value="22">确定</option>
                    <option value="55">启用</option>
                    <option value="77">禁用</option>
                </select>
            </div>


            <label class="layui-form-label">编号</label>
            <div class="layui-input-inline" style="width: 100px;">
                <input type="number" name="standardId" autocomplete="off"
                       class="layui-input">
            </div>

            <label class="layui-form-label">名称</label>
            <div class="layui-input-inline" style="width: 100px;">
                <input type="text" name="standardName" autocomplete="off"
                       class="layui-input">
            </div>

            <label class="layui-form-label">说明</label>
            <div class="layui-input-inline" style="width: 100px;">
                <input type="text" name="standardRemark" autocomplete="off"
                       class="layui-input">
            </div>

            <button class="layui-btn" id="bn-sta-query"><i class="layui-icon layui-icon-search"></i> 查询</button>

        </div>
    </div>
</form>

<div class="layui-btn-container">
    <button type="button" class="layui-btn" id="bn-sta-add"><i class="layui-icon">&#xe608;</i> 新增</button>
    <button type="button" class="layui-btn" id="bn-sta-cfm"><i class="layui-icon layui-icon-ok-circle"></i> 确定</button>
    <button type="button" class="layui-btn" id="bn-sta-use"><i class="layui-icon layui-icon-auz"></i> 启用</button>
    <button type="button" class="layui-btn" id="bn-sta-unuse"><i class="layui-icon layui-icon-fonts-del"></i> 禁用
    </button>
    <button class="layui-btn layui-btn-danger" id="bn-sta-del-multi"><i class="layui-icon layui-icon-delete"></i> 删除
    </button>
</div>

<!-- 状态 00-未确定 22-确定 55-启用 77-禁用 99-逻辑删除 -->
<!-- 数据表格。  lay-filter的值可以理解为layui内部使用的唯一标志-->
<table id="info-standard-table" lay-filter="staTable"></table>


<!-- 新增窗口内容 -->
<div style="padding: 15px; display: none;" id="dom-win-sta-add">

    <form class="layui-form" lay-filter="form-sta-add">

        <div class="layui-form-item">
            <label class="layui-form-label">客户名称</label>
            <div class="layui-input-block">
                <input type="text" name="standardName" required lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">客户说明</label>
            <div class="layui-input-block">
                <input type="text" name="standardRemark" required lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="bn-sta-do-add">提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>

</div>

<!-- 修改窗口内容 -->
<div style="padding: 15px; display: none;" id="dom-win-sta-upd">

    <form class="layui-form" lay-filter="form-sta-upd">

        <div class="layui-form-item">
            <label class="layui-form-label">客户编号</label>
            <div class="layui-input-block">
                <input type="text" id="input-sta-upd-sta-id" name="standardId" required lay-verify="required"
                       readonly="readonly"
                       autocomplete="off" class="layui-input"
                       onclick="layer.tips('编号不可编辑。', this,{tips:[4,'#6f6f6f'],time: 1500});">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">客户名称</label>
            <div class="layui-input-block">
                <input type="text" name="standardName" required lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">客户说明</label>
            <div class="layui-input-block">
                <input type="text" name="standardRemark" required lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="bn-sta-do-upd">提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>

</div>


<!-- 工具条定义 -->
<script type="text/html" id="barDemo">

    <!--  laytpl 语法， d指数据，在这里指当前行数据 -->
    {{#  if(d.standardStatus == '00' ){ }}

    <a class="layui-btn layui-btn-xs" lay-event="sta_edit"><i class="layui-icon">&#xe608;</i> 编辑</a>
    <a class="layui-btn layui-btn-xs" lay-event="sta_cfm"><i class="layui-icon layui-icon-ok-circle"></i> 确定</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="sta_del"><i class="layui-icon layui-icon-delete"></i>
        删除</a>
    {{#  }else if(d.standardStatus == '22' || d.standardStatus == '77' ){  }}

    <a class="layui-btn layui-btn-xs" lay-event="sta_use"><i class="layui-icon layui-icon-auz"></i> 启用</a>

    {{#  }else if(d.standardStatus == '55' ){  }}

    <a class="layui-btn layui-btn-xs" lay-event="sta_unuse"><i class="layui-icon layui-icon-fonts-del"></i> 禁用</a>

    {{#  }  }}


</script>

<script src="../static/js/jquery-3.3.1.min.js"></script>
<script src="../static/layui-2.3.0/layui.js"></script>
<script src="../static/js/sweetalert-2.1.0.min.js"></script>
<script src="../static/js/common.js"></script>

<script>
    layui.use(['element', 'table', 'layer', 'form'], function () {

        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;


        //显示按钮是否可用
        var showBns = function () {
            var _sta_status = $('#form-sta-query select[name=standardStatus]').val();
            if (_sta_status == '') {
                $('#bn-sta-add,#bn-sta-del-multi,#bn-sta-cfm,#bn-sta-use,#bn-sta-unuse').prop('disabled', true).addClass("layui-btn-disabled");
            } else if (_sta_status == '00') {
                $('#bn-sta-add,#bn-sta-del-multi,#bn-sta-cfm').prop('disabled', false).removeClass("layui-btn-disabled");
                $('#bn-sta-use,#bn-sta-unuse').prop('disabled', true).addClass("layui-btn-disabled");
            } else if (_sta_status == '22') {
                $('#bn-sta-add,#bn-sta-del-multi,#bn-sta-cfm,#bn-sta-unuse').prop('disabled', true).addClass("layui-btn-disabled");
                $('#bn-sta-use').prop('disabled', false).removeClass("layui-btn-disabled");
            } else if (_sta_status == '55') {
                $('#bn-sta-add,#bn-sta-del-multi,#bn-sta-cfm,#bn-sta-use').prop('disabled', true).addClass("layui-btn-disabled");
                $('#bn-sta-unuse').prop('disabled', false).removeClass("layui-btn-disabled");
            } else if (_sta_status == '77') {
                $('#bn-sta-add,#bn-sta-del-multi,#bn-sta-cfm,#bn-sta-unuse').prop('disabled', true).addClass("layui-btn-disabled");
                $('#bn-sta-use').prop('disabled', false).removeClass("layui-btn-disabled");
            }
        }

        showBns();//显示按钮


        //第一个实例
        var staTable = table.render({
            elem: '#info-standard-table',
            url: 'standard', //数据接口
            page: true,//显示分页条
            limits: [5, 10, 15, 20, 30],
            limit: 5,
            cols: [[ //表头
                {
                    type: 'checkbox'
                }, {
                    field: 'standardId',
                    title: '客户编号'
                }, {
                    field: 'standardName',
                    title: '客户名称'
                }, {
                    field: 'standardRemark',
                    title: '客户说明'
                }, {
                    field: 'standardStatus',
                    title: '客户状态',
                    templet: function (d) {
                        if (d.standardStatus == '00') {
                            return '未确定';
                        } else if (d.standardStatus == '22') {
                            return '确定';
                        } else if (d.standardStatus == '55') {
                            return '启用';
                        } else if (d.standardStatus == '77') {
                            return '禁用';
                        } else if (d.standardStatus == '99') {
                            return '逻辑删除';
                        }
                    }
                }, {
                    title: '操作',
                    toolbar: '#barDemo'
                }

            ]]
        });


        //查询
        $('#bn-sta-query').click(function () {
            /* 		var reg = /^d+(.d+)?$/;
                    if(!reg.test($(this).val())){
                        swal("编号必须为数字");
                    } */
            //将表单参数封装为json对象
            var arr = $("#form-sta-query").serializeArray();
            var params = {};

            for (var i = 0; i < arr.length; i++) {
                params[arr[i].name] = arr[i].value;
            }

            //传递查询参数重载表格（内部为ajax请求）
            staTable.reload({
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
        form.on('select(select-sta-query-sta-status)', function (data) {
            $('#bn-sta-query').click();

        });//监听select选择结束

        //监听工具条
        table.on('tool(staTable)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象
            if (layEvent === 'sta_del') { //删除
                opr.ajaxWithConfirm({
                    title: "您确实要删除该条数据吗?",
                    text: "数据一旦删除将无法恢复!",
                    url: 'standard/' + data.standardId,
                    method: 'delete',
                    layer: layer,
                    layuiTableIns: staTable
                });
            } else if (layEvent === 'sta_edit') { //编辑
                opr.ajax({
                    url: 'standard/' + data.standardId,
                    method: 'get',
                    layer: layer,
                    responseOkHandler: function (standard) {

                        //form-cus-upd是表单的lay-filter值
                        form.val("form-sta-upd", standard);

                        layerIdx = layer.open({
                            type: 1,
                            title: '修改客户信息',
                            area: ['800px', '540px'],
                            content: $('#dom-win-sta-upd'),
                            zIndex: 100 //将层次降低，以使sweetalert能够在layer之上
                        });

                    }
                });

            } else if (layEvent === 'sta_cfm') { //确定
                opr.ajaxWithConfirm({
                    title: "您确实要确定该客户信息吗?",
                    text: "客户信息一旦确定将无法编辑!",
                    url: 'standard/status/' + data.standardId + '/22',
                    method: 'put',
                    layer: layer,
                    layuiTableIns: staTable
                });
            } else if (layEvent === 'sta_use') { //启用

                opr.ajaxWithConfirm({
                    title: "您确实要启用该客户信息吗?",
                    url: 'standard/status/' + data.standardId + '/55',
                    method: 'put',
                    layer: layer,
                    layuiTableIns: staTable
                });

            } else if (layEvent === 'sta_unuse') { //禁用

                opr.ajaxWithConfirm({
                    title: "您确实要禁用该客户信息吗?",
                    url: 'standard/status/' + data.standardId + '/77',
                    method: 'put',
                    layer: layer,
                    layuiTableIns: staTable
                });


            }

        });//监听工具条结束


        //打开新增窗口
        var layerIdx;
        $('#bn-sta-add').click(function () {
            form.val("form-sta-add", {//form-cus-add是表单的lay-filter值
                "standardName": "",
                "standardRemark": ""
            });
            layerIdx = layer.open({
                type: 1,
                title: '新增客户信息',
                area: ['800px', '540px'],
                content: $('#dom-win-sta-add'),
                zIndex: 100 //将层次降低，以使sweetalert能够在layer之上
            });

        });//打开新增窗口结束

        //监听新增表单提交。bn-cus-do-add是新增表单中提交按钮的lay-filter值
        form.on('submit(bn-sta-do-add)', function (data) {
            console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
            opr.ajax({
                url: 'standard',
                data: data.field,
                method: 'post',
                layer: layer,
                layuiTableIns: staTable,
                responseOkHandler: function (result) {
                    layer.close(layerIdx);
                    return true;//返回true,继续默认后续行为
                }
            });
            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });


        //监听修改表单提交
        form.on('submit(bn-sta-do-upd)', function (data) {
            opr.ajax({
                url: 'standard',
                data: JSON.stringify(data.field),
                method: 'put',
                contentType: 'application/json;charset=UTF-8',
                layer: layer,
                layuiTableIns: staTable,
                responseOkHandler: function (result) {
                    layer.close(layerIdx);
                    return true;//返回true,继续默认后续行为
                }
            });

            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });//监听修改表单提交结束


        //删除多条数据
        $('#bn-sta-del-multi').click(function () {

            var checkStatus = table.checkStatus('info-standard-table'); //基础参数id对应的值
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
                arr.push(this.standardId);
            });

            opr.ajaxWithConfirm({
                title: "您确实要删除选择的数据吗?",
                text: "数据一旦删除将无法恢复!",
                url: 'standard',
                data: JSON.stringify(arr),
                contentType: 'application/json;charset=UTF-8',
                method: 'delete',
                layer: layer,
                layuiTableIns: staTable
            });
        });//删除多条数据结束

        //函数：改变多个客户信息状态
        var changeMultiCusStatus = function (title, text, standardStatus) {
            var checkStatus = table.checkStatus('info-standard-table'); //基础参数id对应的值
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
                arr.push(this.standardId);
            });

            opr.ajaxWithConfirm({
                title: title,
                text: text,
                url: 'standard/status/' + standardStatus,
                data: JSON.stringify(arr),
                contentType: 'application/json;charset=UTF-8',
                method: 'put',
                layer: layer,
                layuiTableIns: staTable
            });
        }//函数：改变多个客户信息状态结束
        //确定多条数据
        $('#bn-sta-cfm').click(function () {
            changeMultiCusStatus('您确实要确定选择的客户信息吗？', '客户信息一旦被确定，将不能再被编辑！', '22');
        });//确定多条数据
        //启用多条数据
        $('#bn-sta-use').click(function () {
            changeMultiCusStatus('您确实要启用选择的客户信息吗？', '', '55');
        });//启用多条数据

        //禁用多条数据
        $('#bn-sta-unuse').click(function () {
            changeMultiCusStatus('您确实要禁用选择的客户信息吗？', '客户信息一旦被禁用，将不能被使用！', '77');
        });//禁用多条数据
    });


</script>