<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>坯布准备</title>
    <link rel="stylesheet" href="../static/layui-2.3.0/css/layui.css"
          media="all">
</head>
<body>

<!-- 分组页面 -->
<div style="padding: 15px;display: none" id="win-rawcloth-group-add">
    <form class="layui-form" lay-filter="form-rawcloth-group-add" id="form-rawcloth-group-add">
        <div class="layui-form-item">
            <label class="layui-form-label">ID</label>
            <div class="layui-input-block">
                <input type="text" name="planId" required lay-verify="required"
                       autocomplete="off" class="layui-input" readonly="readonly">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">客户信息</label>
            <div class="layui-input-block">
                <input type="text" name="processCus" required lay-verify="required"
                       autocomplete="off" class="layui-input" readonly="readonly">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">颜色信息</label>
            <div class="layui-input-block">
                <input type="text" name="processColor" required lay-verify="required"
                       autocomplete="off" class="layui-input" readonly="readonly">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">规格信息</label>
            <div class="layui-input-block">
                <input type="text" name="processStd" required lay-verify="required"
                       autocomplete="off" class="layui-input" readonly="readonly">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">计划产量</label>
            <div class="layui-input-block">
                <input type="text" name="planNum" required lay-verify="required"
                       autocomplete="off" class="layui-input" readonly="readonly">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">布匹数量</label>
            <div class="layui-input-block">
                <input type="text" id="groupNums" name="groupNum" required
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">剩余量</label>
            <div class="layui-input-block">
                <input type="text" id="planResidues" name="planResidue" required lay-verify="required"
                       autocomplete="off" class="layui-input" readonly="readonly">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="bn-rawcloth-group-add" name="bn-rawcloth-group-add">
                    提交
                </button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>

</div>

<!-- 编辑界面 -->
<div style="padding: 15px; display: none" id="win-rawcloth-group-update">
    <form class="layui-form" lay-filter="form-rawcloth-group-update" id="form-rawcloth-group-update">
        <div class="layui-form-item">
            <label class="layui-form-label">ID</label>
            <div class="layui-input-block">
                <input type="text" name="processId" required lay-verify="required"
                       autocomplete="off" class="layui-input" readonly="readonly">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">客户信息</label>
            <div class="layui-input-block">
                <input type="text" name="processCus" required lay-verify="required"
                       autocomplete="off" class="layui-input" readonly="readonly">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">颜色信息</label>
            <div class="layui-input-block">
                <input type="text" name="processColor" required lay-verify="required"
                       autocomplete="off" class="layui-input" readonly="readonly">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">规格信息</label>
            <div class="layui-input-block">
                <input type="text" name="processStd" required lay-verify="required"
                       autocomplete="off" class="layui-input" readonly="readonly">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">计划产量</label>
            <div class="layui-input-block">
                <input type="text" name="planNum" required lay-verify="required"
                       autocomplete="off" class="layui-input" readonly="readonly">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">剩余量</label>
            <div class="layui-input-block">
                <input type="text" id="planResidue" name="planResidue" required lay-verify="required"
                       autocomplete="off" class="layui-input" readonly="readonly">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">布匹数量</label>
            <div class="layui-input-block">
                <input type="text" id="groupNum" name="groupNum" required lay-verify="groupNum"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="button" class="layui-btn" id="bn-rawcloth-group-update">提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div><!-- 编辑界面结束 -->


<!-- 多操作按钮 -->
<div class="layui-btn-container">
    <button type="button" class="layui-btn" id="bn-rawcloth-add">
        <i class="layui-icon">&#xe608;</i> 新增
    </button>
</div>
<table id="process-rawcloth-table" lay-filter="rawclothtable"></table>
<script src="../static/js/jquery-3.3.1.min.js"></script>
<script src="../static/layui-2.3.0/layui.js"></script>
<script src="../static/js/sweetalert-2.1.0.min.js"></script>
<script src="../static/js/common.js"></script>
<script type="text/html" id="barDemo">
    {{#  if(d.processStatus == '00' ){ }}

    <a class="layui-btn layui-btn-xs" lay-event="rawcloth_edit"><i class="layui-icon">&#xe608;</i> 编辑</a>
    <a class="layui-btn layui-btn-xs" lay-event="rawcloth_cfm"><i class="layui-icon layui-icon-ok-circle"></i>投坯</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="rawcloth_del"><i
            class="layui-icon layui-icon-delete"></i> 删除</a>
    {{#  }else if(d.processStatus == '05'){  }}

    {{#  }  }}
</script>
<script>
    var message;
    var num;
    var num2;
    var rawclothtable;
    var add_div;
    layui.use(['table', 'layer', 'form'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;

        rawclothtable = table.render({
            elem: '#process-rawcloth-table',
            url: 'rawcloth' //数据接口
            ,
            page: true //开启分页
            ,
            limits: [5, 10, 15, 20, 30],
            limit: 5,
            cols: [[ //表头
                {
                    field: 'processId',
                    title: '分组ID',
                    align: 'center'
                }, {
                    field: 'planId',
                    title: '计划ID',
                    align: 'center'
                }, {
                    field: 'processCus',
                    title: '客户信息',
                    align: 'center'
                }, {
                    field: 'processStd',
                    title: '规则信息',
                    align: 'center'
                }, {
                    field: 'processColor',
                    title: '颜色信息',
                    align: 'center'
                }, {
                    field: 'groupNum',
                    title: '分组产量',
                    align: 'center'
                }, {
                    field: 'groupDate',
                    title: '分组日期',
                    align: 'center'
                }, {
                    field: 'groupPerson',
                    title: '分组登记人',
                    align: 'center'
                }, {
                    field: 'processStatus',
                    title: '状态',
                    align: 'center',
                    templet: function (d) {

                        if (d.processStatus == '00') {
                            return '未投坯';
                        } else if (d.processStatus == '05') {
                            return '已投坯';
                        } else if (d.processStatus == '10') {
                            return '已前处理';
                        } else if (d.processStatus == '15') {
                            return '已染色';
                        } else if (d.processStatus == '20') {
                            return '已印花';
                        } else if (d.processStatus == '25') {
                            return '已整理';
                        } else if (d.processStatus == '30') {
                            return '质检中';
                        } else if (d.processStatus == '35') {
                            return '已质检';
                        } else if (d.processStatus == '40') {
                            return '包装中';
                        } else if (d.processStatus == '50') {
                            return '已包装';
                        } else if (d.processStatus == '55') {
                            return '已部分入库';
                        } else if (d.processStatus == '60') {
                            return '已入库';
                        } else if (d.processStatus == '65') {
                            return '已部分交货';
                        } else if (d.processStatus == '70') {
                            return '已交货';
                        }

                    }
                }, {
                    title: '操作',
                    toolbar: '#barDemo',
                    width: 300,
                    align: 'center'
                }]]
        });
        table.on('tool(rawclothtable)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象
            if (layEvent === 'rawcloth_del') { //删除
                opr.ajaxWithConfirm({
                    title: "您确实要删除该条数据吗?",
                    text: "数据一旦删除将无法恢复!",
                    url: 'rawcloth/' + data.processId,
                    method: 'delete',
                    layer: layer,
                    layuiTableIns: rawclothtable
                });
            } else if (layEvent === 'rawcloth_cfm') { //投坯
                opr.ajaxWithConfirm({
                    title: "您确实要投坯吗?",
                    text: "一但投坯将无法更改!",
                    url: 'rawcloth/' + data.processId + '/05',
                    method: 'put',
                    layer: layer,
                    layuiTableIns: rawclothtable
                });
            } else if (layEvent === 'rawcloth_edit') { //编辑
                message = data;
                opr.ajax({
                    url: 'rawcloth/' + message.planId + '/' + message.processId,
                    method: 'get',
                    layer: layer,
                    responseOkHandler: function (process) {
                        form.val("form-rawcloth-group-update", process);
                        layer.closeAll();
                        add_div = layer.open({
                            type: 1,
                            title: '修改分组信息',
                            area: ['1000px', '480px'],
                            content: $('#win-rawcloth-group-update'),
                            zIndex: 100
                        });
                        num2 = process.planResidue;
                    }
                });
            }
        });//监听工具条结束

        //查询可以分组的计划
        $("#bn-rawcloth-add").click(function () {
            console.log("aaaaa");
            $.ajax({
                url: "rawcloth_add",
                dataType: "html"
            }).done(function (html) {
                //layer.closeAll();
                add_div = layer.open({
                    type: 1
                    , title: "生产计划"
                    , area: ['1000px', '450px']
                    , content: html
                    , zIndex: 150
                    , btn: []
                });
            })
        });
        //提交修改

        $("#bn-rawcloth-group-update").click(function () {
            var number = $("#groupNum").val();
            var Residue = num2;
            if (number < Residue) {
                var formObject = {};
                var formArray = $("#form-rawcloth-group-update").serializeArray();
                $.each(formArray, function (i, item) {
                    formObject[item.name] = item.value;
                });
                opr.ajax({
                    url: 'rawcloth',
                    data: JSON.stringify(formObject),
                    method: 'put',
                    contentType: 'application/json;charset=UTF-8',
                    layer: layer,
                    layuiTableIns: rawclothtable,
                    responseOkHandler: function (result) {
                        layer.closeAll();
                        return true;//返回true,继续默认后续行为
                    }
                });
            }
            //return false;
        });


        $("button[name=bn-rawcloth-group-add]").click(function () {
            opr.ajax({
                url: 'rawcloth',
                data: $("#form-rawcloth-group-add").serialize(),
                method: 'post',
                layer: layer,
                layuiTableIns: rawclothtable,
                responseOkHandler: function (result) {
                    layer.close('add_div');
                    layer.closeAll();
                    return true;//返回true,继续默认后续行为
                }
            });
            return false;
        });

    });
</script>
</body>
</html>