<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<script type="text/javascript">
    if (self != top) {
        top.location.href = "../index.jsp";
    }
</script>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>生产过程管理系统</title>


    <title>生产过程管理系统-登录</title>
    <style type="text/css">

        html, body {
            width: 100%;
            height: 100%;
            padding: 0;
            margin: 0;
        }

        .login-form {
            box-sizing: border-box;
            width: 700px;
            margin: 0 auto;

            padding-bottom: 30px;
            font-size: 14px;
            background-color: #FCFCFC;
            border: 1px solid #DDDDDD;
            border-radius: 10px;
            box-shadow: 0px 0px 10px 2px #DDDDDD;

            position: relative;
        }

        .login-form h1 {
            text-align: center;
            font-family: 楷体;
            font-size: 60px;
            font-weight: bold;
            color: #002288;
            margin: 20px 0 20px 0;

        }

        .login-form div {
            margin: 0 auto 22px;
            text-align: center;
        }

        .login-form label {
            display: inline-block;
            width: 60px;
            font-weight: bold;

        }

        .login-form input[type=text], .login-form input[type=password] {
            width: 260px;
            height: 40px;
            border: 1px solid #DDDDDD;
            border-radius: 5px;
            padding: 2px;
            outline: none;

        }

        .login-form input[type=text]:focus, .login-form input[type=password]:focus {
            border-color: #00EEEE;
            box-shadow: 0 0 6px 0 #00AAEE
        }

        .login-form button {
            width: 260px;
            height: 40px;
            margin-top: 15px;
            margin-left: 60px;
            font-size: 18px;
            background-color: transparent;
            border: 1px solid #DDDDDD;
            border-radius: 10px;
            outline: none;
        }

        .login-form button:hover {
            border: 1px solid #557799;
        }

        .login-form button:active {
            border: 1px solid #FF0000;
        }

        .login-form h6 {
            color: red;
            text-align: center;

            height: 20px;
            line-height: 20px;
            margin: 0px 0 20px 0;
            padding: 0px;
        }


    </style>


</head>
<body>

<form id="loginForm" class="login-form">
    <h1>生产过程管理系统</h1>
    <h6></h6>
    <div>
        <label for="uId">帐号：</label><input placeholder="请填写帐号" id="uId" type="text" name="uId"/>
    </div>
    <div>
        <label for="uPwd">密码：</label><input placeholder="请填写密码" id="uPwd" type="password" name="uPwd"/>
    </div>
    <div>
        <button type="button" id="submitBn">登 录</button>
    </div>
</form>

<script type="text/javascript" src="../static/js/jquery-1.12.4.min.js"></script>
<script src="../static/js/sweetalert-2.1.0.min.js"></script>
<script type="text/javascript">

    $('.login-form').hide().css({
        top: '50%',
        marginTop: -$('.login-form').outerHeight() / 2 + 'px'
    }).slideDown();

    $("#submitBn").click(function () {

        $.ajax({
            url: "login_do",
            data: $("#loginForm").serialize(),
            dataType: "json",
            method: "get",
        }).done(function (result) {

            /*if(result.success){
                if(result.data.uStatus=='55'){//启用
                    swal({
                         text:"登陆成功",
                         icon:"success",
                         buttons:false,
                         timer:1500
                    });
                    /!* $.ajax({
                        url:'home_to'
                    }); *!/
                    location.href="/scxx/safty/home_to";
                }else if(result.data.uStatus=='00'){//未确定
                    swal({
                         title:"登录失败",
                         text:"账户尚未被确定，请联系管理员",
                         icon:"error",
                         buttons:false,
                         timer:1500
                    });
                }else if(result.uStatus=='22'){//确定
                    swal({
                         title:"登录失败",
                         text:"账户尚未被启用，请联系管理员",
                         icon:"error",
                         buttons:false,
                         timer:1500
                    });
                }else if(result.data.uStatus=='77'){//禁用
                    swal({
                         title:"登录失败",
                         text:"账户已被禁用，请联系管理员",
                         icon:"error",
                         buttons:false,
                         timer:1500
                    });
                }else if(result.data.uStatus=='99'){//逻辑删除
                    swal({
                         title:"登录失败",
                         text:"账户已失效",
                         icon:"error",
                         buttons:false,
                         timer:1500
                    });
                }*/
            if (result.success) {
                swal({
                    text: "登陆成功",
                    icon: "success",
                    buttons: false,
                    timer: 1500
                });
                location.href = "home_to";
            } else {
                swal({
                    title: "登录失败",
                    text: "用户名或密码错误",
                    icon: "error",
                    buttons: false,
                    timer: 1500
                });
            }
        });
    });//登录按钮完


</script>


</body>
</html>
    