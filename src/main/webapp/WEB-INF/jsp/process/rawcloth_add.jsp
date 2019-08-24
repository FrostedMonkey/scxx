<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>


<table id="demo" lay-filter="rawclothtable2"></table>
<script type="text/html" id="barDemo2">
    <a class="layui-btn layui-btn-xs" lay-event="rawcloth_details2"><i class="layui-icon">&#xe608;</i>分组</a>
</script>
<script>
    layui.use(['element', 'table', 'layer', 'form'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        table.render({
            elem: '#demo',
            url: 'rawcloth/plan' //数据接口
            ,
            page: true //开启分页
            ,
            limits: [5, 10, 15, 20, 30],
            limit: 5,
            cols: [[ //表头
                {
                    field: 'planId',
                    title: '计划ID',
                    align: 'center'
                }, {
                    field: 'processStd',
                    title: '规则名称',
                    align: 'center'
                }, {
                    field: 'processCus',
                    title: '客户名称',
                    align: 'center'
                }, {
                    field: 'processColor',
                    title: '颜色名称',
                    align: 'center'
                }, {
                    field: 'planNum',
                    title: '计划产量',
                    align: 'center'
                }, {
                    field: 'planResidue',
                    title: '剩余产量',
                    align: 'center',
                    templet: function (d) {
                        if (d.planResidue == null) {
                            return d.planNum;
                        } else {
                            return d.planResidue;
                        }
                    }
                }, {
                    title: '操作',
                    toolbar: '#barDemo2',
                    align: 'center'
                }]]
        });
        table.on('tool(rawclothtable2)', function (obj) { //注：edit是固定事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象
            if (layEvent === 'rawcloth_details2') {

                num = data.planResidue;
                add_div = layer.open({
                    type: 1
                    , title: "坯布准备"
                    , area: ['800px', '450px']
                    , content: $("#win-rawcloth-group-add")
                    , zIndex: 900
                    , btn: []
                    , success: function () {
                        form.render(null, 'form-rawcloth-group-add');
                        form.val("form-rawcloth-group-add", data);
                    }
                });


            }
        });


        $("#groupNums").keyup(function () {

            groupNum = $("#groupNums").val();//分组量
            if (groupNum > num) {//分组量小于剩余量 可以添加
                swal("分组量大于剩余产量请重新输入");
                $("#groupNums").val(num);
            }
        });
    });
</script>
