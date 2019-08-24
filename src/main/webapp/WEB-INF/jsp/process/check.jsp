<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>质检</title>
    <link rel="stylesheet" href="../static/layui-2.3.0/css/layui.css"
          media="all">
</head>
<body>
<%--质检页面--%>
<div style="padding: 15px;display: none" id="win-check-add">
    <form class="layui-form" lay-filter="form-check-add" id="form-check-add">
        <div class="layui-form-item">
            <label class="layui-form-label">组号</label>
            <div class="layui-input-block">
                <input type="text" name="processId" required lay-verify="required"
                       autocomplete="off" class="layui-input" readonly="readonly">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">订单号</label>
            <div class="layui-input-block">
                <input type="text" name="planId" required lay-verify="required"
                       autocomplete="off" class="layui-input" readonly="readonly">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">规格</label>
            <div class="layui-input-block">
                <input type="text" name="processStd" required lay-verify="required"
                       autocomplete="off" class="layui-input" readonly="readonly">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">生产产量</label>
            <div class="layui-input-block">
                <input type="text" name="arrangeNum" required lay-verify="required"
                       autocomplete="off" class="layui-input" readonly="readonly">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">一等品</label>
            <div class="layui-input-block">
                <input type="text" name="processOne" id="processOne"
                       autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">二等品</label>
            <div class="layui-input-block">
                <input type="text" id="processTwo" name="processTwo"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">三等品</label>
            <div class="layui-input-block">
                <input type="text" id="processThree" name="processThree"
                       autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">等外品</label>
            <div class="layui-input-block">
                <input type="text" id="processFour" name="processFour"
                       autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">尚未质检量</label>
            <div class="layui-input-block">
                <input type="text" id="planResidue2" name="planResidue2"
                       autocomplete="off" class="layui-input" readonly="readonly">
                <input type="hidden" name="processStatus">
                <input type="hidden" name="processCus">
                <input type="hidden" name="processColor">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="bn-check-add" name="bn-check-add">提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>

</div>


<table id="process-check-table" lay-filter="checktable"></table>
<script src="../static/js/jquery-3.3.1.min.js"></script>
<script src="../static/layui-2.3.0/layui.js"></script>
<script src="../static/js/sweetalert-2.1.0.min.js"></script>
<script src="../static/js/common.js"></script>
<script src="../static/js/axios.min.js"></script>
<script type="text/html" id="barDemo">
    {{#  if(d.plan_Residue2!==0 ){ }}

    <a class="layui-btn layui-btn-xs" lay-event="rawcloth_edit"><i class="layui-icon">&#xe608;</i> 质检</a>
    {{#  }  }}
</script>
<script>
    layui.use(['table', 'layer', 'form'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        var indexlayer;
        var checkTable = table.render({
            elem: '#process-check-table',
            url: 'check' //数据接口
            ,
            page: true //开启分页
            ,
            limits: [5, 10, 15, 20, 30],
            limit: 5,
            cols: [[ //表头
                {
                    field: 'processId',
                    title: '组号',
                    align: 'center',
                    rowspan: 2
                }, {
                    field: 'planId',
                    title: '订单号',
                    align: 'center',
                    rowspan: 2
                }, {
                    field: 'processStd',
                    title: '规格',
                    align: 'center',
                    rowspan: 2
                }, {
                    field: 'arrangeNum',
                    title: '生产产量',
                    align: 'center',
                    rowspan: 2
                }, {
                    title: '质检产量',
                    align: 'center',
                    colspan: 5
                }, {
                    field: 'processStatus',
                    title: '状态',
                    align: 'center',
                    rowspan: 2,
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
                    title: "操作",
                    toolbar: '#barDemo',
                    align: 'center',
                    rowspan: 2
                }],

                [{field: 'processTotal', title: '合计',}
                    , {field: 'processOne', title: '一等品',}
                    , {field: 'processTwo', title: '二等品'}
                    , {field: 'processThree', title: '三等品'}
                    , {field: 'processFour', title: '四等品'}
                ]]
        });
        //监听工具栏
        table.on('tool(checktable)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象
            if (layEvent === 'rawcloth_edit') { //查看
                form.val("form-check-add", {
                    "processId": data.processId,
                    "planId": data.planId,
                    "processStd": data.processStd,
                    "arrangeNum": data.arrangeNum,
                    "planResidue2": data.planResidue2,
                    "processStatus": data.processStatus,
                    "processCus": data.processCus,
                    "processColor": data.processColor

                });
                indexlayer = layer.open({
                    type: 1,
                    content: $("#win-check-add"),
                    area: ['1000px', '450px'],
                    zIndex: 150
                });
            }
        });

        form.on('submit(bn-check-add)', function (data) {

            var num = 0;
            var one = $("#processOne").val();
            var two = $("#processTwo").val();
            var three = $("#processThree").val();
            var four = $("#processFour").val();
            var planResidue2 = parseFloat($("#planResidue2").val());
            if (one != null && one != '') {
                num += parseFloat(one);
            }
            if (two != null && two != '') {
                num += parseFloat(two);
            }
            if (three != null && three != '') {
                num += parseFloat(three);
            }
            if (four != null && four != '') {
                num += parseFloat(four);
            }


            if (num <= planResidue2) {
                opr.ajax({
                    url: 'check/' + num,
                    data: data.field,
                    method: 'post',
                    layer: layer,
                    layuiTableIns: checkTable,
                    responseOkHandler: function (result) {
                        layer.close(indexlayer);
                        return true;
                    }
                });
            } else {
                swal("质检量大于剩余量");
            }
            return false;
        });
    });

</script>
</body>
</html>
