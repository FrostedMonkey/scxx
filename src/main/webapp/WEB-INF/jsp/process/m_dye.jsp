<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>生产过程云信息系统-主页</title>
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
        <mt-header title="染色处理" :style="{height:'0.4rem'}">
            <router-link to="/" slot="left">
                <mt-button icon="back" onclick="javascript :history.back(-1)">返回</mt-button>
            </router-link>
        </mt-header>
    </div>
    <div class="my-navbar">
        <mt-navbar v-model="selected" :style="{height:'0.46rem'}">
            <mt-tab-item id="dye-undyed">待染色</mt-tab-item>
            <mt-tab-item id="dye-dyed">已染色</mt-tab-item>
            <mt-tab-item id="dye-afterDyed">后工序</mt-tab-item>
        </mt-navbar>
    </div>
    <mt-tab-container v-model="selected"
                      :style="{position:'fixed',top:'0.88rem',bottom:'0.02rem',width:'100%',overflow:'scroll'}">
        <mt-tab-container-item id="dye-undyed">
            <!-- 指令即可使用无限滚动滚动该元素，
            当其底部与被滚动元素底部的距离小于给定的阈值（通过 infinite-scroll-distance 设置）时，
            绑定到 v-infinite-scroll 指令的方法就会被触发。
            infinite-scroll-disabled为真则无限滚动不会被触发

             -->
            <div
                    v-infinite-scroll="loadMore"
                    infinite-scroll-disabled="loading"
                    infinite-scroll-distance="1"
                    infinite-scroll-immediate-check=false
            >
                <div v-for=" (pro,index) in list">
                    <div class="my-card">
                        <div class="my-card-title">
                            <div>组号 {{ pro.processId }}</div>
                            <div>待染色</div>
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
                        </div>

                        <div class="my-card-opr">
                            <mt-button type="danger" size="small"
                                       @click.prevent="completeDye(pro.processId,pro.pretreatNum,index)">完成染色
                            </mt-button>
                        </div>
                    </div>
                </div>
            </div>
        </mt-tab-container-item>
        <mt-tab-container-item id="dye-dyed">
            <div
                    v-infinite-scroll="loadMore"
                    infinite-scroll-disabled="loading2"
                    infinite-scroll-distance="1"
                    infinite-scroll-immediate-check=false
            >
                <div v-for=" pro in list2">
                    <div class="my-card">
                        <div class="my-card-title">
                            <div>组号 {{ pro.processId }}</div>
                            <div>已染色</div>
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
                        </div>
                    </div>
                </div>
            </div>

        </mt-tab-container-item>


        <mt-tab-container-item id="dye-afterDyed">
            <div
                    v-infinite-scroll="loadMore"
                    infinite-scroll-disabled="loading3"
                    infinite-scroll-distance="1"
                    infinite-scroll-immediate-check=false
            >
                <div v-for=" pro in list3">
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
                            <div>
                                <div class="my-card-content-label">状态</div>
                                <div>{{pro.processStatus}}</div>
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
            selected: 'dye-undyed',
            undyePage: {},
            undyePage2: {},
            undyePage3: {},
            arrDye: [],
            loading: false,
            loading2: false,
            loading3: false,
            list: [],
            list2: [],
            list3: [],
            urls: 'm_dye',
            processStatus: '10'

        },

        methods: {
            completeDye(processId, pretreatNum, index) {
                let vm = this;
                this.$messagebox.prompt("请输入染色的长度", "染色").then
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
                } else if (value < pretreatNum * 0.9 || value > pretreatNum * 1.1) {
                    vm.$messagebox.confirm('确定执行此操作?', "数量浮动范围为上下10%").then(action = > {
                        axios.put('completeDye', {
                            processId: processId,
                            processStatus: '15',
                            dyeNum: value
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
                                    //vm.loadUndyedData(1,vm.urls,vm.processStatus,10);//加载待染色第一页数据
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

                })
                    ;


                } else {

                    axios.put('completeDye', {
                        processId: processId,
                        processStatus: '15',
                        dyeNum: value
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
                                //vm.loadUndyedData(1,vm.urls,vm.processStatus,10);//加载待染色第一页数据
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
            },

            loadMore: function () {
                if (this.urls == "m_dye") {
                    this.loadUndyedData(this.undyePage.nextPage, this.urls, this.processStatus, 5);
                }
                if (this.urls == "m_complete_dye") {
                    this.loadUndyedData(this.undyePage2.nextPage, this.urls, this.processStatus, 5);
                }
                if (this.urls == "dye-afterDyed") {
                    this.loadUndyedData(this.undyePage3.nextPage, this.urls, this.processStatus, 5);
                }

            },//loadmore结束
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
                        console.log(response.data);
                        console.log(vm.urls);
                        if (vm.urls == "m_dye") {
                            vm.undyePage = response.data;
                            if (vm.undyePage.hasNextPage) {
                                vm.loading = false;
                            }
                            vm.arrDye = response.data.list;
                            for (let i = 0; i < vm.arrDye.length; i++) {
                                vm.list.push(vm.arrDye[i]);
                            }
                        }
                        if (vm.urls == "m_complete_dye") {
                            vm.undyePage2 = response.data;
                            if (vm.undyePage2.hasNextPage) {
                                vm.loading2 = false;
                            }
                            vm.arrDye = response.data.list;
                            for (let i = 0; i < vm.arrDye.length; i++) {
                                vm.list2.push(vm.arrDye[i]);
                            }
                        }
                        if (vm.urls == "dye-afterDyed") {
                            vm.undyePage3 = response.data;
                            if (vm.undyePage3.hasNextPage) {
                                vm.loading3 = false;
                            }
                            vm.arrDye = response.data.list;
                            for (let i = 0; i < vm.arrDye.length; i++) {
                                vm.list3.push(vm.arrDye[i]);
                            }
                        }
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            }
        },
        mounted: function () {
            this.loadUndyedData(1, this.urls, this.processStatus, 5);//加载待染色第一页数据

        },
        /* 监听 */
        watch: {
            selected: function (currSel) {
                if (currSel == 'dye-undyed') {//未染色的
                    this.list.length = 0;
                    this.undyePage = 0;
                    this.urls = "m_dye";
                    this.processStatus = "10";
                    this.loadUndyedData(1, this.urls, this.processStatus, 5);
                }
                if (currSel == 'dye-dyed') {//已经染色的
                    this.list2.length = 0;
                    this.undyePage2 = 0;
                    this.urls = "m_complete_dye";
                    this.processStatus = "15";
                    this.loadUndyedData(1, this.urls, this.processStatus, 5);


                }
                if (currSel == 'dye-afterDyed') {
                    this.list3.length = 0;
                    this.undyePage3 = 0;
                    this.urls = "dye-afterDyed";
                    this.processStatus = "aa";
                    this.loadUndyedData(1, this.urls, this.processStatus, 5);
                }
            }
        }

    });
</script>
</html>