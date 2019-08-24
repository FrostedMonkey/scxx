<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>打包</title>
    <link href="../static/layui-2.3.0/css/layui.css" rel="stylesheet">
</head>
<body>
<%--打包页面--%>
<div style="padding: 15px;display: none" id="win-check-add">
    <form class="layui-form" lay-filter="form-pkg-add" id="form-pkg-add">
        <div class="layui-form-item">
            <label class="layui-form-label">产品号</label>
            <div class="layui-input-block">
                <input type="text" name="productId" required lay-verify="required"
                       autocomplete="off" class="layui-input" readonly="readonly">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">组号</label>
            <div class="layui-input-block">
                <input type="text" name="processId" required lay-verify="required"
                       autocomplete="off" class="layui-input" readonly="readonly">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">规格</label>
            <div class="layui-input-block">
                <input type="text" name="productStd" required lay-verify="required"
                       autocomplete="off" class="layui-input" readonly="readonly">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">花色</label>
            <div class="layui-input-block">
                <input type="text" name="processColor" required lay-verify="required"
                       autocomplete="off" class="layui-input" readonly="readonly">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">客户</label>
            <div class="layui-input-block">
                <input type="text" name="productCus" required lay-verify="required"
                       autocomplete="off" class="layui-input" readonly="readonly">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">打包量</label>
            <div class="layui-input-block">
                <input type="text" name="storeNum" id="storeNum"
                       autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">尚未打包量</label>
            <div class="layui-input-block">
                <input type="text" id="productResidue" name="productResidue"
                       autocomplete="off" class="layui-input" readonly="readonly">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="bn-pkg-add" name="bn-pkg-add">提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>

</div>

<table id="pkg-table" lay-filter="pkgTable"></table>

<script src="../static/js/jquery-3.3.1.min.js"></script>
<script src="../static/layui-2.3.0/layui.js"></script>
<script src="../static/js/sweetalert-2.1.0.min.js"></script>
<script src="../static/js/common.js"></script>
<script type="text/html" id="barDemo">
    {{#  if(d.productResidue!=0 ){ }}
    <a class="layui-btn layui-btn-xs" lay-event="rawcloth_edit"><i class="layui-icon">&#xe608;</i> 打包</a>
    {{#  }  }}
</script>
<script type="text/javascript">
    layui.use(['element', 'table', 'layer', 'form'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        var alyes;
        var pkgTable = table.render({
            elem: '#pkg-table',
            url: 'pkg', //数据接口
            page: true,//显示分页条
            limits: [5, 8, 10, 15, 20],
            limit: 5,
            cols: [[ //表头
                {
                    field: 'productId',
                    title: '产品号',
                    align: 'center'
                }, {
                    field: 'processId',
                    title: '组号',
                    align: 'center'
                }, {
                    field: 'productCus',
                    title: '客户',
                    align: 'center'
                }, {
                    field: 'productStd',
                    title: '规格',
                    align: 'center'
                }, {
                    field: 'processColor',
                    title: '花色',
                    align: 'center'
                }, {
                    field: 'productLevel',
                    title: '产品等级',
                    align: 'center',
                    templet: function (d) {
                        if (d.productLevel == '01') {
                            return "一等品";
                        } else if (d.productLevel == '02') {
                            return "二等品";
                        } else if (d.productLevel == '03') {
                            return "三等品";
                        } else if (d.productLevel == '04') {
                            return "等外品";
                        }
                    }
                }, {
                    field: 'productNum',
                    title: '产品数量',
                    align: 'center'
                }, {
                    field: 'productResidue',
                    title: '剩余量',
                    align: 'center'
                }, {
                    field: 'productStatus',
                    title: '状态',
                    align: 'center'
                    , templet: function (d) {
                        if (d.productStatus == '35') {
                            return "已质检";
                        } else if (d.productStatus == '40') {
                            return "包装中";
                        } else if (d.productStatus == '50') {
                            return "已包装";
                        } else if (d.productStatus == '55') {
                            return "已部分入库";
                        } else if (d.productStatus == '60') {
                            return "已入库";
                        } else if (d.productStatus == '65') {
                            return "已部分交货";
                        } else if (d.productStatus == '70') {
                            return "已交货";
                        }
                    }
                }, {
                    title: "操作",
                    toolbar: '#barDemo',
                    align: 'center'
                }
            ]]
        });
        table.on('tool(pkgTable)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象
            console.log(data);
            if (layEvent === 'rawcloth_edit') { //查看
                form.val("form-pkg-add", data)
                alyes = layer.open({
                    type: 1,
                    content: $("#win-check-add"),
                    area: ['400px', '450px'],
                    zIndex: 150
                });
            }
        });

        form.on('submit(bn-pkg-add)', function (data) {
            var productResidue = parseFloat($("#productResidue").val());//剩余量
            var storeNum = parseFloat($("#storeNum").val());//打包量
            console.log("剩余量：" + productResidue);
            console.log("打包量：" + storeNum);


            if (storeNum <= productResidue) {
                if (storeNum <= 500) {
                    opr.ajax({
                        url: 'pkg/' + productResidue,
                        data: data.field,
                        method: 'post',
                        layer: layer,
                        layuiTableIns: pkgTable,
                        responseOkHandler: function (result) {
                            layer.close(alyes);
                            return true;
                        }
                    });
                } else {
                    swal("每包的量不大于500");
                }
            } else {
                swal("打包量大于剩余量");
            }

            return false;
        });


    });//layui.use结束

</script>
</body>
</html>