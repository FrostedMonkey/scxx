<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 新增窗口内容 -->
<div style="padding: 15px;" id="dom-win-manager-add">
    <form class="layui-form" id="form-manager-add" lay-filter="form-manager-add">
        <div class="layui-form-item">
            <label class="layui-form-label">产品规格</label>
            <div class="layui-input-block">
                <select name="standardId" lay-filter="standard">
                    <c:forEach items="${standard }" var="sta">
                        <option value="${sta.standardId }">${sta.standardName }</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">客户信息</label>
            <div class="layui-input-block">
                <select name="cusId" lay-filter="customer">
                    <c:forEach items="${customer }" var="cu">
                        <option value="${cu.cusId }">${cu.cusName }</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">颜色信息</label>
            <div class="layui-input-block">
                <select name="coId" lay-filter="color">
                    <c:forEach items="${color }" var="co">
                        <option value="${co.coId }">${co.coName }</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">生产编号</label>
            <div class="layui-input-block">
                <input type="text" name="planXh" required lay-verify="required"
                       placeholder="请输入生产编号" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">计划月份</label>
            <div class="layui-input-block">
                <input id="month" name="planMonth" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">计划产量</label>
            <div class="layui-input-block">
                <input type="text" name="planNum" required lay-verify="required"
                       placeholder="请输入计划产量" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">产品类型</label>
            <div class="layui-input-block">
                <select name="planType" lay-filter="Type">
                    <option value="1">白布产品</option>
                    <option value="2">染色产品</option>
                    <option value="3">无底色印花产品</option>
                    <option value="4">有底色印花产品</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" id="bn-plan-do-add" style="width:100px;">提交</button>
                <button type="reset" class="layui-btn layui-btn-primary" style="width:100px;">重置</button>
            </div>
        </div>
    </form>
</div>
<script>

    $("#bn-plan-do-add").click(function () {
        opr.ajax({
            url: 'manager',
            data: $('#form-manager-add').serialize(),
            method: 'post',
            layer: layer,
            layuiTableIns: managertable,
            responseOkHandler: function (result) {
                layer.close(layerIdx2);
                return true;//返回true,继续默认后续行为
            }
        });
        return false;

    });


</script>