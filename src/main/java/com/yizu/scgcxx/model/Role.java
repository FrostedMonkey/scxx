package com.yizu.scgcxx.model;

public class Role {
    private Integer roId;


    private String roName;

    private String roRemark;

    private String roStatus;

    private String uId;

    public String getuId() {
        return uId;
    }

    public void setuId(String uId) {
        this.uId = uId;
    }

    public Integer getRoId() {
        return roId;
    }

    public void setRoId(Integer roId) {
        this.roId = roId;
    }

    public String getRoName() {
        return roName;
    }

    public void setRoName(String roName) {
        this.roName = roName == null ? null : roName.trim();
    }

    public String getRoRemark() {
        return roRemark;
    }

    public void setRoRemark(String roRemark) {
        this.roRemark = roRemark == null ? null : roRemark.trim();
    }

    public String getRoStatus() {
        return roStatus;
    }

    public void setRoStatus(String roStatus) {
        this.roStatus = roStatus == null ? null : roStatus.trim();
    }
}