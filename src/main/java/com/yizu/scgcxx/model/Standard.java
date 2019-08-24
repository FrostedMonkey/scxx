package com.yizu.scgcxx.model;

public class Standard {
    private Integer standardId;

    private String standardName;

    private String standardRemark;

    private String standardStatus;

    public Integer getStandardId() {
        return standardId;
    }

    public void setStandardId(Integer standardId) {
        this.standardId = standardId;
    }

    public String getStandardName() {
        return standardName;
    }

    public void setStandardName(String standardName) {
        this.standardName = standardName == null ? null : standardName.trim();
    }

    public String getStandardRemark() {
        return standardRemark;
    }

    public void setStandardRemark(String standardRemark) {
        this.standardRemark = standardRemark == null ? null : standardRemark.trim();
    }

    public String getStandardStatus() {
        return standardStatus;
    }

    public void setStandardStatus(String standardStatus) {
        this.standardStatus = standardStatus == null ? null : standardStatus.trim();
    }

    @Override
    public String toString() {
        return "Standard [standardId=" + standardId + ", standardName=" + standardName + ", standardRemark="
                + standardRemark + ", standardStatus=" + standardStatus + "]";
    }

}