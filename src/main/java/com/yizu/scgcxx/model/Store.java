package com.yizu.scgcxx.model;

import java.math.BigDecimal;

public class Store {
    private Integer storeId;

    private Long productId;

    private String storeCus;

    private String storeStd;

    private String storeColor;

    private BigDecimal storeNum;

    private String storeInDate;

    private String storePer;

    private String storeOutDate;

    private String storeOutPer;

    private String storeStatus;
    private Integer processId;


    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public String getStoreCus() {
        return storeCus;
    }

    public void setStoreCus(String storeCus) {
        this.storeCus = storeCus == null ? null : storeCus.trim();
    }

    public String getStoreStd() {
        return storeStd;
    }

    public void setStoreStd(String storeStd) {
        this.storeStd = storeStd == null ? null : storeStd.trim();
    }

    public String getStoreColor() {
        return storeColor;
    }

    public void setStoreColor(String storeColor) {
        this.storeColor = storeColor == null ? null : storeColor.trim();
    }

    public BigDecimal getStoreNum() {
        return storeNum;
    }

    public void setStoreNum(BigDecimal storeNum) {
        this.storeNum = storeNum;
    }

    public String getStoreInDate() {
        return storeInDate;
    }

    public void setStoreInDate(String storeInDate) {
        this.storeInDate = storeInDate == null ? null : storeInDate.trim();
    }

    public String getStorePer() {
        return storePer;
    }

    public void setStorePer(String storePer) {
        this.storePer = storePer == null ? null : storePer.trim();
    }

    public String getStoreOutDate() {
        return storeOutDate;
    }

    public void setStoreOutDate(String storeOutDate) {
        this.storeOutDate = storeOutDate == null ? null : storeOutDate.trim();
    }

    public String getStoreOutPer() {
        return storeOutPer;
    }

    public void setStoreOutPer(String storeOutPer) {
        this.storeOutPer = storeOutPer == null ? null : storeOutPer.trim();
    }

    public String getStoreStatus() {
        return storeStatus;
    }

    public void setStoreStatus(String storeStatus) {
        this.storeStatus = storeStatus == null ? null : storeStatus.trim();
    }

    public Integer getProcessId() {
        return processId;
    }

    public void setProcessId(Integer processId) {
        this.processId = processId;
    }
}