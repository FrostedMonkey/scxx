<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户角色权限</title>
</head>
<body>
<div style="padding: 15px;">

    <form class="layui-form" id="form-user-quanx" lay-filter="form-user-quanx">

        <div class="layui-form-item">
            <label class="layui-form-label">角色</label>
            <div class="layui-input-block layui-col-md4">
                <c:forEach items="${roles}" var="role">

                    <input type="checkbox" name="rrr" title="${role.value.roName }"
                           value="${role.value.roId }" lay-skin="primary" ${role.value.checked ? "checked":"" }>
                </c:forEach>
            </div>
        </div>

        <div class="layui-form-item">
            <button class="layui-btn" id="bn-user-set-quanx">提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </form>
</div>

<script type="text/javascript">
    $('#bn-user-set-quanx').click(function () {
        var rIds = [];
        $('#form-user-quanx :checkbox:checked').each(function () {
            rIds.push(this.value);
        });

        console.log(rIds);

        opr.ajaxWithConfirm({
            title: "您确实吗？",
            url: 'user_do/quanx/${uId}',//此处\${ro_id}	是el表达式，不是js代码，运行于服务器端。
            method: 'put',
            data: JSON.stringify(rIds),
            contentType: 'application/json;charset=UTF-8',
            layer: layer,
            responseOkHandler: function (result) {
                layer.close(quanxianId);
                return true;//返回true,继续默认后续行为
            }
        });

        return false;
    });

</script>
</body>
</html>