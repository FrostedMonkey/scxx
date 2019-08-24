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
        #form-col-query .layui-form-label {
            width: auto;
            padding-left: 5px;
            padding-right: 5px;
        }
    </style>
</head>
<body>
<div style="padding: 0px 0 15px 0px;">
		<span class="layui-breadcrumb" lay-separator="-"> <a href="#">生产信息管理</a>
			<a><cite>生产信息维护</cite></a>
		</span>
</div>

<!-- 查询表单 -->
<form class="layui-form" id="form-col-query">
    <div class="layui-form-item">

        <div class="layui-inline">

            <label class="layui-form-label">状态</label>
            <div class="layui-input-inline">
                <select name="coStatus" lay-verify="required"
                        lay-filter="select-col-query-col-status">
                    <option value="">全部</option>
                    <option value="00">未确定</option>
                    <option value="22">确定</option>
                    <option value="55">启用</option>
                    <option value="77">禁用</option>
                </select>
            </div>


            <label class="layui-form-label">颜色编号</label>
            <div class="layui-input-inline" style="width: 100px;">
                <input type="text" name="coId" autocomplete="off"
                       class="layui-input">
            </div>

            <label class="layui-form-label">颜色名称</label>
            <div class="layui-input-inline" style="width: 100px;">
                <input type="text" name="coName" autocomplete="off"
                       class="layui-input">
            </div>

            <label class="layui-form-label">颜色说明</label>
            <div class="layui-input-inline" style="width: 100px;">
                <input type="text" name="coRemark" autocomplete="off"
                       class="layui-input">
            </div>

            <button class="layui-btn" id="bn-col-query">
                <i class="layui-icon layui-icon-search"></i> 查询
            </button>

        </div>
    </div>
</form>

<div class="layui-btn-container">
    <button type="button" class="layui-btn" id="bn-col-add">
        <i class="layui-icon">&#xe608;</i> 新增
    </button>
    <button type="button" class="layui-btn" id="bn-col-cfm">
        <i class="layui-icon layui-icon-ok-circle"></i> 确定
    </button>
    <button type="button" class="layui-btn" id="bn-col-use">
        <i class="layui-icon layui-icon-auz"></i> 启用
    </button>
    <button type="button" class="layui-btn" id="bn-col-unuse">
        <i class="layui-icon layui-icon-fonts-del"></i> 禁用
    </button>
    <button class="layui-btn layui-btn-danger" id="bn-col-del-multi">
        <i class="layui-icon layui-icon-delete"></i> 删除
    </button>
</div>

<!-- 状态 00-未确定 22-确定 55-启用 77-禁用 99-逻辑删除 -->
<!-- 数据表格。  lay-filter的值可以理解为layui内部使用的唯一标志-->
<table id="info-color-table" lay-filter="cusTable"></table>


<!-- 新增窗口内容 -->
<div style="padding: 15px; display: none;" id="dom-win-col-add">

    <form class="layui-form" lay-filter="form-col-add">

        <div class="layui-form-item">
            <label class="layui-form-label">颜色名称</label>
            <div class="layui-input-block">
                <input type="text" name="coName" required lay-verify="required"
                       placeholder="请输入颜色名称" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">颜色说明</label>
            <div class="layui-input-block">
                <input type="text" name="coRemark" required lay-verify="required"
                       placeholder="请输入颜色说明" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="bn-col-do-add">提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>

</div>

<!-- 修改窗口内容 -->
<div style="padding: 15px; display: none;" id="dom-win-col-upd">

    <form class="layui-form" lay-filter="form-col-upd">

        <div class="layui-form-item">
            <label class="layui-form-label">颜色编号</label>
            <div class="layui-input-block">
                <input type="text" id="input-col-upd-col-id" name="coId" required lay-verify="required"
                       readonly="readonly" autocomplete="off" class="layui-input"
                       onclick="layer.tips('编号不可编辑。', this,{tips:[4,'#6f6f6f'],time: 1500});">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">颜色名称</label>
            <div class="layui-input-block">
                <input type="text" name="coName" required lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">颜色说明</label>
            <div class="layui-input-block">
                <input type="text" name="coRemark" required lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="bn-col-do-upd">提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>

</div>


<!-- 工具条定义 -->
<script type="text/html" id="barDemo">

    <!--  laytpl 语法， d指数据，在这里指当前行数据 -->
    {{#  if(d.coStatus == '00' ){ }}
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="col_del"><i class="layui-icon layui-icon-delete"></i>
        删除</a>
    <a class="layui-btn layui-btn-xs" lay-event="col_cfm"><i class="layui-icon layui-icon-ok-circle"></i> 确定</a>
    <a class="layui-btn layui-btn-xs" lay-event="col_edit"><i class="layui-icon">&#xe608;</i> 编辑</a>
    {{#  }else if(d.coStatus == '22' || d.coStatus == '77' ){  }}

    <a class="layui-btn layui-btn-xs" lay-event="col_use"><i class="layui-icon layui-icon-auz"></i> 启用</a>

    {{#  }else if(d.coStatus == '55' ){  }}

    <a class="layui-btn layui-btn-xs" lay-event="col_unuse"><i class="layui-icon layui-icon-fonts-del"></i> 禁用</a>

    {{#  }  }}


</script>
<script src="../static/layui-2.3.0/layui.js"></script>
<script src="../static/js/jquery-3.3.1.min.js"></script>
<script src="../static/swertalert/sweetalert.min.js"></script>
<script>
    layui.use(['element', 'table', 'layer', 'form'], function () {

        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;

        //第一个实例
        var cusTable = table.render({
            elem: '#info-color-table',
            url: 'color', //数据接口
            page: true,//显示分页条
            limits: [5, 10, 15, 20, 30],
            limit: 5,

            //even:true,//隔行变色

            cols:
                [[ //表头
                    {
                        type: 'checkbox'
                    }, {
                        field: 'coId',
                        title: '颜色编号'
                    }, {
                        field: 'coName',
                        title: '颜色名称'
                    }, {
                        field: 'coRemark',
                        title: '颜色说明'
                    }, {
                        field: 'coStatus',
                        title: '状态',
                        align: 'center',
                        templet: function (d) {
                            if (d.coStatus == "00") {
                                return "未确定";
                            }
                            if (d.coStatus == "22") {
                                return "确定";
                            }
                            if (d.coStatus == "55") {
                                return "启用";
                            }
                            if (d.coStatus == "77") {
                                return "禁用";
                            }
                            if (d.coStatus == "99") {
                                return "逻辑删除";
                            }
                        }


                    }, {
                        toolbar: '#barDemo'
                    }

                ]]
        });

        //查询
        $('#bn-col-query').click(function () {

            //将表单参数封装为json对象
            var arr = $("#form-col-query").serializeArray();
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
            showBns();
            return false;
        });

        //监听select选择
        form.on('select(select-col-query-col-status)', function (data) {
            //console.log(data.elem); //得到select原始DOM对象
            //console.log(data.value); //得到被选中的值
            //console.log(data.othis); //得到美化后的DOM对象

            $('#bn-col-query').click();

        });


        //监听工具条。注：tool是工具条事件名，cusTable是table原始容器的属性 lay-filter属性的值
        table.on('tool(cusTable)', function (obj) {
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象

            if (layEvent === 'col_del') { //删除


                swal({
                    title: "您确实要删除该条数据吗?",
                    text: "数据一旦删除将无法恢复!",
                    icon: "warning",
                    buttons: [
                        "取消",
                        {text: '确认删除', closeModal: false}
                    ],
                    dangerMode: true,
                })
                    .then((ok) = > {
                    if(ok) {
                        $.ajax({
                            url: 'color/' + data.coId,
                            method: 'delete',
                            dataType: 'json'
                        }).done(function (result) {
                            if (result.success) {
                                swal({
                                    text: result.message,
                                    icon: "success",
                                    buttons: false,
                                    timer: 1500
                                });
                                cusTable.reload();
                            } else {
                                swal({
                                    title: result.message,
                                    icon: "error",
                                    button: "确定"
                                });
                            }

                        }).fail(function (xhr) {
                            swal({
                                title: xhr.status,
                                icon: "error",
                                button: "确定"
                            });
                        });
                    }


                }
            )
            .
                catch(err = > {
                    if(err) {
                        swal("操作失败!", "请于管理员联系。", "error");
                    } else {
                        swal.stopLoading();//停止加载显示
                swal.close();//关闭提示框
            }
            })
                ;


            } else if (layEvent === 'col_edit') { //编辑

                var index = layer.load();
                /* 	form.val("form-col-upd", {//form-cus-add是表单的lay-filter值
                          "co_id": data.coId
                    }); */
                $.ajax({
                    url: 'color/' + data.coId,
                    method: 'get',
                    dataType: 'json',
                    contentType: "application/charset=utf-8"
                }).done(function (col) {
                    alert("16516");
                    layer.close(index);

                    //form-cus-upd是表单的lay-filter值
                    form.val("form-col-upd", col);

                    layerIdx = layer.open({
                        type: 1,
                        title: '修改客户信息',
                        area: ['800px', '540px'],
                        content: $('#dom-win-col-upd'),
                        zIndex: 100 //将层次降低，以使sweetalert能够在layer之上
                    });

                });

            } else if (layEvent === 'col_cfm') { //确定

                swal({
                    title: "您确实要确定该客户信息吗?",
                    text: "客户信息一旦确定将无法编辑!",
                    icon: "warning",
                    buttons: [
                        "取消",
                        {text: '确认', closeModal: false}
                    ],
                    dangerMode: true,
                })
                    .then((ok) = > {
                    if(ok) {
                        $.ajax({
                            url: 'color/status/' + data.coId + '/22',
                            method: 'put',
                            dataType: 'json'
                        }).done(function (result) {
                            if (result.success) {
                                swal({
                                    text: result.message,
                                    icon: "success",
                                    buttons: false,
                                    timer: 1500
                                });
                                cusTable.reload();
                            } else {
                                swal({
                                    title: result.message,
                                    icon: "error",
                                    button: "确定"
                                });
                            }

                        }).fail(function (xhr) {
                            swal({
                                title: xhr.status,
                                icon: "error",
                                button: "确定"
                            });
                        });
                    }


                }
            )
            .
                catch(err = > {
                    if(err) {
                        swal("操作失败!", "请于管理员联系。", "error");
                    } else {
                        swal.stopLoading();//停止加载显示
                swal.close();//关闭提示框
            }
            })
                ;


            } else if (layEvent === 'col_use') { //启用

                swal({
                    title: "您确实要启用该客户信息吗?",
                    icon: "warning",
                    buttons: [
                        "取消",
                        {text: '确认', closeModal: false}
                    ],
                    dangerMode: true,
                })
                    .then((ok) = > {
                    if(ok) {
                        $.ajax({
                            url: 'color/status/' + data.coId + '/55',
                            method: 'put',
                            dataType: 'json'
                        }).done(function (result) {
                            if (result.success) {
                                swal({
                                    text: result.message,
                                    icon: "success",
                                    buttons: false,
                                    timer: 1500
                                });
                                cusTable.reload();
                            } else {
                                swal({
                                    title: result.message,
                                    icon: "error",
                                    button: "确定"
                                });
                            }

                        }).fail(function (xhr) {
                            swal({
                                title: xhr.status,
                                icon: "error",
                                button: "确定"
                            });
                        });
                    }


                }
            )
            .
                catch(err = > {
                    if(err) {
                        swal("操作失败!", "请于管理员联系。", "error");
                    } else {
                        swal.stopLoading();//停止加载显示
                swal.close();//关闭提示框
            }
            })
                ;


            } else if (layEvent === 'col_unuse') { //禁用

                swal({
                    title: "您确实要禁用该客户信息吗?",
                    icon: "warning",
                    buttons: [
                        "取消",
                        {text: '确认', closeModal: false}
                    ],
                    dangerMode: true,
                })
                    .then((ok) = > {
                    if(ok) {
                        $.ajax({
                            url: 'color/status/' + data.coId + '/77',
                            method: 'put',
                            dataType: 'json'
                        }).done(function (result) {
                            if (result.success) {
                                swal({
                                    text: result.message,
                                    icon: "success",
                                    buttons: false,
                                    timer: 1500
                                });
                                cusTable.reload();
                            } else {
                                swal({
                                    title: result.message,
                                    icon: "error",
                                    button: "确定"
                                });
                            }

                        }).fail(function (xhr) {
                            swal({
                                title: xhr.status,
                                icon: "error",
                                button: "确定"
                            });
                        });
                    }


                }
            )
            .
                catch(err = > {
                    if(err) {
                        swal("操作失败!", "请于管理员联系。", "error");
                    } else {
                        swal.stopLoading();//停止加载显示
                swal.close();//关闭提示框
            }
            })
                ;


            }


        });//监听工具条结束

        //删除多条数据
        $('#bn-col-del-multi').click(function () {

            var checkStatus = table.checkStatus('info-color-table'); //基础参数id对应的值
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
                arr.push(this.coId);
            });


            swal({
                title: "您确实要删除选择的数据吗?",
                text: "数据一旦删除将无法恢复!",
                icon: "warning",
                buttons: [
                    "取消",
                    {text: '确认删除', closeModal: false}
                ],
                dangerMode: true,
            })
                .then((ok) = > {
                if(ok) {

                    $.ajax({
                        url: 'color',
                        data: JSON.stringify(arr),
                        contentType: 'application/json;charset=UTF-8',
                        method: 'delete',
                        dataType: 'json'
                    }).done(function (result) {
                        if (result.success) {
                            swal({
                                text: result.message,
                                icon: "success",
                                buttons: false,
                                timer: 1500
                            });
                            cusTable.reload();
                        } else {
                            swal({
                                title: result.message,
                                icon: "error",
                                button: "确定"
                            });
                        }

                    }).fail(function (xhr) {
                        swal({
                            title: xhr.status,
                            text: '请于管理员联系。',
                            icon: "error",
                            button: "确定"
                        });
                    });


                }


            }
        )
        .
            catch(err = > {
                if(err) {
                    console.log(err);
                    swal("操作失败!", "请于管理员联系。", "error");
                } else {
                    swal.stopLoading();//停止加载显示
            swal.close();//关闭提示框
        }
        })
            ;


        });//删除多条数据结束


        var layerIdx;
        //打开新增窗口
        $('#bn-col-add').click(function () {

            form.val("form-col-add", {//form-cus-add是表单的lay-filter值
                "coName": "",
                "coRemark": ""
            });


            layerIdx = layer.open({
                type: 1,
                title: '新增颜色信息',
                area: ['800px', '540px'],
                content: $('#dom-win-col-add'),
                zIndex: 100 //将层次降低，以使sweetalert能够在layer之上
            });

        });


        //监听新增表单提交。bn-cus-do-add是新增表单中提交按钮的lay-filter值
        form.on('submit(bn-col-do-add)', function (data) {

            console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}

            var index = layer.load(); //加载层

            $.ajax({
                url: 'color',
                data: data.field,
                method: 'post',
                dataType: 'json'
            }).done(function (result) {
                if (result.success) {
                    cusTable.reload();//重载表格
                    layer.closeAll();
                    swal({
                        text: result.message,
                        icon: "success",
                        buttons: false,
                        timer: 1500
                    });
                } else {
                    layer.close(index);
                    swal({
                        title: result.message,
                        icon: "error",
                        button: "确定"
                    });
                }
            }).fail(function (xhr) {
                layer.close(index);
                swal({
                    title: xhr.status,
                    text: '请于管理员联系。',
                    icon: "error",
                    button: "确定"
                });
            });


            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });


        //监听修改表单提交。bn-cus-do-upd是修改表单中提交按钮的lay-filter值
        form.on('submit(bn-col-do-upd)', function (data) {
            //console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
            //console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
            console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}

            var index = layer.load(); //加载层

            $.ajax({
                url: 'color',
                data: JSON.stringify(data.field),
                method: 'put',
                contentType: 'application/json;charset=UTF-8',
                dataType: 'json'
            }).done(function (result) {
                if (result.success) {
                    cusTable.reload();//重载表格
                    layer.closeAll();
                    swal({
                        text: result.message,
                        icon: "success",
                        buttons: false,
                        timer: 1500
                    });
                } else {
                    layer.close(index);
                    swal({
                        title: result.message,
                        icon: "error",
                        button: "确定"
                    });
                }

            }).fail(function (xhr) {
                console.log(xhr);
                layer.close(index);
                swal({
                    title: xhr.status,
                    text: '请于管理员联系。',
                    icon: "error",
                    button: "确定"
                });
            });


            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });


        //确定多条数据
        $('#bn-col-cfm').click(function () {

            changeMultiCusStatus('您确实要确定选择的客户信息吗？', '客户信息一旦被确定，将不能再被编辑！', '22', table, cusTable);

        });

        //启用多条数据
        $('#bn-col-use').click(function () {

            changeMultiCusStatus('您确实要启用选择的客户信息吗？', '', '55', table, cusTable);

        });

        //禁用多条数据
        $('#bn-col-unuse').click(function () {

            changeMultiCusStatus('您确实要禁用选择的客户信息吗？', '客户信息一旦被禁用，将不能被使用！', '77', table, cusTable);

        });


    });

    //显示按钮是否可用
    function showBns() {
        var _col_status = $('#form-col-query select[name=coStatus').val();
        console.log("_col_status=" + _col_status);
        if (_col_status == '') {
            $('#bn-col-add,#bn-col-del-multi,#bn-col-cfm,#bn-col-use,#bn-col-unuse').prop('disabled', true).addClass("layui-btn-disabled");
        } else if (_col_status == '00') {
            $('#bn-col-add,#bn-col-del-multi,#bn-col-cfm').prop('disabled', false).removeClass("layui-btn-disabled");
            $('#bn-col-use,#bn-col-unuse').prop('disabled', true).addClass("layui-btn-disabled");
        } else if (_col_status == '22') {
            $('#bn-col-add,#bn-col-del-multi,#bn-col-cfm,#bn-col-unuse').prop('disabled', true).addClass("layui-btn-disabled");
            $('#bn-col-use').prop('disabled', false).removeClass("layui-btn-disabled");
        } else if (_col_status == '55') {
            $('#bn-col-add,#bn-col-del-multi,#bn-col-cfm,#bn-col-use').prop('disabled', true).addClass("layui-btn-disabled");
            $('#bn-col-unuse').prop('disabled', false).removeClass("layui-btn-disabled");
        } else if (_col_status == '77') {
            $('#bn-col-add,#bn-col-del-multi,#bn-col-cfm,#bn-col-unuse').prop('disabled', true).addClass("layui-btn-disabled");
            $('#bn-col-use').prop('disabled', false).removeClass("layui-btn-disabled");
        }
    }

    showBns();

    //函数：改变多个客户信息状态
    function changeMultiCusStatus(title, text, coStatus, table, cusTable) {
        var checkStatus = table.checkStatus('info-color-table');
        alert(checkStatus.data);
        //基础参数id对应的值
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
            arr.push(this.co_id);
        });


        swal({
            title: title,
            text: text,
            icon: "warning",
            buttons: [
                "取消",
                {text: '确认', closeModal: false}
            ],
            dangerMode: true,
        })
            .then((ok) = > {
            if(ok) {

                $.ajax({
                    url: 'color/status/' + coStatus,
                    data: JSON.stringify(arr),
                    contentType: 'application/json;charset=UTF-8',
                    method: 'put',
                    dataType: 'json'
                }).done(function (result) {
                    if (result.success) {
                        swal({
                            text: result.message,
                            icon: "success",
                            buttons: false,
                            timer: 1500
                        });
                        cusTable.reload();//重载数据
                    } else {
                        swal({
                            title: result.message,
                            icon: "error",
                            button: "确定"
                        });
                    }

                }).fail(function (xhr) {
                    swal({
                        title: xhr.status,
                        text: '请于管理员联系。',
                        icon: "error",
                        button: "确定"
                    });
                });


            }


        }
    )
    .
        catch(err = > {
            if(err) {
                console.log(err);
                swal("操作失败!", "请于管理员联系。", "error");
            } else {
                swal.stopLoading();//停止加载显示
        swal.close();//关闭提示框
    }
    })
        ;

    }//函数：改变多个客户信息状态结束


</script>
</body>
</html>