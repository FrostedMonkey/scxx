package com.yizu.scgcxx.dto;

import java.math.BigDecimal;

public class DyeDto {

    private int page;

    private int limit;

    private BigDecimal dyeNum;

    private String dyeDate;

    private String dyePerson;

    private String processStatus;

    public String status4;

    private int processId;

    private BigDecimal printNum;

    private String printDate;

    private String printPerson;


    public String getStatus4() {
        return status4;
    }

    public void setStatus4(String status4) {
        this.status4 = status4;
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
        this.printDate = printDate;
    }

    public String getPrintPerson() {
        return printPerson;
    }

    public void setPrintPerson(String printPerson) {
        this.printPerson = printPerson;
    }

    public int getProcessId() {
        return processId;
    }

    public void setProcessId(int processId) {
        this.processId = processId;
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
        this.dyeDate = dyeDate;
    }

    public String getDyePerson() {
        return dyePerson;
    }

    public void setDyePerson(String dyePerson) {
        this.dyePerson = dyePerson;
    }

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

    public String getProcessStatus() {
        return processStatus;
    }

    public void setProcessStatus(String processStatus) {
        this.processStatus = processStatus;
    }

}
