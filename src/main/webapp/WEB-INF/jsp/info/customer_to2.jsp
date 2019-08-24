<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>客户信息</title>
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
		<span class="layui-breadcrumb" lay-separator="-"> <a href="#">基础信息管理</a>
			<a><cite>客户信息维护</cite></a>
		</span>
</div>

<!-- 查询表单 -->
<form class="layui-form" id="form-cus-query">
    <div class="layui-form-item">

        <div class="layui-inline">

            <label class="layui-form-label">状态</label>
            <div class="layui-input-inline">
                <select name="cus_status" lay-verify="required" lay-filter="select-cus-query-cus-status">
                    <option value="">全部</option>
                    <option value="00">未确定</option>
                    <option value="22">确定</option>
                    <option value="55">启用</option>
                    <option value="77">禁用</option>
                </select>
            </div>


            <label class="layui-form-label">编号</label>
            <div class="layui-input-inline" style="width: 100px;">
                <input type="text" name="cus_id" autocomplete="off"
                       class="layui-input">
            </div>

            <label class="layui-form-label">名称</label>
            <div class="layui-input-inline" style="width: 100px;">
                <input type="text" name="cus_name" autocomplete="off"
                       class="layui-input">
            </div>

            <label class="layui-form-label">说明</label>
            <div class="layui-input-inline" style="width: 100px;">
                <input type="text" name="cus_remark" autocomplete="off"
                       class="layui-input">
            </div>

            <button class="layui-btn" id="bn-cus-query"><i class="layui-icon layui-icon-search"></i> 查询</button>

        </div>
    </div>
</form>

<div class="layui-btn-container">
    <button type="button" class="layui-btn" id="bn-cus-add"><i class="layui-icon">&#xe608;</i> 新增</button>
    <button type="button" class="layui-btn" id="bn-cus-cfm"><i class="layui-icon layui-icon-ok-circle"></i> 确定</button>
    <button type="button" class="layui-btn" id="bn-cus-use"><i class="layui-icon layui-icon-auz"></i> 启用</button>
    <button type="button" class="layui-btn" id="bn-cus-unuse"><i class="layui-icon layui-icon-fonts-del"></i> 禁用
    </button>
    <button class="layui-btn layui-btn-danger" id="bn-cus-del-multi"><i class="layui-icon layui-icon-delete"></i> 删除
    </button>
</div>

<!-- 状态 00-未确定 22-确定 55-启用 77-禁用 99-逻辑删除 -->
<!-- 数据表格。  lay-filter的值可以理解为layui内部使用的唯一标志-->
<table id="info-customer-table" lay-filter="cusTable"></table>


<!-- 工具条定义 -->
<script type="text/html" id="barDemo">
    <!--  laytpl 语法， d指数据，在这里指当前行数据 -->
    {{#  if(d.cusStatus == '00' ){ }}

    <a class="layui-btn layui-btn-xs" lay-event="cus_edit"><i class="layui-icon">&#xe608;</i> 编辑</a>
    <a class="layui-btn layui-btn-xs" lay-event="cus_cfm"><i class="layui-icon layui-icon-ok-circle"></i> 确定</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="cus_del"><i class="layui-icon layui-icon-delete"></i>
        删除</a>

    {{#  }else if(d.cusStatus == '22' || d.cusStatus == '77' ){  }}

    <a class="layui-btn layui-btn-xs" lay-event="cus_use"><i class="layui-icon layui-icon-auz"></i> 启用</a>

    {{#  }else if(d.cusStatus == '55' ){  }}

    <a class="layui-btn layui-btn-xs" lay-event="cus_unuse"><i class="layui-icon layui-icon-fonts-del"></i> 禁用</a>

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
            var _cus_status = $('#form-cus-query select[name=cus_status]').val();
            console.log("_cus_status=" + _cus_status);
            if (_cus_status == '') {
                $('#bn-cus-add,#bn-cus-del-multi,#bn-cus-cfm,#bn-cus-use,#bn-cus-unuse').prop('disabled', true).addClass("layui-btn-disabled");
            } else if (_cus_status == '00') {
                $('#bn-cus-add,#bn-cus-del-multi,#bn-cus-cfm').prop('disabled', false).removeClass("layui-btn-disabled");
                $('#bn-cus-use,#bn-cus-unuse').prop('disabled', true).addClass("layui-btn-disabled");
            } else if (_cus_status == '22') {
                $('#bn-cus-add,#bn-cus-del-multi,#bn-cus-cfm,#bn-cus-unuse').prop('disabled', true).addClass("layui-btn-disabled");
                $('#bn-cus-use').prop('disabled', false).removeClass("layui-btn-disabled");
            } else if (_cus_status == '55') {
                $('#bn-cus-add,#bn-cus-del-multi,#bn-cus-cfm,#bn-cus-use').prop('disabled', true).addClass("layui-btn-disabled");
                $('#bn-cus-unuse').prop('disabled', false).removeClass("layui-btn-disabled");
            } else if (_cus_status == '77') {
                $('#bn-cus-add,#bn-cus-del-multi,#bn-cus-cfm,#bn-cus-unuse').prop('disabled', true).addClass("layui-btn-disabled");
                $('#bn-cus-use').prop('disabled', false).removeClass("layui-btn-disabled");
            }
        }

        showBns();//显示按钮


        //第一个实例
        var cusTable = table.render({
            elem: '#info-customer-table',
            url: 'customer_do', //数据接口
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
                    field: 'cusId',
                    title: '客户编号',
                    align: 'center'
                }, {
                    field: 'cusName',
                    title: '客户名称',
                    align: 'center'
                }, {
                    field: 'cusRemark',
                    title: '客户说明',
                    align: 'center'
                }, {
                    field: 'cusStatus',
                    title: '客户状态',
                    align: 'center'
                    , templet: function (d) {
                        if (d.cusStatus == '00') {
                            return "未确定";
                        } else if (d.cusStatus == '22') {
                            return "确定";
                        } else if (d.cusStatus == '55') {
                            return "启用";
                        } else if (d.cusStatus == '77') {
                            return "禁用";
                        } else if (d.cusStatus == '99') {
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
        $('#bn-cus-query').click(function () {
            //将表单参数封装为json对象
            var arr = $("#form-cus-query").serializeArray();
            var params = {};

            for (var i = 0; i < arr.length; i++) {
                params[arr[i].name] = arr[i].value;
            }

            //传递查询参数重载表格（内部为ajax请求）
            cusTable.reload({
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
        form.on('select(select-cus-query-cus-status)', function (data) {
            $('#bn-cus-query').click();
        });
        var updOpenId;
        //监听工具条。注：tool是工具条事件名，cusTable是table原始容器的属性 lay-filter属性的值
        table.on('tool(cusTable)', function (obj) {
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象

            if (layEvent === 'cus_del') { //删除

                opr.ajaxWithConfirm({
                    title: "您确实要删除该条数据吗?",
                    text: "数据一旦删除将无法恢复!",
                    url: 'customer_do/' + data.cusId,
                    method: 'delete',
                    layer: layer,
                    layuiTableIns: cusTable
                });


            } else if (layEvent === 'cus_edit') { //编辑
                form.val("form-cus-upd", data);
                updOpenId = layer.open({
                    type: 1,
                    title: '修改客户信息',
                    area: ['800px', '540px'],
                    content: $('#dom-win-cus-upd'),
                    zIndex: 100 //将层次降低，以使sweetalert能够在layer之上
                });
            } else if (layEvent === 'cus_cfm') { //确定
                opr.ajaxWithConfirm({
                    title: "您确实要确定该客户信息吗?",
                    text: "客户信息一旦确定将无法编辑!",
                    url: 'customer_do/status/' + data.cusId + '/22',
                    method: 'put',
                    layer: layer,
                    layuiTableIns: cusTable
                });
            } else if (layEvent === 'cus_use') { //启用

                opr.ajaxWithConfirm({
                    title: "您确实要启用该客户信息吗?",
                    url: 'customer_do/status/' + data.cusId + '/55',
                    method: 'put',
                    layer: layer,
                    layuiTableIns: cusTable
                });

            } else if (layEvent === 'cus_unuse') { //禁用

                opr.ajaxWithConfirm({
                    title: "您确实要禁用该客户信息吗?",
                    url: 'customer_do/status/' + data.cusId + '/77',
                    method: 'put',
                    layer: layer,
                    layuiTableIns: cusTable
                });
            }

        });//监听工具条结束

        var addOpenId;
        //打开新增窗口
        $('#bn-cus-add').click(function () {
            form.val("form-cus-add", {//form-cus-add是表单的lay-filter值
                "cusName": "",
                "cusRemark": ""
            });
            addOpenId = layer.open({
                type: 1,
                title: '新增客户信息',
                area: ['800px', '540px'],
                content: $('#dom-win-cus-add'),
                zIndex: 100 //将层次降低，以使sweetalert能够在layer之上
            });
        });

        //监听新增表单提交。bn-cus-do-add是新增表单中提交按钮的lay-filter值
        form.on('submit(bn-cus-do-add)', function (data) {
            console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
            opr.ajax({
                url: 'customer_do',
                data: data.field,
                method: 'post',
                layer: layer,
                layuiTableIns: cusTable,
                responseOkHandler: function (result) {
                    layer.close(addOpenId);
                    return true;//返回true,继续默认后续行为
                }
            });

            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

        //监听修改表单提交。bn-cus-do-upd是修改表单中提交按钮的lay-filter值
        form.on('submit(bn-cus-do-upd)', function (data) {
            console.log(JSON.stringify(data.field));
            console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
            opr.ajax({
                url: 'customer_do',
                data: JSON.stringify(data.field),
                method: 'put',
                contentType: 'application/json;charset=UTF-8',
                layer: layer,
                layuiTableIns: cusTable,
                responseOkHandler: function (result) {
                    layer.close(updOpenId);
                    return true;//返回true,继续默认后续行为
                }
            });

            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

        //删除多条数据
        $('#bn-cus-del-multi').click(function () {

            var checkStatus = table.checkStatus('info-customer-table'); //基础参数id对应的值
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

            var ids = [];
            $.each(checkStatus.data, function () {
                ids.push(this.cusId);
            });

            opr.ajaxWithConfirm({
                title: "您确实要删除选择的数据吗?",
                text: "数据一旦删除将无法恢复!",
                url: 'customer_do',
                data: JSON.stringify(ids),
                contentType: 'application/json;charset=UTF-8',
                method: 'delete',
                layer: layer,
                layuiTableIns: cusTable
            });


        });//删除多条数据结束

        //函数：改变多个客户信息状态
        var changeMultiCusStatus = function (title, text, cus_status) {
            var checkStatus = table.checkStatus('info-customer-table'); //基础参数id对应的值
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
                arr.push(this.cusId);
            });

            opr.ajaxWithConfirm({
                title: title,
                text: text,
                url: 'customer_do/status/' + cus_status,
                data: JSON.stringify(arr),
                contentType: 'application/json;charset=UTF-8',
                method: 'put',
                layer: layer,
                layuiTableIns: cusTable
            });


        }//函数：改变多个客户信息状态结束

        //确定多条数据
        $('#bn-cus-cfm').click(function () {

            changeMultiCusStatus('您确实要确定选择的客户信息吗？', '客户信息一旦被确定，将不能再被编辑！', '22');

        });//确定多条数据

        //启用多条数据
        $('#bn-cus-use').click(function () {

            changeMultiCusStatus('您确实要启用选择的客户信息吗？', '', '55');

        });//启用多条数据

        //禁用多条数据
        $('#bn-cus-unuse').click(function () {

            changeMultiCusStatus('您确实要禁用选择的客户信息吗？', '客户信息一旦被禁用，将不能被使用！', '77');

        });//禁用多条数据

    });//layui.use结束

</script>


<!-- 新增窗口内容 -->
<div style="padding: 15px; display: none;" id="dom-win-cus-add">

    <form class="layui-form" lay-filter="form-cus-add">

        <div class="layui-form-item">
            <label class="layui-form-label">客户名称</label>
            <div class="layui-input-block">
                <input type="text" name="cusName" required lay-verify="required"
                       placeholder="请输入客户姓名" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">客户说明</label>
            <div class="layui-input-block">
                <input type="text" name="cusRemark" required lay-verify="required"
                       placeholder="请输入客户说明" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="bn-cus-do-add">提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>

</div>

<!-- 修改窗口内容 -->
<div style="padding: 15px; display: none;" id="dom-win-cus-upd">

    <form class="layui-form" lay-filter="form-cus-upd">

        <div class="layui-form-item">
            <label class="layui-form-label">客户编号</label>
            <div class="layui-input-block">
                <input type="text" id="input-cus-upd-cus-id" name="cusId" required lay-verify="required"
                       readonly="readonly"
                       autocomplete="off" class="layui-input"
                       onclick="layer.tips('编号不可编辑。', this,{tips:[4,'#6f6f6f'],time: 1500});">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">客户名称</label>
            <div class="layui-input-block">
                <input type="text" name="cusName" required lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">客户说明</label>
            <div class="layui-input-block">
                <input type="text" name="cusRemark" required lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="bn-cus-do-upd">提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>

</div>
</body>
</html>