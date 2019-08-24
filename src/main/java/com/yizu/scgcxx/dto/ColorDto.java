package com.yizu.scgcxx.dto;

public class ColorDto {
    private Integer coId;

    private String coName;

    private String coRemark;

    private String coStatus;

    private int limit;
    private int page;

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
        this.coName = coName;
    }

    public String getCoRemark() {
        return coRemark;
    }

    public void setCoRemark(String coRemark) {
        this.coRemark = coRemark;
    }

    public String getCoStatus() {
        return coStatus;
    }

    public void setCoStatus(String coStatus) {
        this.coStatus = coStatus;
    }

    @Override
    public String toString() {
        return "ColorDto [coId=" + coId + ", coName=" + coName + ", coRemark=" + coRemark + ", coStatus=" + coStatus
                + ", limit=" + limit + ", page=" + page + "]";
    }

}
