package com.yizu.scgcxx.commons;

/**
 * 业务状态枚举
 * 00 未投坯
 * 05 已投坯
 * 10 已前处理
 * 15 已染色
 * 20 已印花
 * 25 已整理
 * 30 质检中
 * 35 已质检
 * 40 包装中
 * 50 已包装
 * 55 已部分入库
 * 60 已入库
 * 65 已部分交货
 * 70 已交货
 *
 * @author Administrator
 */
public enum BusinessStatus {

    待质检("25", "待质检"),
    质检中("30", "质检中"),
    已质检("35", "已质检"),
    包装中("40", "包装中"),
    已包装("50", "已包装"),
    已部分入库("55", "已部分入库"),
    已入库("60", "已入库"),
    已部分交货("65", "已部分交货"),
    已交货("70", "已交货"),
    ;
    // 成员变量
    private String code;
    private String name;

    // 构造方法
    private BusinessStatus(String code, String name) {
        this.code = code;
        this.name = name;

    }

    public static String getName(String code) {
        for (BusinessStatus status : BusinessStatus.values()) {
            if (status.code.equals(code)) {
                return status.name;
            }
        }
        return code;
    }


    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
