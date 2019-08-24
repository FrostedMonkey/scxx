<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>生产过程信息系统-首页</title>
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
<body>
<div id="app" class="my-container">
    <mt-header fixed title="生产过程信息系统"></mt-header>
    <div style="height:0.4rem;"></div>
    <!-- tab-container -->
    <mt-tab-container v-model="selected">
        <mt-tab-container-item id="home-work">

            <!--渲染多个元素  -->
            <template v-for="menu in menus">
                <mt-cell
                        :title="menu.mName"
                        :to="'..'+menu.mUrl"
                        is-link
                >
                </mt-cell>
            </template>

        </mt-tab-container-item>
    </mt-tab-container>

    <!--Tabbar  -->
    <mt-tabbar v-model="selected">
        <mt-tab-item id="home-work">
            <img slot="icon" src="../assets/100x100.png"> 工作
        </mt-tab-item>
        <mt-tab-item id="home-mine">
            <img slot="icon" src="../assets/100x100.png"> 我的
        </mt-tab-item>
    </mt-tabbar>

    <!-- 操作表，从屏幕下方移入。

     -->
    <mt-actionsheet
            :actions="actions"
            v-model="actionsShow">
    </mt-actionsheet>
</div>
<script type="text/javascript" src="../static/js/vue-2.5.16.min.js"></script>
<script type="text/javascript" src="../static/js/axios.min.js"></script>
<script type="text/javascript" src="../static/mint-ui/index.js"></script>
<script type="text/javascript">

    new Vue({
        el: '#app',
        data: {
            selected: 'home-work',
            menus: [],
            actions: [
                {
                    name: '修改密码',
                    method: function () {
                        window.location.href = "m_editUesr"
                    }
                },
                {
                    name: '退出',
                    method: function () {
                        axios
                            .get('m_doexit')
                            .then(function (response) {
                                if (response.data.success) {
                                    window.location.href = '../login/login_to';
                                }

                            })
                            .catch(function (error) {
                                console.log(error);
                            });
                    }
                }
            ],
            actionsShow: false
        },
        methods: {},

        //回调函数（Vue对象挂在界面完成时）
        mounted() {
            let vm = this;
            axios
                .get('m_menus')
                .then(function (response) {
                    console.log("1" + response.data.data);
                    vm.menus = response.data.data;
                    console.log("2" + vm.menus);
                })
                .catch(function (error) {
                    console.log(error);
                });
        },

        //侦听属性变化
        watch: {

            //侦听selected属性，参数为已改变后的值
            selected(currSel) {
                if (currSel == 'home-mine') {
                    this.actionsShow = true;//显示菜单
                } else {
                    this.actionsShow = false;
                }
            },

            actionsShow(currShow) {

                if (!currShow) {
                    this.selected = 'home-work';
                }
            }


        }


    });
</script>
</body>
</html>