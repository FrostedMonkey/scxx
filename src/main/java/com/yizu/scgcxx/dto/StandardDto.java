package com.yizu.scgcxx.dto;

public class StandardDto {
    private Integer standardId;

    private String standardName;

    private String standardRemark;

    private String standardStatus;

    private int limit;

    private int page;

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
        this.standardName = standardName;
    }

    public String getStandardRemark() {
        return standardRemark;
    }

    public void setStandardRemark(String standardRemark) {
        this.standardRemark = standardRemark;
    }

    public String getStandardStatus() {
        return standardStatus;
    }

    public void setStandardStatus(String standardStatus) {
        this.standardStatus = standardStatus;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    @Override
    public String toString() {
        return "StandardDto [standardId=" + standardId + ", standardName=" + standardName + ", standardRemark="
                + standardRemark + ", standardStatus=" + standardStatus + ", limit=" + limit + ", page=" + page + "]";
    }


}
