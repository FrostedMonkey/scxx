package com.yizu.scgcxx.model;

import java.math.BigDecimal;

public class Product {
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

    public Integer getProductId() {
        return productId;
    }

    public Integer getProcessId() {
        return processId;
    }

    public void setProcessId(Integer processId) {
        this.processId = processId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getProductCus() {
        return productCus;
    }

    public void setProductCus(String productCus) {
        this.productCus = productCus == null ? null : productCus.trim();
    }

    public String getProductStd() {
        return productStd;
    }

    public void setProductStd(String productStd) {
        this.productStd = productStd == null ? null : productStd.trim();
    }

    public String getProcessColor() {
        return processColor;
    }

    public void setProcessColor(String processColor) {
        this.processColor = processColor == null ? null : processColor.trim();
    }

    public String getProductLevel() {
        return productLevel;
    }

    public void setProductLevel(String productLevel) {
        this.productLevel = productLevel == null ? null : productLevel.trim();
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
        this.productStatus = productStatus == null ? null : productStatus.trim();
    }

    public BigDecimal getProductResidue() {
        return productResidue;
    }

    public void setProductResidue(BigDecimal productResidue) {
        this.productResidue = productResidue;
    }

    public BigDecimal getStoreNum() {
        return storeNum;
    }

    public void setStoreNum(BigDecimal storeNum) {
        this.storeNum = storeNum;
    }

    @Override
    public String toString() {
        return "Product{" +
                "storeNum=" + storeNum +
                ", productId=" + productId +
                ", processId=" + processId +
                ", productCus='" + productCus + '\'' +
                ", productStd='" + productStd + '\'' +
                ", processColor='" + processColor + '\'' +
                ", productLevel='" + productLevel + '\'' +
                ", productNum=" + productNum +
                ", productStatus='" + productStatus + '\'' +
                ", productResidue=" + productResidue +
                '}';
    }
}