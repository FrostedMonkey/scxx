package com.yizu.scgcxx.model;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Plan {
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

    public Plan() {
        super();
        // TODO Auto-generated constructor stub
    }

    public Integer getPlanId() {
        return planId;
    }

    public String getStandardName() {
        return standardName;
    }

    public void setStandardName(String standardName) {
        this.standardName = standardName;
    }

    public String getCusName() {
        return cusName;
    }

    public void setCusName(String cusName) {
        this.cusName = cusName;
    }

    public String getCoName() {
        return coName;
    }

    public void setCoName(String coName) {
        this.coName = coName;
    }

    public void setPlanId(Integer planId) {
        this.planId = planId;
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

    public Integer getCoId() {
        return coId;
    }

    public void setCoId(Integer coId) {
        this.coId = coId;
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
        this.planMonth = planMonth == null ? null : planMonth.trim();
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
        this.planPerson = planPerson == null ? null : planPerson.trim();
    }

    public Integer getPlanStatus() {
        return planStatus;
    }

    public void setPlanStatus(Integer planStatus) {
        this.planStatus = planStatus;
    }
}