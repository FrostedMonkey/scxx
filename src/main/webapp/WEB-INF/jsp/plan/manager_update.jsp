<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${plan.planStatus==0 }">
    <div style="padding: 15px;" id="dom-win-manager-update">
        <form class="layui-form" id="form-manager-update" lay-filter="form-manager-update">
            <div class="layui-form-item">
                <label class="layui-form-label">ID</label>
                <div class="layui-input-block">
                    <input type="text" name="planId" required lay-verify="required" autocomplete="off"
                           class="layui-input" value='${plan.planId }' readonly="readonly">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">产品规格</label>
                <div class="layui-input-block">
                    <select name="standardId" lay-filter="standard">
                        <c:forEach items="${standard }" var="sta">
                            <c:if test="${plan.standardId==sta.standardId }">
                                <option selected="selected" value="${sta.standardId }">${sta.standardName }</option>
                            </c:if>
                            <c:if test="${plan.standardId!=sta.standardId }">
                                <option value="${sta.standardId }">${sta.standardName }</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">客户信息</label>
                <div class="layui-input-block">
                    <select name="cusId" id="cusId" lay-filter="customer">
                        <c:forEach items="${customer }" var="cu">
                            <c:if test="${plan.cusId==cu.cusId }">
                                <option selected="selected" value="${cu.cusId }">${cu.cusName }</option>
                            </c:if>
                            <c:if test="${plan.cusId!=cu.cusId }">
                                <option value="${cu.cusId }">${cu.cusName }</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">颜色信息</label>
                <div class="layui-input-block">
                    <select name="coId" id="color" lay-filter="color">
                        <c:forEach items="${color }" var="co">
                            <c:if test="${plan.coId==co.coId}">
                                <option selected="selected" value="${co.coId }">${co.coName }</option>
                            </c:if>
                            <c:if test="${plan.coId!=co.coId}">
                                <option value="${co.coId }">${co.coName }</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">生产编号</label>
                <div class="layui-input-block">
                    <input type="text" name="planXh" required lay-verify="required"
                           autocomplete="off" class="layui-input" value='${plan.planXh }'>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">计划月份</label>
                <div class="layui-input-block">
                    <input type="text" name="planMonth" required lay-verify="required"
                           autocomplete="off" class="layui-input" value='${plan.planMonth }'>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">计划产量</label>
                <div class="layui-input-block">
                    <input type="text" name="planNum" required lay-verify="required"
                           autocomplete="off" class="layui-input" value='${plan.planNum }'>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">产品类型</label>
                <div class="layui-input-block">
                    <select name="planType" lay-filter="Type">
                        <option value="1" ${plan.planType==1?'selected="selected"':'' } >白布产品</option>
                        <option value="2" ${plan.planType==1?'selected="selected"':'' } >染色产品</option>
                        <option value="3" ${plan.planType==1?'selected="selected"':'' } >无底色印花产品</option>
                        <option value="4" ${plan.planType==1?'selected="selected"':'' } >有底色印花产品</option>
                    </select>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">计划下达日期</label>
                <div class="layui-input-block">
                    <input type="date" name="planDate" required lay-verify="required"
                           autocomplete="off" class="layui-input"
                           value="<fmt:formatDate value='${plan.planDate }' pattern='yyyy-MM-dd'/>">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">计划登记人</label>
                <div class="layui-input-block">
                    <input type="text" name="planPerson" required lay-verify="required"
                           autocomplete="off" class="layui-input" value='${plan.planPerson }'>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">计划状态</label>
                <div class="layui-input-block">
                    <input type="text" name="planStatus" required lay-verify="required"
                           autocomplete="off" class="layui-input" value='${plan.planStatus }'>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" id="bn-plan-do-update" style="width:100px;">提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary" style="width:100px;">重置</button>
                </div>
            </div>
        </form>
    </div>
</c:if>
<!-- 详情 -->
<c:if test="${plan.planStatus==1 }">
    <div style="padding: 15px;" id="dom-win-manager-update">
        <form class="layui-form" id="form-manager-update" lay-filter="form-manager-update">
            <div class="layui-form-item">
                <label class="layui-form-label">ID</label>
                <div class="layui-input-block">
                    <input type="text" name="planId" required lay-verify="required" autocomplete="off"
                           class="layui-input" value='${plan.planId }' readonly="readonly">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">产品规格</label>
                <div class="layui-input-block">
                    <input class="layui-input" type="text" value="${plan.standardName }" readonly="readonly">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">客户信息</label>
                <div class="layui-input-block">
                    <input class="layui-input" type="text" value="${plan.cusName }" readonly="readonly">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">颜色信息</label>
                <div class="layui-input-block">
                    <input class="layui-input" type="text" value="${plan.coName }" readonly="readonly">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">生产编号</label>
                <div class="layui-input-block">
                    <input type="text" name="planXh" required lay-verify="required"
                           autocomplete="off" class="layui-input" value='${plan.planXh }' readonly="readonly">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">计划月份</label>
                <div class="layui-input-block">
                    <input type="text" name="planMonth" required lay-verify="required"
                           autocomplete="off" class="layui-input" value='${plan.planMonth }' readonly="readonly">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">计划产量</label>
                <div class="layui-input-block">
                    <input type="text" name="planNum" required lay-verify="required"
                           autocomplete="off" class="layui-input" value='${plan.planNum }' readonly="readonly">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">产品类型</label>
                <div class="layui-input-block">
                    <c:choose>
                        <c:when test="${plan.planType==1}">
                            <input class="layui-input" type="text" value="白布产品" readonly="readonly">
                        </c:when>
                        <c:when test="${plan.planType==2}">
                            <input class="layui-input" type="text" value="染色产品" readonly="readonly">
                        </c:when>
                        <c:when test="${plan.planType==3}">
                            <input class="layui-input" type="text" value="无底色印花产品" readonly="readonly">
                        </c:when>
                        <c:when test="${plan.planType==4}">
                            <input class="layui-input" type="text" value="有底色印花产品" readonly="readonly">
                        </c:when>
                    </c:choose>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">计划下达日期</label>
                <div class="layui-input-block">
                    <input type="date" name="planDate" required lay-verify="required"
                           autocomplete="off" class="layui-input"
                           value="<fmt:formatDate value='${plan.planDate }' pattern='yyyy-MM-dd'/>" readonly="readonly">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">计划登记人</label>
                <div class="layui-input-block">
                    <input type="text" name="planPerson" required lay-verify="required"
                           autocomplete="off" class="layui-input" value='${plan.planPerson }' readonly="readonly">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">计划状态</label>
                <div class="layui-input-block">
                    <input type="text" name="planStatus" required lay-verify="required"
                           autocomplete="off" class="layui-input" value='${plan.planStatus }' readonly="readonly">
                </div>
            </div>
        </form>
    </div>


</c:if>
<script>
    $("#bn-plan-do-update").click(function () {
        var formObject = {};
        var formArray = $("#form-manager-update").serializeArray();
        $.each(formArray, function (i, item) {
            formObject[item.name] = item.value;
        });
        opr.ajax({
            url: 'manager',
            data: JSON.stringify(formObject),
            method: 'put',
            contentType: 'application/json;charset=UTF-8',
            layer: layer,
            layuiTableIns: managertable,
            responseOkHandler: function (result) {
                layer.close(layerIdx2);
                return true;//返回true,继续默认后续行为
            }
        });
        return false;
    });

</script>