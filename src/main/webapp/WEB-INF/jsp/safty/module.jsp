<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div style="padding: 10px;" id="dom-win-role-add">

    <form class="layui-form" id="form-role-module" lay-filter="form-role-module">

        <div style="padding: 5px;overflow: auto;height:395px;border:1px solid #CCCCCC;margin-bottom:15px;border-radius:5px;">

            <c:forEach items="${menuList }" var="main">

                <div style="padding-bottom:5px;">

                    <i class="layui-icon layui-icon-set-fill"></i> ${main.menuName }

                    <div class="layui-form-item" style="padding-left:20px;padding-top:3px;">

                        <c:forEach items="${main.subMenuList }" var="sub">

                            <div class="layui-input-inline" style="width: 130px;">
                                <input type="checkbox" name="mId" title="${sub.menuName }" value="${sub.menuId }"
                                       lay-skin="primary" ${sub.checked?"checked":"" } >
                            </div>
                        </c:forEach>


                    </div>

                </div>

            </c:forEach>

        </div>

        <div class="layui-form-item" style="text-align:center;">

            <button class="layui-btn" id="bn-role-set-module" style="width:100px;">提交</button>
            <button type="reset" class="layui-btn layui-btn-primary" style="width:100px;">重置</button>

        </div>


    </form>

</div>

<script type="text/javascript">

    $('#bn-role-set-module').click(function () {
        var mids = [];
        $('#form-role-module :checkbox:checked').each(function () {
            mids.push(this.value);
        });
        console.log(mids);
        opr.ajaxWithConfirm({
            title: "确定修改吗?",
            url: 'role/module/${roId}',//此处\${ro_id}	是el表达式，不是js代码，运行于服务器端。
            method: 'put',
            data: JSON.stringify(mids),
            contentType: 'application/json;charset=UTF-8',
            layer: layer,
            responseOkHandler: function (result) {
                layer.close(layerIdx2);
                return true;//返回true,继续默认后续行为
            }
        });
        return false;
    });


</script>


