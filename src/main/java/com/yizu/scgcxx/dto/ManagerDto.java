package com.yizu.scgcxx.dto;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ManagerDto {
    private Integer planId;

    private String standardName;

    private Integer standardId;

    private Integer cusId;

    private String cusName;

    private Integer coId;

    private String coName;

    private Integer planXh;

    private String planMonth;

    private BigDecimal planNum;

    private Integer planType;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date planDate;

    private String planPerson;

    private Integer planStatus;
    private int page;
    private int limit;

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

    public Integer getPlanId() {
        return planId;
    }

    public void setPlanId(Integer planId) {
        this.planId = planId;
    }

    public String getStandardName() {
        return standardName;
    }

    public void setStandardName(String standardName) {
        this.standardName = standardName;
    }

    public Integer getStandardId() {
        return standardId;
    }

    public void setStandardId(Integer standardId) {
        this.standardId = standardId;
    }

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
        this.cusName = cusName;
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

    public Integer getPlanXh() {
        return planXh;
    }

    public void setPlanXh(Integer planXh) {
        this.planXh = planXh;
    }

    public String getPlanMonth() {
        return planMonth;
    }

    public void setPlanMonth(String planMonth) {
        this.planMonth = planMonth;
    }

    public BigDecimal getPlanNum() {
        return planNum;
    }

    public void setPlanNum(BigDecimal planNum) {
        this.planNum = planNum;
    }

    public Integer getPlanType() {
        return planType;
    }

    public void setPlanType(Integer planType) {
        this.planType = planType;
    }

    public Date getPlanDate() {
        return planDate;
    }

    public void setPlanDate(Date planDate) {
        this.planDate = planDate;
    }

    public String getPlanPerson() {
        return planPerson;
    }

    public void setPlanPerson(String planPerson) {
        this.planPerson = planPerson;
    }

    public Integer getPlanStatus() {
        return planStatus;
    }

    public void setPlanStatus(Integer planStatus) {
        this.planStatus = planStatus;
    }

    @Override
    public String toString() {
        return "ManagerDto [planId=" + planId + ", standardName=" + standardName + ", standardId=" + standardId
                + ", cusId=" + cusId + ", cusName=" + cusName + ", coId=" + coId + ", coName=" + coName + ", planXh="
                + planXh + ", planMonth=" + planMonth + ", planNum=" + planNum + ", planType=" + planType
                + ", planDate=" + planDate + ", planPerson=" + planPerson + ", planStatus=" + planStatus + "]";
    }

}
