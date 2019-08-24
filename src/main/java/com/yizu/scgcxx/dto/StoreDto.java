package com.yizu.scgcxx.dto;

import java.math.BigDecimal;

public class StoreDto {
    private int page;
    private int limit;
    private String storeStatus;
    public String storePer;
    private int storeId;
    private BigDecimal storeNum;
    private Integer productId;

    private Integer processId;

    private String productCus;

    private String productStd;

    private String processColor;

    private String productLevel;

    private BigDecimal productNum;

    private String productStatus;

    private BigDecimal productResidue;


    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public BigDecimal getStoreNum() {
        return storeNum;
    }

    public void setStoreNum(BigDecimal storeNum) {
        this.storeNum = storeNum;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Integer getProcessId() {
        return processId;
    }

    public void setProcessId(Integer processId) {
        this.processId = processId;
    }

    public String getProductCus() {
        return productCus;
    }

    public void setProductCus(String productCus) {
        this.productCus = productCus;
    }

    public String getProductStd() {
        return productStd;
    }

    public void setProductStd(String productStd) {
        this.productStd = productStd;
    }

    public String getProcessColor() {
        return processColor;
    }

    public void setProcessColor(String processColor) {
        this.processColor = processColor;
    }

    public String getProductLevel() {
        return productLevel;
    }

    public void setProductLevel(String productLevel) {
        this.productLevel = productLevel;
    }

    public BigDecimal getProductNum() {
        return productNum;
    }

    public void setProductNum(BigDecimal productNum) {
        this.productNum = productNum;
    }

    public String getProductStatus() {
        return productStatus;
    }

    public void setProductStatus(String productStatus) {
        this.productStatus = productStatus;
    }

    public BigDecimal getProductResidue() {
        return productResidue;
    }

    public void setProductResidue(BigDecimal productResidue) {
        this.productResidue = productResidue;
    }

    public String getStoreStatus() {
        return storeStatus;
    }

    public void setStoreStatus(String storeStatus) {
        this.storeStatus = storeStatus;
    }

    public String getStorePer() {
        return storePer;
    }

    public void setStorePer(String storePer) {
        this.storePer = storePer;
    }

    public int getStoreId() {
        return storeId;
    }

    public void setStoreId(int storeId) {
        this.storeId = storeId;
    }
}
