<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="../static/mint-ui/style.min.css">
    <title>生产过程信息系统-登录</title>
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

        .my-container {
            box-sizing: border-box;
            height: 100%;
            padding: 0.1rem;

        }

        .my-title {
            width: 100%;
            text-align: center;
            font-size: 0.4rem;
            color: #DDDDDD;
            text-shadow: 0.03rem 0.03rem 0.1rem #DDDDDD; /*文字阴影*/
            font-weight: bold;
            letter-spacing: 0.05rem; /*文字距离*/
        }
    </style>
</head>
<body>

<div id="scxx_login" class="my-container">
    <div style="height:15%;"></div>
    <div class="my-title">{{ title }}</div>
    <div style="height:10%;"></div>
    <div>
        <mt-field label="用户名" placeholder="请输入用户名" v-model="user.u_name"></mt-field>
        <mt-field label="密码" placeholder="请输入密码" type="password" v-model="user.u_pwd"></mt-field>
    </div>
    <div style="height:5%;"></div>
    <div>
        <mt-button size="large" type="primary" v-on:click.prevent="login">登录</mt-button>
    </div>
    <div style="height:10%;"></div>
    <div style="text-align:center;color:#AAAAAA;">技术支持：XXX软件有限公司</div>
    <script type="text/javascript" src="../static/js/vue-2.5.16.min.js"></script>
    <script type="text/javascript" src="../static/js/axios.min.js"></script>
    <script type="text/javascript" src="../static/mint-ui/index.js"></script>
    <script type="text/javascript">
        new Vue({
            el: '#scxx_login',
            data: {
                title: '生产过程',
                user: {}
            },
            methods: {
                /*
                login:function(){

                }
                 */
                login() {
                    let vm = this;
                    axios.get('login_do?uId=' + this.user.u_name + '&uPwd=' + this.user.u_pwd)
                        .then(function (response) {
                            console.log(response);
                            let result = response.data;
                            if (result.success) {
                                window.location.href = '/scxx/safty/m_home_to'
                            } else {
                                vm.$toast({
                                    message: result.message,
                                    position: 'bottom',
                                    duration: 5000
                                });
                            }
                        })
                        .catch(function (error) {
                            console.log(error);
                        });
                }
            }
        })
    </script>
</div>
</body>
</html>