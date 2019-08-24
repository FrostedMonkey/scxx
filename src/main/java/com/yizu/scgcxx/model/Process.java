package com.yizu.scgcxx.model;

import java.math.BigDecimal;

import org.springframework.format.annotation.DateTimeFormat;

public class Process {


    private String productLevel;
    private Integer processId;
    private Integer planId;
    private String processCus;
    private String processStd;
    private String processColor;
    private BigDecimal groupNum;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private String groupDate;
    private String groupPerson;
    private BigDecimal pretreatNum;
    private String pretreatDate;
    private String pretreatPerson;
    private BigDecimal dyeNum;
    private String dyeDate;
    private String dyePerson;
    private BigDecimal printNum;
    private String printDate;
    private String printPerson;
    private BigDecimal arrangeNum;
    private String arrangeDate;
    private String arrangePerson;
    private BigDecimal checkNum;
    private String checkDate;
    private String checkPerson;
    private String processStatus;
    private BigDecimal planResidue;//剩余量
    private BigDecimal planNum;//计划量
    private Integer planType;
    private String productStatus;
    private BigDecimal processOne;
    private BigDecimal processTwo;
    private BigDecimal processThree;
    private BigDecimal processFour;
    private BigDecimal planResidue2;//剩余量
    private BigDecimal processTotal;
    private BigDecimal processTotal2;

    private BigDecimal one;

    private BigDecimal two;

    private BigDecimal three;

    private BigDecimal four;

    private BigDecimal total;

    private BigDecimal snum;

    private int productId;


    public BigDecimal getProcessTotal2() {
        return processTotal2;
    }

    public void setProcessTotal2(BigDecimal processTotal2) {
        this.processTotal2 = processTotal2;
    }

    public String getProductLevel() {
        return productLevel;
    }

    public void setProductLevel(String productLevel) {
        this.productLevel = productLevel;
    }

    public BigDecimal getProcessTotal() {
        return processTotal;
    }

    public void setProcessTotal(BigDecimal processTotal) {
        this.processTotal = processTotal;
    }

    public Integer getPlanType() {
        return planType;
    }

    public void setPlanType(Integer planType) {
        this.planType = planType;
    }

    public BigDecimal getPlanResidue() {
        return planResidue;
    }

    public void setPlanResidue(BigDecimal planResidue) {
        this.planResidue = planResidue;
    }

    public BigDecimal getPlanNum() {
        return planNum;
    }

    public void setPlanNum(BigDecimal planNum) {
        this.planNum = planNum;
    }


    public void setProcessId(Integer processId) {
        this.processId = processId;
    }

    public Integer getProcessId() {
        return processId;
    }

    public Integer getPlanId() {
        return planId;
    }

    public void setPlanId(Integer planId) {
        this.planId = planId;
    }

    public String getProcessCus() {
        return processCus;
    }

    public void setProcessCus(String processCus) {
        this.processCus = processCus == null ? null : processCus.trim();
    }

    public String getProcessStd() {
        return processStd;
    }

    public void setProcessStd(String processStd) {
        this.processStd = processStd == null ? null : processStd.trim();
    }

    public String getProcessColor() {
        return processColor;
    }

    public void setProcessColor(String processColor) {
        this.processColor = processColor == null ? null : processColor.trim();
    }

    public BigDecimal getGroupNum() {
        return groupNum;
    }

    public void setGroupNum(BigDecimal groupNum) {
        this.groupNum = groupNum;
    }

    public String getGroupDate() {
        return groupDate;
    }

    public void setGroupDate(String groupDate) {
        this.groupDate = groupDate == null ? null : groupDate.trim();
    }

    public String getGroupPerson() {
        return groupPerson;
    }

    public void setGroupPerson(String groupPerson) {
        this.groupPerson = groupPerson == null ? null : groupPerson.trim();
    }

    public BigDecimal getPretreatNum() {
        return pretreatNum;
    }

    public void setPretreatNum(BigDecimal pretreatNum) {
        this.pretreatNum = pretreatNum;
    }

    public String getPretreatDate() {
        return pretreatDate;
    }

    public void setPretreatDate(String pretreatDate) {
        this.pretreatDate = pretreatDate == null ? null : pretreatDate.trim();
    }

    public String getPretreatPerson() {
        return pretreatPerson;
    }

    public void setPretreatPerson(String pretreatPerson) {
        this.pretreatPerson = pretreatPerson == null ? null : pretreatPerson.trim();
    }

    public BigDecimal getDyeNum() {
        return dyeNum;
    }

    public void setDyeNum(BigDecimal dyeNum) {
        this.dyeNum = dyeNum;
    }

    public String getDyeDate() {
        return dyeDate;
    }

    public void setDyeDate(String dyeDate) {
        this.dyeDate = dyeDate == null ? null : dyeDate.trim();
    }

    public String getDyePerson() {
        return dyePerson;
    }

    public void setDyePerson(String dyePerson) {
        this.dyePerson = dyePerson == null ? null : dyePerson.trim();
    }

    public BigDecimal getPrintNum() {
        return printNum;
    }

    public void setPrintNum(BigDecimal printNum) {
        this.printNum = printNum;
    }

    public String getPrintDate() {
        return printDate;
    }

    public void setPrintDate(String printDate) {
        this.printDate = printDate == null ? null : printDate.trim();
    }

    public String getPrintPerson() {
        return printPerson;
    }

    public void setPrintPerson(String printPerson) {
        this.printPerson = printPerson == null ? null : printPerson.trim();
    }

    public BigDecimal getArrangeNum() {
        return arrangeNum;
    }

    public void setArrangeNum(BigDecimal arrangeNum) {
        this.arrangeNum = arrangeNum;
    }

    public String getArrangeDate() {
        return arrangeDate;
    }

    public void setArrangeDate(String arrangeDate) {
        this.arrangeDate = arrangeDate == null ? null : arrangeDate.trim();
    }

    public String getArrangePerson() {
        return arrangePerson;
    }

    public void setArrangePerson(String arrangePerson) {
        this.arrangePerson = arrangePerson == null ? null : arrangePerson.trim();
    }

    public BigDecimal getCheckNum() {
        return checkNum;
    }

    public void setCheckNum(BigDecimal checkNum) {
        this.checkNum = checkNum;
    }

    public String getCheckDate() {
        return checkDate;
    }

    public void setCheckDate(String checkDate) {
        this.checkDate = checkDate == null ? null : checkDate.trim();
    }

    public String getCheckPerson() {
        return checkPerson;
    }

    public void setCheckPerson(String checkPerson) {
        this.checkPerson = checkPerson == null ? null : checkPerson.trim();
    }

    public String getProcessStatus() {
        return processStatus;
    }

    public void setProcessStatus(String processStatus) {
        this.processStatus = processStatus == null ? null : processStatus.trim();
    }

    public String getProductStatus() {
        return productStatus;
    }

    public void setProductStatus(String productStatus) {
        this.productStatus = productStatus;
    }

    public BigDecimal getProcessOne() {
        return processOne;
    }

    public void setProcessOne(BigDecimal processOne) {
        this.processOne = processOne;
    }

    public BigDecimal getProcessTwo() {
        return processTwo;
    }

    public void setProcessTwo(BigDecimal processTwo) {
        this.processTwo = processTwo;
    }

    public BigDecimal getProcessThree() {
        return processThree;
    }

    public void setProcessThree(BigDecimal processThree) {
        this.processThree = processThree;
    }

    public BigDecimal getProcessFour() {
        return processFour;
    }

    public void setProcessFour(BigDecimal processFour) {
        this.processFour = processFour;
    }

    public BigDecimal getPlanResidue2() {
        return planResidue2;
    }

    public void setPlanResidue2(BigDecimal planResidue2) {
        this.planResidue2 = planResidue2;
    }

    public BigDecimal getOne() {
        return one;
    }

    public void setOne(BigDecimal one) {
        this.one = one;
    }

    public BigDecimal getTwo() {
        return two;
    }

    public void setTwo(BigDecimal two) {
        this.two = two;
    }

    public BigDecimal getThree() {
        return three;
    }

    public void setThree(BigDecimal three) {
        this.three = three;
    }

    public BigDecimal getFour() {
        return four;
    }

    public void setFour(BigDecimal four) {
        this.four = four;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    public BigDecimal getSnum() {
        return snum;
    }

    public void setSnum(BigDecimal snum) {
        this.snum = snum;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }
}