<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>出库处理</title>
    <link rel="stylesheet" href="../static/mint-ui/style.css">
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
</head>
<body>

<div id="app">
    <div class="my-header">
        <mt-header title="出库" :style="{height:'0.4rem'}">
            <router-link to="/" slot="left">
                <mt-button icon="back" onclick="javascript :history.back(-1)">返回</mt-button>
            </router-link>
        </mt-header>
    </div>
    <div class="my-navbar">
        <mt-navbar v-model="selected" :style="{height:'0.46rem'}">
            <mt-tab-item id="out-unout">待出库</mt-tab-item>
            <mt-tab-item id="out-Allout">已出库</mt-tab-item>
        </mt-navbar>
    </div>
    <mt-tab-container v-model="selected"
                      :style="{position:'fixed',top:'0.88rem',bottom:'0.02rem',width:'100%',overflow:'scroll'}">
        <mt-tab-container-item id="out-unout">
            <!-- 指令即可使用无限滚动滚动该元素，
            当其底部与被滚动元素底部的距离小于给定的阈值（通过 infinite-scroll-distance 设置）时，
            绑定到 v-infinite-scroll 指令的方法就会被触发。
            infinite-scroll-disabled为真则无限滚动不会被触发

             -->
            <div
                    v-infinite-scroll="loadMore"

                    infinite-scroll-disabled="loading"

                    infinite-scroll-distance="10"

                    infinite-scroll-immediate-check=false
            >

                <div v-for=" (sto, index) in list">
                    <div class="my-card">
                        <div class="my-card-title">
                            <div>组号 {{ sto.storeId }}</div>
                            <div>待出库</div>
                        </div>

                        <div class="my-card-content">
                            <div>
                                <div class="my-card-content-label">客户</div>
                                <div>{{ sto.storeCus }}</div>
                                <div style="display: none">{{ sto.processId }}</div>
                            </div>
                            <div>
                                <div class="my-card-content-label">规格</div>
                                <div>{{ sto.storeStd }}</div>
                            </div>
                            <div>
                                <div class="my-card-content-label">花色号</div>
                                <div>{{ sto.storeColor }}</div>
                            </div>
                            <div>
                                <div class="my-card-content-label">入库</div>
                                <div>{{ sto.storeNum }}</div>
                            </div>
                        </div>

                        <div class="my-card-opr">
                            <mt-button type="danger" size="small"
                                       @click.prevent="Enterout(sto.storeId,sto.productId,sto.processId,index)">
                                {{sto.productStatus}}完成出库
                            </mt-button>
                        </div>
                    </div>

                </div>

            </div>
        </mt-tab-container-item>
        <mt-tab-container-item id="out-Allout">


            <div
                    v-infinite-scroll="loadMore"

                    infinite-scroll-disabled="loading2"

                    infinite-scroll-distance="5"

                    infinite-scroll-immediate-check=false
            >

                <div v-for=" (sto, index) in list2">
                    <div class="my-card">
                        <div class="my-card-title">
                            <div>组号 {{ sto.storeId }}</div>
                            <div>已出库</div>
                        </div>

                        <div class="my-card-content">
                            <div>
                                <div class="my-card-content-label">客户</div>
                                <div>{{ sto.storeCus }}</div>
                            </div>
                            <div>
                                <div class="my-card-content-label">规格</div>
                                <div>{{ sto.storeStd }}</div>
                            </div>
                            <div>
                                <div class="my-card-content-label">花色号</div>
                                <div>{{ sto.storeColor }}</div>
                            </div>
                            <div>
                                <div class="my-card-content-label">出库</div>
                                <div>{{ sto.storeNum }}</div>
                            </div>
                            <div>
                                <div class="my-card-content-label">状态</div>
                                <div>{{ sto.storeStatus }}</div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>


        </mt-tab-container-item>
    </mt-tab-container>
</div>
</body>
<script src="../static/js/vue-2.5.16.min.js"></script>
<script src="../static/js/axios.min.js"></script>
<script src="../static/mint-ui/index.js"></script>
<script type="text/javascript">
    new Vue({
        el: '#app',
        data: {
            selected: 'out-unout',
            UnoutPage: {},
            Alloutpage: {},
            list: [],
            list2: [],
            loading: false,
            loading2: false,
            queryLoading: false,
            moreLoading: false,
            arrDye: [],
            urls: 'UnOut',
            productStatus: '60'
        },
        methods: {
            loadUndyedData(pgNo, url, aproductStatus, alimit) {//加载指定页码数据
                console.log("aaa");

                let vm = this;
                vm.loading = true;
                vm.loading2 = true;
                axios.get(url, {
                    params: {
                        productStatus: aproductStatus,
                        page: pgNo,
                        limit: alimit
                    }
                })
                    .then(function (response) {

                        if (vm.urls == "UnOut") {
                            vm.UnoutPage = response.data;
                            if (vm.UnoutPage.hasNextPage) {
                                vm.loading = false;
                            }
                            vm.arrDye = response.data.list;
                            for (let i = 0; i < vm.arrDye.length; i++) {
                                vm.list.push(vm.arrDye[i]);
                            }
                        }
                        if (vm.urls == "Allout") {
                            console.log("aaa");
                            console.log(response.data);
                            vm.Alloutpage = response.data;
                            if (vm.Alloutpage.hasNextPage) {
                                vm.loading2 = false;
                            }
                            console.log("aaa2");
                            vm.arrDye = response.data.list;
                            console.log("aaa3");
                            for (let i = 0; i < vm.arrDye.length; i++) {
                                vm.list2.push(vm.arrDye[i]);
                            }
                        }
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            Enterout: function (storeId, productId, processId, index) {
                let vm = this;
                axios.put("comOut/" + storeId + "/" + productId + "/" + processId
                ).then(function (response) {
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
                }).catch(function (error) {
                    console.log(error);
                });
            },
            loadMore: function () {
                if (this.urls == "UnOut") {
                    this.loadUndyedData(this.UnoutPage.nextPage, this.urls, this.productStatus, 5);
                }
                if (this.urls == "Allout") {
                    this.loadUndyedData(this.Alloutpage.nextPage, this.urls, this.productStatus, 5);
                }

            },//loadmore结束
        },
        mounted: function () {
            this.loadUndyedData(1, this.urls, this.productStatus, 5);//加载待染色第一页数据

        },
        watch: {
            selected: function (currSel) {
                if (currSel == 'out-unout') {//未染色的
                    this.list.length = 0;
                    this.UnoutPage = 0;
                    this.urls = "UnOut";
                    this.productStatus = "60";
                    this.loadUndyedData(1, this.urls, this.productStatus, 5);
                }
                if (currSel == 'out-Allout') {//已经染色的
                    this.list2.length = 0;
                    this.AlloutPage = 0;
                    this.urls = "Allout";
                    this.productStatus = "70";
                    this.loadUndyedData(1, this.urls, this.productStatus, 5);


                }
            }
        }
    });

</script>

</html>
