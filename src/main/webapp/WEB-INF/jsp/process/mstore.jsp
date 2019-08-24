<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>入库</title>
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
        <mt-header title="商品入库" :style="{height:'0.4rem'}">
            <router-link to="/" slot="left">
                <mt-button icon="back" onclick="javascript :history.back(-1)">返回</mt-button>
            </router-link>
        </mt-header>
    </div>

    <div class="my-navbar">
        <mt-navbar v-model="selected" :style="{height:'0.46rem'}">
            <mt-tab-item id="store-notin">待入库</mt-tab-item>
            <mt-tab-item id="store-in">已入库</mt-tab-item>
            <mt-tab-item id="store-after">后工序</mt-tab-item>
        </mt-navbar>
    </div>

    <mt-tab-container v-model="selected"
                      :style="{position:'fixed',top:'0.88rem',bottom:'0.02rem',width:'100%',overflow:'scroll'}">
        <mt-tab-container-item id="store-notin">

            <div
                    v-infinite-scroll="loadMore"

                    infinite-scroll-disabled="loading"

                    infinite-scroll-distance="10"

                    infinite-scroll-immediate-check=false
            >

                <div v-for=" (store, index) in list">
                    <div class="my-card">
                        <div class="my-card-title">
                            <div>包号 {{ store.storeId }}</div>
                            <div>待入库</div>
                        </div>

                        <div class="my-card-content">
                            <div>
                                <div class="my-card-content-label">产品号</div>
                                <div>{{ store.productId }}</div>
                            </div>
                            <div>
                                <div class="my-card-content-label">客户</div>
                                <div>{{ store.storeCus }}</div>
                            </div>
                            <div>
                                <div class="my-card-content-label">规格</div>
                                <div>{{ store.storeStd }}</div>
                            </div>
                            <div>
                                <div class="my-card-content-label">花色号</div>
                                <div>{{ store.storeColor }}</div>
                            </div>
                            <div>
                                <div class="my-card-content-label">打包数</div>
                                <div>{{ store.storeNum }}</div>
                            </div>
                        </div>

                        <div class="my-card-opr">
                            <mt-button type="danger" size="small"
                                       @click.prevent="cfm(store.productId,store.storeId,index)">完成入库
                            </mt-button>
                        </div>

                    </div>

                </div>
                <div>
                    <!--底部判断是加载图标还是提示“全部加载”-->
                    <div class="more_loading" v-show="!queryLoading">
                        <mt-spinner type="snake" color="#00ccff" :size="28"
                                    v-show="moreLoading&&!allLoaded"></mt-spinner>
                        <span v-show="allLoaded">已加载全部</span>
                    </div>
                </div>

            </div>


        </mt-tab-container-item>

        <mt-tab-container-item id="store-in">


            <div
                    v-infinite-scroll="loadMore"

                    infinite-scroll-disabled="loading2"

                    infinite-scroll-distance="5"

                    infinite-scroll-immediate-check=false
            >

                <div v-for=" store in list2">
                    <div class="my-card">
                        <div class="my-card-title">
                            <div>包号 {{ store.storeId }}</div>
                            <div>已入库</div>
                        </div>

                        <div class="my-card-content">
                            <div>
                                <div class="my-card-content-label">产品号</div>
                                <div>{{ store.productId }}</div>
                            </div>
                            <div>
                                <div class="my-card-content-label">客户</div>
                                <div>{{ store.storeCus }}</div>
                            </div>
                            <div>
                                <div class="my-card-content-label">规格</div>
                                <div>{{ store.storeStd }}</div>
                            </div>
                            <div>
                                <div class="my-card-content-label">花色号</div>
                                <div>{{ store.storeColor }}</div>
                            </div>
                            <div>
                                <div class="my-card-content-label">打包数</div>
                                <div>{{ store.storeNum }}</div>
                            </div>
                        </div>
                    </div>

                </div>
                <div>
                    <!--底部判断是加载图标还是提示“全部加载”-->
                    <div class="more_loading" v-show="!queryLoading">
                        <mt-spinner type="snake" color="#00ccff" :size="28"
                                    v-show="moreLoading&&!allLoaded"></mt-spinner>
                        <span v-show="allLoaded">已加载全部</span>
                    </div>
                </div>

            </div>


        </mt-tab-container-item>

        <mt-tab-container-item id="store-after">
            <div
                    v-infinite-scroll="loadMore"

                    infinite-scroll-disabled="loading3"

                    infinite-scroll-distance="5"

                    infinite-scroll-immediate-check=false
            >

                <div v-for=" store in list3">
                    <div class="my-card">
                        <div class="my-card-title">
                            <div>包号 {{ store.storeId }}</div>
                            <div>后工序</div>
                        </div>

                        <div class="my-card-content">
                            <div>
                                <div class="my-card-content-label">产品号</div>
                                <div>{{ store.productId }}</div>
                            </div>
                            <div>
                                <div class="my-card-content-label">客户</div>
                                <div>{{ store.storeCus }}</div>
                            </div>
                            <div>
                                <div class="my-card-content-label">规格</div>
                                <div>{{ store.storeStd }}</div>
                            </div>
                            <div>
                                <div class="my-card-content-label">花色号</div>
                                <div>{{ store.storeColor }}</div>
                            </div>
                            <div>
                                <div class="my-card-content-label">打包数</div>
                                <div>{{ store.storeNum }}</div>
                            </div>
                            <div>
                                <div class="my-card-content-label">状态</div>
                                <div>{{ store.storeStatus }}</div>
                            </div>
                        </div>
                    </div>

                </div>
                <div>
                    <!--底部判断是加载图标还是提示“全部加载”-->
                    <div class="more_loading" v-show="!queryLoading">
                        <mt-spinner type="snake" color="#00ccff" :size="28"
                                    v-show="moreLoading&&!allLoaded"></mt-spinner>
                        <span v-show="allLoaded">已加载全部</span>
                    </div>
                </div>

            </div>
        </mt-tab-container-item>

    </mt-tab-container>

</div>


<script src="../static/js/vue-2.5.16.min.js"></script>
<script src="../static/js/axios.min.js"></script>
<script src="../static/mint-ui/index.js"></script>
<script type="text/javascript">

    new Vue({

        el: '#app',
        data: {
            selected: 'store-notin',
            undyePage: {},
            undyePage2: {},
            undyePage3: {},
            list: [],
            list2: [],
            list3: [],
            loading: false,
            loading2: false,
            loading3: false,
            queryLoading: false,
            moreLoading: false,
            allLoaded: false
        },
        methods: {
            loadMore() {
                if (this.selected == 'store-notin') {//未入库
                    if (!this.undyePage.hasNextPage) {
                        return;
                    }
                    this.loadStoreData('50', this.undyePage.nextPage, 5, 'store_do');
                }
                if (this.selected == 'store-in') {//已入库
                    if (!this.undyePage2.hasNextPage) {
                        return;
                    }
                    this.loadStoreData('60', this.undyePage2.nextPage, 5, 'store_do');
                }
                if (this.selected == 'store-after') {//后工序
                    if (!this.undyePage3.hasNextPage) {
                        return;
                    }
                    this.loadStoreData('', this.undyePage3.nextPage, 5, 'store_do/' + 1);
                }
            },
            loadStoreData(status, pgNo, limit, url) {//加载指定类型的数据
                let vm = this;
                vm.loading = true;
                vm.loading2 = true;
                vm.loading3 = true;

                axios.get(url, {
                    params: {
                        storeStatus: status,
                        page: pgNo,
                        limit: limit
                    }
                })
                    .then(function (response) {

                        if (vm.selected == "store-in") {
                            vm.undyePage2 = response.data;
                            if (vm.undyePage2.hasNextPage) {
                                vm.loading2 = false;
                            }
                            vm.arrDye = response.data.list;
                            for (let i = 0; i < vm.arrDye.length; i++) {
                                vm.list2.push(vm.arrDye[i]);
                            }
                            console.log(vm.list2);
                        }

                        if (vm.selected == "store-notin") {

                            vm.undyePage = response.data;
                            if (vm.undyePage.hasNextPage) {
                                vm.loading = false;
                            }
                            vm.arrDye = response.data.list;
                            for (let i = 0; i < vm.arrDye.length; i++) {
                                vm.list.push(vm.arrDye[i]);
                            }
                            console.log(vm.list);
                        }

                        if (vm.selected == 'store-after') {
                            vm.undyePage3 = response.data;
                            if (vm.undyePage3.hasNextPage) {
                                vm.loading3 = false;
                            }
                            vm.arrDye = response.data.list;
                            for (let i = 0; i < vm.arrDye.length; i++) {
                                vm.list3.push(vm.arrDye[i]);
                            }
                            console.log(vm.list3);
                        }
                        console.log("loading---" + vm.loading);
                        console.log("loading2---" + vm.loading2);


                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            cfm(productId, storeId, index) {
                let vm = this;
                vm.$messagebox({
                    title: '入库',
                    message: '确定执行入库吗?',
                    showCancelButton: true
                }).then(action = > {
                    console.log(productId, storeId);
                axios.put('store_do', {
                    productId: productId,
                    storeId: storeId
                })
                    .then(function (response) {
                        let result = response.data;
                        console.log(result);
                        if (result.success) {
                            vm.$toast({
                                message: '下达完成',
                                duration: 3000
                            });
                            vm.list.splice(index, 1);
                        } else {
                            vm.$toast({
                                message: '下达失败',
                                position: 'bottom',
                                duration: 3000
                            });
                        }
                    })
                    .catch(function (error) {
                        console.log(error);
                    });

            })
                ;

            }
        },//methods结束

        mounted() {
            //加载未入库的第一页
            this.loadStoreData('50', 1, 5, 'store_do');
        },
        watch: {
            selected(newVal) {

                if (newVal == 'store-in') {//以入库;
                    console.log(this.loading2 + "  " + newVal + "3");

                    if (this.undyePage2.hasNextPage) {
                        this.loading2 = false;
                    }
                    if (this.list2.length == 0) {
                        this.loadStoreData('60', 1, 5, 'store_do');//加载已入库第一页数据
                    }
                }

                if (newVal == 'store-notin') {//未入库

                    if (this.undyePage.hasNextPage) {
                        this.loading = false;
                    }
                }

                if (newVal == 'store-after') {//后工序

                    if (this.undyePage3.hasNextPage) {
                        this.loading3 = false;
                    }
                    if (this.list3.length == 0) {
                        this.loadStoreData('', 1, 5, 'store_do/' + 1);//加载后工序第一页数据
                    }
                }
            }
        }


    });//new Vue 结束


</script>

</body>
</html>