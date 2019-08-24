<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="../static/mint-ui/style.min.css">
    <style type="text/css">

        html {
            font-size: 100px;
            height: 100%;
        }

        body {
            height: 100%;
            padidng: 0;
            margin: 0;
            background-color: #F5F5F5;
            font-size: 0.16rem;
        }

        .my-card {
            font-size: 0.14rem;
            margin: 0.1rem;
            padding: 0 0.1rem 0 0.1rem;
            border-radius: 0.08rem;
            border: 0.01rem solid #DDDDDD;
            box-shadow: 0.00rem 0.00rem 0.1rem 0.00rem #DDDDDD;
            /*
             */
            /* color:#70706F; */
            background-color: #FFFFFF;
        }

        .my-card-title {

            display: flex;
            flex-direction: row;
            justify-content: space-between;


            padding: 0.09rem 0 0.07rem 0;
            border-bottom: 0.01rem solid #EEEEEE;
            margin-bottom: 0.04rem;


            color: #OOOOOO;


        }

        .my-card-opr {

            border-top: 0.01rem solid #EEEEEE;
            margin-top: 0.04rem;

            text-align: right;
            padding: 0.06rem 0 0.06rem 0;
        }

        .my-card-content {

            display: flex;
            flex-direction: row;
            flex-wrap: wrap;
            justify-content: space-between;
            align-items: center;

            color: #70706F;

        }

        .my-card-content > div {
            display: flex;
            flex-direction: row;
            width: 46%;
            padding: 0.04rem 0 0.04rem 0;
        }

        .my-card-content-label {
            width: 0.5rem;
        }

        .my-header {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 0.4rem;
        }

        .my-navbar {
            position: fixed;
            top: 0.4rem;
            left: 0;
            width: 100%;
            height: 0.46rem;
        }
    </style>
    <title>整理</title>
</head>
<body>
<div id="app">
    <div class="my-header">
        <mt-header title="整理" :style="{height:'0.4rem'}">
            <router-link to="/" slot="left">
                <mt-button icon="back" onclick="javascript :history.back(-1)">返回</mt-button>
            </router-link>
        </mt-header>
    </div>
    <div class="my-navbar">
        <mt-navbar v-model="selected" :style="{height:'0.46rem'}">
            <mt-tab-item id="UnArrange">待整理</mt-tab-item>
            <mt-tab-item id="Arrange">已整理</mt-tab-item>
            <mt-tab-item id="afterArrange">后工序</mt-tab-item>
        </mt-navbar>
    </div>
    <mt-tab-container v-model="selected"
                      :style="{position:'fixed',top:'0.88rem',bottom:'0.02rem',width:'100%',overflow:'scroll'}">
        <mt-tab-container-item id="UnArrange">
            <!-- 指令即可使用无限滚动滚动该元素，
            当其底部与被滚动元素底部的距离小于给定的阈值（通过 infinite-scroll-distance 设置）时，
            绑定到 v-infinite-scroll 指令的方法就会被触发。
            infinite-scroll-disabled为真则无限滚动不会被触发
             -->
            <div
                    v-infinite-scroll="loadMore"
                    infinite-scroll-disabled="loading"
                    infinite-scroll-distance="5"
                    infinite-scroll-immediate-check=false
            >
                <div v-for=" (pro,index) in list">
                    <div class="my-card">
                        <div class="my-card-title">
                            <div>组号 {{ pro.processId }}</div>
                            <div>待整理</div>
                        </div>

                        <div class="my-card-content">
                            <div>
                                <div class="my-card-content-label">客户</div>
                                <div>{{ pro.processCus }}</div>
                            </div>
                            <div>
                                <div class="my-card-content-label">规格</div>
                                <div>{{ pro.processStd }}</div>
                            </div>
                            <div>
                                <div class="my-card-content-label">花色号</div>
                                <div>{{ pro.processColor }}</div>
                            </div>

                            <div v-if="pro.groupNum!=null">
                                <div class="my-card-content-label">投坯</div>
                                <div>{{ pro.groupNum }}</div>
                            </div>
                            <div v-if="pro.pretreatNum!=null">
                                <div class="my-card-content-label">前处理</div>
                                <div>{{ pro.pretreatNum }}</div>
                            </div>
                            <div v-if="pro.dyeNum!=null">
                                <div class="my-card-content-label">染色</div>
                                <div>{{ pro.dyeNum }}</div>
                            </div>
                            <div v-if="pro.printNum!=null">
                                <div class="my-card-content-label">印花</div>
                                <div>{{ pro.printNum }}</div>
                            </div>

                        </div>

                        <div class="my-card-opr">
                            <mt-button type="danger" size="small" @click.prevent="completeArr(pro.processId,index)">
                                完成处理
                            </mt-button>
                        </div>
                    </div>
                </div>
            </div>
        </mt-tab-container-item>

        <%--前处理完成--%>
        <mt-tab-container-item id="Arrange">
            <!-- 指令即可使用无限滚动滚动该元素，
            当其底部与被滚动元素底部的距离小于给定的阈值（通过 infinite-scroll-distance 设置）时，
            绑定到 v-infinite-scroll 指令的方法就会被触发。
            infinite-scroll-disabled为真则无限滚动不会被触发
             -->
            <div
                    v-infinite-scroll="loadMore"
                    infinite-scroll-disabled="loading2"
                    infinite-scroll-distance="5"
                    infinite-scroll-immediate-check=false
            >
                <div v-for=" (pro,index) in list2">
                    <div class="my-card">
                        <div class="my-card-title">
                            <div>组号 {{ pro.processId }}</div>
                            <div>已整理</div>
                        </div>

                        <div class="my-card-content">
                            <div>
                                <div class="my-card-content-label">客户</div>
                                <div>{{ pro.processCus }}</div>
                            </div>
                            <div>
                                <div class="my-card-content-label">规格</div>
                                <div>{{ pro.processStd }}</div>
                            </div>
                            <div>
                                <div class="my-card-content-label">花色号</div>
                                <div>{{ pro.processColor }}</div>
                            </div>
                            <div v-if="pro.groupNum!=null">
                                <div class="my-card-content-label">投坯</div>
                                <div>{{ pro.groupNum }}</div>
                            </div>
                            <div v-if="pro.pretreatNum!=null">
                                <div class="my-card-content-label">前处理</div>
                                <div>{{ pro.pretreatNum }}</div>
                            </div>
                            <div v-if="pro.dyeNum!=null">
                                <div class="my-card-content-label">染色</div>
                                <div>{{ pro.dyeNum }}</div>
                            </div>
                            <div v-if="pro.printNum!=null">
                                <div class="my-card-content-label">印花</div>
                                <div>{{ pro.printNum }}</div>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </mt-tab-container-item>

        <%--后工序--%>
        <mt-tab-container-item id="afterArrange">
            <!-- 指令即可使用无限滚动滚动该元素，
            当其底部与被滚动元素底部的距离小于给定的阈值（通过 infinite-scroll-distance 设置）时，
            绑定到 v-infinite-scroll 指令的方法就会被触发。
            infinite-scroll-disabled为真则无限滚动不会被触发
             -->
            <div
                    v-infinite-scroll="loadMore"
                    infinite-scroll-disabled="loading3"
                    infinite-scroll-distance="5"
                    infinite-scroll-immediate-check=false
            >
                <div v-for=" (pro,index) in list3">
                    <div class="my-card">
                        <div class="my-card-title">
                            <div>组号 {{ pro.processId }}</div>
                        </div>

                        <div class="my-card-content">
                            <div>
                                <div class="my-card-content-label">客户</div>
                                <div>{{ pro.processCus }}</div>
                            </div>
                            <div>
                                <div class="my-card-content-label">规格</div>
                                <div>{{ pro.processStd }}</div>
                            </div>
                            <div>
                                <div class="my-card-content-label">花色号</div>
                                <div>{{ pro.processColor }}</div>
                            </div>
                            <div v-if="pro.groupNum!=null">
                                <div class="my-card-content-label">投坯</div>
                                <div>{{ pro.groupNum }}</div>
                            </div>
                            <div v-if="pro.pretreatNum!=null">
                                <div class="my-card-content-label">前处理</div>
                                <div>{{ pro.pretreatNum }}</div>
                            </div>
                            <div v-if="pro.dyeNum!=null">
                                <div class="my-card-content-label">染色</div>
                                <div>{{ pro.dyeNum }}</div>
                            </div>
                            <div v-if="pro.printNum!=null">
                                <div class="my-card-content-label">印花</div>
                                <div>{{ pro.printNum }}</div>
                            </div>
                        </div>

                        <div class="my-card-opr">
                            <div>
                                <div class="my-card-content-label">状态</div>
                                <div>{{ pro.processStatus }}</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </mt-tab-container-item>
    </mt-tab-container>
</div>
<script type="text/javascript" src="../static/js/vue-2.5.16.min.js"></script>
<script type="text/javascript" src="../static/js/axios.min.js"></script>
<script type="text/javascript" src="../static/mint-ui/index.js"></script>
<script type="text/javascript">
    new Vue({
        el: '#app',
        data: {
            selected: 'UnArrange',
            UnArrangePage: {},
            ArrangePage: {},
            afterArrangePage: {},
            arrPretreatment: [],
            loading: false,
            loading2: false,
            loading3: false,
            list: [],
            list2: [],
            list3: [],
            urls: 'UnArrange',
            processStatus: '05'
        },
        methods: {
            loadMore: function () {
                if (this.urls == "UnArrange") {
                    this.loadUndyedData(this.UnArrangePage.nextPage, this.urls, this.processStatus, 5);
                }
                if (this.urls == "Arrange") {
                    this.loadUndyedData(this.ArrangePage.nextPage, this.urls, this.processStatus, 5);
                }
                if (this.urls == "afterArrange") {
                    this.loadUndyedData(this.afterArrangePage.nextPage, this.urls, this.processStatus, 5);
                }

            },
            loadUndyedData(pgNo, url, aprocessStatus, alimit) {//加载指定页码数据
                let vm = this;
                vm.loading = true;
                vm.loading2 = true;
                vm.loading3 = true;
                axios.get(url, {
                    params: {
                        processStatus: aprocessStatus,
                        page: pgNo,
                        limit: alimit
                    }
                })
                    .then(function (response) {
                        if (vm.urls == "UnArrange") {
                            console.log("aaaaa");
                            vm.UnArrangePage = response.data;
                            if (vm.UnArrangePage.hasNextPage) {
                                vm.loading = false;
                            }
                            vm.arrPretreatment = response.data.list;
                            for (let i = 0; i < vm.arrPretreatment.length; i++) {
                                vm.list.push(vm.arrPretreatment[i]);
                            }
                            console.log(vm.list);
                        }
                        if (vm.urls == "Arrange") {
                            vm.ArrangePage = response.data;
                            if (vm.ArrangePage.hasNextPage) {
                                vm.loading2 = false;
                            }
                            vm.arrPretreatment = response.data.list;
                            for (let i = 0; i < vm.arrPretreatment.length; i++) {
                                vm.list2.push(vm.arrPretreatment[i]);
                            }
                        }
                        if (vm.urls == "afterArrange") {
                            vm.afterArrangePage = response.data;
                            if (vm.afterArrangePage.hasNextPage) {
                                vm.loading3 = false;
                            }
                            vm.arrPretreatment = response.data.list;
                            for (let i = 0; i < vm.arrPretreatment.length; i++) {
                                vm.list3.push(vm.arrPretreatment[i]);
                            }
                        }
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            completeArr: function (processId, index) {
                let vm = this;
                this.$messagebox.prompt("请输入整理的长度", "整理").then
                (({value, action}) = > {
                    if(value == null || value == ''
            )
                {
                    vm.$toast({
                        message: "数据不能为空",
                        position: 'bottom',
                        duration: 5000
                    });

                }
            else
                if (value.match(/^[0-9]+(.[0-9]{1})?$/) == null) {
                    vm.$toast({
                        message: "请输入合法的数字",
                        position: 'bottom',
                        duration: 5000
                    });
                } else {
                    axios.put('completeArrange', {
                        processId: processId,
                        processStatus: '25',
                        arrangeNum: value
                    })
                        .then(function (response) {
                            let result = response.data;
                            if (result.success) {
                                vm.$toast({
                                    message: result.message,
                                    position: 'bottom',
                                    duration: 5000
                                });
                                vm.list.splice(index, 1);

                            } else {
                                vm.$toast({
                                    message: response.message,
                                    position: 'bottom',
                                    duration: 5000
                                });
                            }
                        })
                        .catch(function (error) {
                            console.log(error);
                        });


                }
            })
                ;
            }


        },
        mounted: function () {
            console.log("aaaa");
            this.loadUndyedData(1, this.urls, this.processStatus, 5);//加载待染色第一页数据
        },
        watch: {
            selected: function (currSel) {
                if (currSel == 'UnArrange') {
                    this.UnArrangePage = 0;
                    this.list.length = 0;
                    this.urls = "UnArrange";
                    this.loadUndyedData(1, this.urls, this.processStatus, 5);
                }
                if (currSel == 'Arrange') {
                    this.ArrangePage = 0;
                    this.list2.length = 0;
                    this.urls = "Arrange";
                    this.processStatus = "25";
                    this.loadUndyedData(1, this.urls, this.processStatus, 5);
                }
                if (currSel == 'afterArrange') {
                    this.afterArrangePage = 0;
                    this.list3.length = 0;
                    this.urls = "afterArrange";
                    this.processStatus = "aa";
                    this.loadUndyedData(1, this.urls, this.processStatus, 5);
                }
            }
        }
    })

</script>


</body>
</html>
