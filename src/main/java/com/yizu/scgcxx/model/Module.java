package com.yizu.scgcxx.model;

public class Module {
    private Integer mId;

    private Integer mPid;

    private String mName;

    private String mUrl;

    private Short mIsmenu;

    private String mStatus;

    private Integer pId;

    private String pName;

    private Integer roId;

    public Integer getRoId() {
        return roId;
    }

    public void setRoId(Integer roId) {
        this.roId = roId;
    }

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public Integer getmId() {
        return mId;
    }

    public void setmId(Integer mId) {
        this.mId = mId;
    }

    public Integer getmPid() {
        return mPid;
    }

    public void setmPid(Integer mPid) {
        this.mPid = mPid;
    }

    public String getmName() {
        return mName;
    }

    public void setmName(String mName) {
        this.mName = mName == null ? null : mName.trim();
    }

    public String getmUrl() {
        return mUrl;
    }

    public void setmUrl(String mUrl) {
        this.mUrl = mUrl == null ? null : mUrl.trim();
    }

    public Short getmIsmenu() {
        return mIsmenu;
    }

    public void setmIsmenu(Short mIsmenu) {
        this.mIsmenu = mIsmenu;
    }

    public String getmStatus() {
        return mStatus;
    }

    public void setmStatus(String mStatus) {
        this.mStatus = mStatus == null ? null : mStatus.trim();
    }
}