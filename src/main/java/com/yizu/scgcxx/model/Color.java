package com.yizu.scgcxx.model;

public class Color {
    private Integer coId;

    private String coName;

    private String coRemark;

    private String coStatus;

    public Integer getCoId() {
        return coId;
    }

    public void setCoId(Integer coId) {
        this.coId = coId;
    }

    public String getCoName() {
        return coName;
    }

    public void setCoName(String coName) {
        this.coName = coName == null ? null : coName.trim();
    }

    public String getCoRemark() {
        return coRemark;
    }

    public void setCoRemark(String coRemark) {
        this.coRemark = coRemark == null ? null : coRemark.trim();
    }

    public String getCoStatus() {
        return coStatus;
    }

    public void setCoStatus(String coStatus) {
        this.coStatus = coStatus == null ? null : coStatus.trim();
    }
}