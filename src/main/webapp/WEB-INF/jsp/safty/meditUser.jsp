<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>用户密码修改</title>
    <link rel="stylesheet" href="../static/mint-ui/style.min.css">
    <style type="text/css">

        html {
            font-size: 100px;
            /*设置长度单位rem标准。 注：rem与px都是长度宽度单位，px指一个像素是绝对单位，rem是相对单位，以html字体大小为1rem */
            height: 100%;
        }

        body {
            font-size: 0.16rem; /*恢复浏览器默认字体大小设置*/
            height: 100%;
            padidng: 0;
            margin: 0;
            background-color: #F5F5F5; /*浅灰色背景*/
        }


    </style>
</head>

<body>

<div id="app">

    <mt-header fixed title="修改密码">
        <router-link to="/" slot="left">
            <mt-button icon="back" onclick="javascript :history.back(-1)">返回</mt-button>
        </router-link>
    </mt-header>
    <div style="height:1.5rem;"></div>

    <div>
        <mt-field label="旧密码" placeholder="请输入旧密码" type="password" v-model="password1"></mt-field>
        <mt-field label="新密码" placeholder="请输入新密码" type="password" v-model="password2"></mt-field>
        <mt-field label="新密码" placeholder="请重新输入新密码" type="password" v-model="password3"></mt-field>
    </div>

    <div style="height:0.8rem;"></div>

    <div>
        <mt-button type="primary" @click.prevent="check" size="large">提交</mt-button>
    </div>

</div>

<script type="text/javascript" src="../static/js/vue-2.5.16.min.js"></script>
<script type="text/javascript" src="../static/js/axios.min.js"></script>
<script type="text/javascript" src="../static/mint-ui/index.js"></script>
<script type="text/javascript">
    new Vue({
        el: '#app',
        data: {
            password1: '',
            password2: '',
            password3: '',

        },
        methods: {
            check() {
                let vm = this;

                if (this.password2 == this.password3 && this.password2 != '' && this.password3 != '') {
                    axios({
                        method: 'put',
                        url: 'mUpdPwd',
                        data: {
                            newPwd: this.password2,
                            oldPwd: this.password1
                        }

                    }).then(function (response) {
                        if (response.data.success) {
                            window.location.href = "m_home_to"
                        } else {
                            vm.$toast({
                                message: '修改失败'
                            });
                        }
                    });
                } else if (this.password2 == '' || this.password3 == '') {
                    this.$toast({
                        message: '请填写完整'
                    });
                } else {
                    this.$toast({
                        message: '两次密码输入不一致'
                    });
                }

            }
        }//method方法结束


    });

</script>

</body>
</html>