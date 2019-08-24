package com.yizu.scgcxx.commons;

/**
 * 状态枚举
 *
 * @author Administrator
 */
public enum DataStatus {

    /**
     * 未确定
     */
    Unconfirmed("00", "未确定"),

    /**
     * 确定
     */
    Confirmed("22", "确定"),
    /**
     * 启用
     */
    InUse("55", "启用"),
    /**
     * 禁用
     */
    Unused("77", "禁用"),
    /**
     * 逻辑删除
     */
    LogicallyDeleted("99", "逻辑删除");


    // 成员变量
    private String code;
    private String name;

    // 构造方法
    private DataStatus(String code, String name) {
        this.code = code;
        this.name = name;
    }

    public static String getName(String code) {
        for (DataStatus status : DataStatus.values()) {
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
