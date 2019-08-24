package com.yizu.scgcxx.model;

import java.io.Serializable;

public class Customer implements Serializable {
    private Integer cusId;

    private String cusName;

    private String cusRemark;

    private String cusStatus;

    public Integer getCusId() {
        return cusId;
    }

    public void setCusId(Integer cusId) {
        this.cusId = cusId;
    }

    public String getCusName() {
        return cusName;
    }

    public void setCusName(String cusName) {
        this.cusName = cusName == null ? null : cusName.trim();
    }

    public String getCusRemark() {
        return cusRemark;
    }

    public void setCusRemark(String cusRemark) {
        this.cusRemark = cusRemark == null ? null : cusRemark.trim();
    }

    public String getCusStatus() {
        return cusStatus;
    }

    public void setCusStatus(String cusStatus) {
        this.cusStatus = cusStatus == null ? null : cusStatus.trim();
    }
}