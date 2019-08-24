<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>印花处理</title>
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
        <mt-header title="印花处理" :style="{height:'0.4rem'}">
            <router-link to="/" slot="left">
                <mt-button icon="back" onclick="javascript :history.back(-1)">返回</mt-button>
            </router-link>
        </mt-header>
    </div>

    <div class="my-navbar">
        <mt-navbar v-model="selected" :style="{height:'0.46rem'}">
            <mt-tab-item id="print-unprint">待印花</mt-tab-item>
            <mt-tab-item id="print-printed">已印花</mt-tab-item>
            <mt-tab-item id="print-afterprint">后工序</mt-tab-item>
        </mt-navbar>
    </div>

    <mt-tab-container v-model="selected"
                      :style="{position:'fixed',top:'0.88rem',bottom:'0.02rem',width:'100%',overflow:'scroll'}">
        <mt-tab-container-item id="print-unprint">

            <div
                    v-infinite-scroll="loadMore"

                    infinite-scroll-disabled="loading"

                    infinite-scroll-distance="10"

                    infinite-scroll-immediate-check=false
            >

                <div v-for=" (pro, index) in list">
                    <div class="my-card">
                        <div class="my-card-title">
                            <div>组号 {{ pro.processId }}</div>
                            <div>待印花</div>
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
                            <div>
                                <div class="my-card-content-label">投坯</div>
                                <div>{{ pro.groupNum }}</div>
                            </div>
                            <div>
                                <div class="my-card-content-label">前处理</div>
                                <div>{{ pro.pretreatNum }}</div>
                            </div>
                            <div>
                                <div class="my-card-content-label">染色</div>
                                <div>{{ pro.dyeNum }}</div>
                            </div>
                        </div>

                        <div class="my-card-opr">
                            <mt-button type="danger" size="small" @click.prevent="cfm(pro.processId,index)">
                                {{pro.processStatus}}完成印花
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

        <mt-tab-container-item id="print-printed">


            <div
                    v-infinite-scroll="loadMore"

                    infinite-scroll-disabled="loading2"

                    infinite-scroll-distance="5"

                    infinite-scroll-immediate-check=false
            >

                <div v-for=" (pro, index) in list2">
                    <div class="my-card">
                        <div class="my-card-title">
                            <div>组号 {{ pro.processId }}</div>
                            <div>已印花</div>
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
                            <div>
                                <div class="my-card-content-label">投坯</div>
                                <div>{{ pro.groupNum }}</div>
                            </div>
                            <div>
                                <div class="my-card-content-label">前处理</div>
                                <div>{{ pro.pretreatNum }}</div>
                            </div>
                            <div>
                                <div class="my-card-content-label">染色</div>
                                <div>{{ pro.dyeNum }}</div>
                            </div>
                            <div>
                                <div class="my-card-content-label">印花</div>
                                <div>{{ pro.dyeNum }}</div>
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

        <mt-tab-container-item id="print-afterprint">
            <div
                    v-infinite-scroll="loadMore"

                    infinite-scroll-disabled="loading3"

                    infinite-scroll-distance="5"

                    infinite-scroll-immediate-check=false
            >

                <div v-for=" (pro, index) in list3">
                    <div class="my-card">
                        <div class="my-card-title">
                            <div>组号 {{ pro.processId }}</div>
                            <div>后工序</div>
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
                            <div>
                                <div class="my-card-content-label">投坯</div>
                                <div>{{ pro.groupNum }}</div>
                            </div>
                            <div>
                                <div class="my-card-content-label">前处理</div>
                                <div>{{ pro.pretreatNum }}</div>
                            </div>
                            <div>
                                <div class="my-card-content-label">染色</div>
                                <div>{{ pro.dyeNum }}</div>
                            </div>
                            <div>
                                <div class="my-card-content-label">印花</div>
                                <div>{{ pro.dyeNum }}</div>
                            </div>
                            <div>
                                <div class="my-card-content-label">状态</div>
                                <div>{{ pro.processStatus }}</div>
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
            selected: 'print-unprint',
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
        /* print-unprint
          print-printed
          print-afterprint  */
        methods: {
            loadMore() {
                if (this.selected == 'print-unprint') {//未印花
                    console.log("print-unprint---------" + 1);
                    if (!this.undyePage.hasNextPage) {
                        return;
                    }
                    this.loadUndyedData(this.undyePage.nextPage, '15', '5', 'print_do', '10');
                }
                if (this.selected == 'print-printed') {//以印花
                    console.log("print-printed-------" + 1);
                    if (!this.undyePage2.hasNextPage) {
                        return;
                    }
                    this.loadUndyedData(this.undyePage2.nextPage, '20', '5', 'print_do', '20');

                }
                if (this.selected == 'print-afterprint') {//后工序

                    if (!this.undyePage3.hasNextPage) {
                        return;
                    }
                    this.loadUndyedData(this.undyePage3.nextPage, '', '5', 'print_do/{1}');

                }

            },//loadmore结束

            cfm(id, index) {
                let vm = this;
                vm.$messagebox.prompt('请输入印花数量')
                    .then(({value, action}) = > {
                    axios.put('print_do', {
                        printNum: value,
                        processStatus: '20',
                        processId: id,
                    })
                        .then(function (response) {
                            let result = response.data;
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

            },
            loadUndyedData(pgNo, status, limit, url, status4) {//加载指定页码数据
                console.log(2);
                let vm = this;
                vm.loading = true;
                vm.loading2 = true;

                axios.get(url, {
                    params: {
                        processStatus: status,
                        page: pgNo,
                        limit: limit,
                        status4: status4
                    }
                })
                    .then(function (response) {

                        if (vm.selected == "print-printed") {

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

                        if (vm.selected == "print-unprint") {

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
                        if (vm.selected == 'print-afterprint') {
                            vm.undyePage3 = response.data;
                            if (vm.undyePage3.hasNextPage) {
                                vm.loading = false;
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
            }//加载未染色 信息结束

        },//methods 结束

        mounted() {
            this.loadUndyedData(1, '15', '5', 'print_do', '10');//加载待染色第一页数据
        },
        watch: {
            selected(newVal) {

                if (newVal == 'print-printed') {//以印花;
                    console.log(this.loading2 + "  " + newVal + "3");
                    if (this.undyePage2.hasNextPage) {
                        this.loading2 = false;
                    }
                    if (this.list2.length == 0) {
                        this.loadUndyedData(1, '20', '5', 'print_do', '20');//加载已印花第一页数据
                    }
                }

                if (newVal == 'print-unprint') {//未印花
                    console.log(this.loading + "  " + newVal + "3");
                    if (this.undyePage.hasNextPage) {
                        this.loading = false;
                    }
                }
                if (newVal == 'print-afterprint') {//后工序
                    console.log("  " + newVal + "3");
                    if (this.undyePage3.hasNextPage) {
                        this.loading3 = false;
                    }
                    if (this.list3.length == 0) {
                        this.loadUndyedData(1, '', '5', 'print_do/{1}');//加载后工序第一页数据
                    }
                }

            }
        }
        //监听属性的值


    });

</script>
</body>
</html>