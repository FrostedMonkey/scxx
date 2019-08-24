<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>计划管理</title>
    <link rel="stylesheet" href="../static/layui-2.3.0/css/layui.css" media="all">
</head>
<body>
<div style="padding: 0px 0 15px 0px;">
		<span class="layui-breadcrumb" lay-separator="-"> <a href="#">计划管理</a>
			<a><cite>计划维护</cite></a>
		</span>
</div>

<!-- 查询表单 -->
<form class="layui-form" id="form-plan-query">
    <div class="layui-form-item">
        <table style="width: 100%;border: 0px">
            <tr>
                <td>
                    <label class="layui-form-label">状态</label>
                    <div class="layui-input-inline" style="width: 120px;">
                        <select name="planStatus" lay-filter="select-plan-query-plan-status">
                            <option value="">全部</option>
                            <option value="0">未下达</option>
                            <option value="1">已下达</option>
                        </select>
                    </div>
                </td>
                <td>
                    <label class="layui-form-label">产品规格</label>
                    <div class="layui-input-inline" style="width: 120px;">
                        <select name="standardId" lay-filter="standard">
                            <option value="">请选择</option>
                            <c:forEach items="${standard }" var="sta">
                                <option value="${sta.standardId }">${sta.standardName }</option>
                            </c:forEach>
                        </select>
                    </div>
                </td>
                <td>
                    <label class="layui-form-label">客户信息</label>
                    <div class="layui-input-inline" style="width: 120px;">
                        <select name="cusId" id="cusId" lay-filter="customer">
                            <option value="">请选择</option>
                            <c:forEach items="${customer }" var="cu">
                                <option value="${cu.cusId }">${cu.cusName }</option>
                            </c:forEach>
                        </select>
                    </div>
                </td>
                <td>
                    <label class="layui-form-label">颜色信息</label>
                    <div class="layui-input-inline" style="width: 120px;">
                        <select name="coId" id="color" lay-filter="color">
                            <option value="">请选择</option>
                            <c:forEach items="${color }" var="co">
                                <option value="${co.coId }">${co.coName }</option>
                            </c:forEach>
                        </select>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <label class="layui-form-label">产品类型</label>
                    <div class="layui-input-inline" style="width: 120px;">
                        <select name="planType" lay-filter="Type">
                            <option value="">请选择</option>
                            <option value="1">白布产品</option>
                            <option value="2">染色产品</option>
                            <option value="3">无底色印花产品</option>
                            <option value="4">有底色印花产品</option>
                        </select>
                    </div>
                </td>
                <td>
                    <label class="layui-form-label">下达期日</label>
                    <div class="layui-input-inline" style="width: 120px;">
                        <input type="date" name="planDate" required lay-verify="required"
                               autocomplete="off" class="layui-input">
                    </div>
                </td>
                <td>
                    <label class="layui-form-label">计划登记人</label>
                    <div class="layui-input-inline" style="width: 120px;">
                        <input type="text" name="planPerson" required lay-verify="required"
                               autocomplete="off" class="layui-input">
                    </div>
                </td>
                <td>
                    <label class="layui-form-label">ID</label>
                    <div class="layui-input-inline" style="width: 120px;">
                        <input type="text" name="planId" required lay-verify="required"
                               autocomplete="off" class="layui-input">
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <label class="layui-form-label">计划月份</label>
                    <div class="layui-input-inline" style="width: 120px;">
                        <input type="text" name="planMonth" class="layui-input" id="test1">
                    </div>
                </td>
                <td>
                    <div class="layui-inline">
                        <button class="layui-btn" id="bn-plan-query"><i class="layui-icon layui-icon-search"></i> 查询
                        </button>
                    </div>
                </td>
            </tr>
        </table>

    </div>
</form>
<!-- 多操作按钮 -->
<div class="layui-btn-container">
    <button type="button" class="layui-btn" id="bn-manager-add"><i class="layui-icon">&#xe608;</i> 新增</button>
    <button type="button" class="layui-btn" id="bn-manager-cfm"><i class="layui-icon layui-icon-ok-circle"></i> 下达
    </button>
    <button class="layui-btn layui-btn-danger" id="bn-manager-del-multi"><i class="layui-icon layui-icon-delete"></i> 删除
    </button>
</div>
<table id="plan-manager-table" lay-filter="managertable"></table>
<script src="../static/js/jquery-3.3.1.min.js"></script>
<script src="../static/layui-2.3.0/layui.js"></script>
<script src="../static/js/sweetalert-2.1.0.min.js"></script>
<script src="../static/js/common.js"></script>
<!--自定义工具栏 -->
<script type="text/html" id="barDemo">
    {{#  if(d.planStatus == 0){ }}
    <a class="layui-btn layui-btn-xs" lay-event="manager_details"><i class="layui-icon">&#xe608;</i>详情</a>
    <a class="layui-btn layui-btn-xs" lay-event="manager_cfm"><i class="layui-icon layui-icon-ok-circle"></i> 下达</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="manager_del"><i
            class="layui-icon layui-icon-delete"></i> 删除</a>
    {{#  }else if(d.planStatus == 1){  }}
    <a class="layui-btn layui-btn-xs" lay-event="manager_details"><i class="layui-icon">&#xe608;</i>详情</a>
    {{#  }  }}
</script>
<script>
    var date = new Date;
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    if (month > 11)      //如果当前大于12月，则年份转到下一年
    {
        month -= 12;    //月份减
        year++;      //年份增
    }
    var new_date = new Date(year, month, 1).getTime();


    var layerIdx2;
    var managertable;
    layui.use(['table', 'layer', 'form', 'laydate'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        var laydate = layui.laydate;
        var layerIndex;

//显示按钮是否可用
        var showBns = function () {
            var _plan_status = $('#form-plan-query select[name=planStatus]').val();
            if (_plan_status == '') {
                $('#bn-manager-add,#bn-manager-del-multi,#bn-manager-cfm').prop('disabled', true).addClass("layui-btn-disabled");
            } else if (_plan_status == 0) {
                $('#bn-manager-add,#bn-manager-del-multi,#bn-manager-cfm').prop('disabled', false).removeClass("layui-btn-disabled");
            } else if (_plan_status == 1) {
                $('#bn-manager-del-multi,#bn-manager-cfm').prop('disabled', true).addClass("layui-btn-disabled");
                $('#bn-manager-add').prop('disabled', false).removeClass("layui-btn-disabled");
            }
        }

        showBns();//显示按钮
        laydate.render({
            elem: '#test1' //指定元素
            , type: 'month'
            , value: new Date(new_date)
        });
        //第一个实例
        managertable = table.render({
            elem: '#plan-manager-table'
            , url: 'manager' //数据接口
            , page: true //开启分页
            , limits: [5, 10, 15, 20, 30]
            , limit: 5
            , cols: [[ //表头
                {type: 'checkbox'}
                , {field: 'planId', title: 'ID', align: 'center'}
                , {field: 'standardName', title: '产品规格', align: 'center'}
                , {field: 'cusName', title: '客户名称', align: 'center'}
                , {field: 'coName', title: '颜色', align: 'center'}
                , {
                    field: 'planStatus', title: '状态', align: 'center', templet: function (d) {
                        if (d.planStatus == 0) {
                            return '未下达';
                        } else if (d.planStatus == 1) {
                            return '已下达';
                        }
                    }
                }
                , {title: '操作', toolbar: '#barDemo', width: 300, align: 'center'}
            ]]
        });
        table.on('tool(managertable)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象
            if (layEvent === 'manager_details') { //详情
                console.log(data);
                $.ajax({
                    url: 'manager_update/' + data.planId,
                    method: 'get',
                    dataType: 'html'
                }).done(function (html) {
                    layerIdx2 = layer.open({
                        type: 1,
                        title: '计划信息',
                        area: ['600px', '480px'],
                        content: html,
                        zIndex: 100 //将层次降低，以使sweetalert能够在layer之上
                    });
                    form.render(null, 'form-manager-update');//手动渲染表单

                });
            } else if (layEvent === 'manager_cfm') { //下达
                opr.ajaxWithConfirm({
                    title: "您确实要下达该条数据吗?",
                    text: "数据一旦下达将无法修改!",
                    url: 'manager/' + data.planId,
                    method: 'put',
                    layer: layer,
                    layuiTableIns: managertable
                });

            } else if (layEvent === 'manager_del') { //删除
                opr.ajaxWithConfirm({
                    title: "您确实要删除该条数据吗?",
                    text: "数据一旦删除将无法回复!",
                    url: 'manager/' + data.planId,
                    method: 'delete',
                    layer: layer,
                    layuiTableIns: managertable
                });
            }

        });//监听工具条结束

        //新增功能
        //弹出新增页面
        $("#bn-manager-add").click(function () {
            $.ajax({
                url: 'manager_add',
                method: 'get',
                dataType: 'html'
            }).done(function (html) {
                layerIdx2 = layer.open({
                    type: 1,
                    title: '计划信息',
                    area: ['600px', '480px'],
                    content: html,
                    zIndex: 100 //将层次降低，以使sweetalert能够在layer之上
                });
                form.render(null, 'form-manager-add');//手动渲染表单

            });
        });//弹出新增页面结束
//查询
        $('#bn-plan-query').click(function () {
            //将表单参数封装为json对象
            var arr = $("#form-plan-query").serializeArray();
            var params = {};

            for (var i = 0; i < arr.length; i++) {
                params[arr[i].name] = arr[i].value;
            }

            //传递查询参数重载表格（内部为ajax请求）
            managertable.reload({
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
        form.on('select(select-plan-query-plan-status)', function (data) {
            $('#bn-plan-query').click();

        });

        //删除多条数据
        $('#bn-manager-del-multi').click(function () {
            var checkStatus = table.checkStatus('plan-manager-table'); //基础参数id对应的值
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
                arr.push(this.planId);
            });

            opr.ajaxWithConfirm({
                title: "您确实要删除选择的数据吗?",
                text: "数据一旦删除将无法恢复!",
                url: 'manager',
                data: JSON.stringify(arr),
                contentType: 'application/json;charset=UTF-8',
                method: 'delete',
                layer: layer,
                layuiTableIns: managertable
            });
        });//删除多条数据结束

        //下达多条数据
        $('#bn-manager-cfm').click(function () {
            var checkStatus = table.checkStatus('plan-manager-table'); //基础参数id对应的值
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
                arr.push(this.planId);
            });
            console.log(arr);
            opr.ajaxWithConfirm({
                title: "您确实要下达选择的数据吗?",
                text: "数据一旦下达将无法修改!",
                url: 'manager/status/1',
                data: JSON.stringify(arr),
                contentType: 'application/json;charset=UTF-8',
                method: 'put',
                layer: layer,
                layuiTableIns: managertable
            });
        });//下达多条数据

    });
</script>
</body>
</html>