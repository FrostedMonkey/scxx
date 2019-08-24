package com.yizu.scgcxx.dto;

public class RoleDto {
    private Integer roId;

    private String roName;

    private String roRemark;

    private String roStatus;


    private boolean checked;

    private int limit;

    private int page;


    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
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
        this.roName = roName;
    }

    public String getRoRemark() {
        return roRemark;
    }

    public void setRoRemark(String roRemark) {
        this.roRemark = roRemark;
    }

    public String getRoStatus() {
        return roStatus;
    }

    public void setRoStatus(String roStatus) {
        this.roStatus = roStatus;
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
        return "RoleDto [roId=" + roId + ", roName=" + roName + ", roRemark=" + roRemark + ", roStatus=" + roStatus
                + ", limit=" + limit + ", page=" + page + "]";
    }

}
