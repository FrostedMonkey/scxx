<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>xxx信息系统</title>
    <link rel="stylesheet" href="${APP_PATH}/static/layui-2.3.0/css/layui.css">
    <link rel="stylesheet" href="${APP_PATH}/static/css/layui.mobile.css">
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
</head>

<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">xxx信息系统</div>

        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="#">
                    欢迎你: ${sessionScope["CurrUser"]["userName"]}&nbsp;&nbsp;&nbsp;

                </a>
                <dl class="layui-nav-child">
                    <dd><a href="#">密码维护</a></dd>
                    <dd><a href="#">安全退出</a></dd>
                </dl>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->

            <ul class="layui-nav layui-nav-tree" lay-filter="test">

                <c:forEach items="${menuList }" var="main">
                    <li class="layui-nav-item layui-nav-itemed">
                        <a class="" href="#">${main.menuName}</a>
                        <c:forEach items="${main.subMenuList}" var="sub">
                            <dl class="layui-nav-child">
                                <dd><a href="..${sub.menuUrl}" target="my-content">${sub.menuName }</a></dd>
                            </dl>
                        </c:forEach>
                    </li>
                </c:forEach>

            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <iframe name="my-content" width="100%" height="100%" border:none;></iframe>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        2018
    </div>
</div>
<script src="${APP_PATH}/static/layui-2.3.0/layui.all.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;
        $("a:contains('退出')").click(function () {
            /*  $.ajax({
                url:'login_doexit',
                method:'get',
            }).done(function(){
                alert("退出成功");
            }); */
            location.href = "login_doexit";
            alert("退出成功");
        });
    });

</script>
</body>
</html>