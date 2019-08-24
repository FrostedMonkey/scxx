package com.yizu.scgcxx.util;

public class LauiData {
    private int code;
    private String msg;
    private int count;
    private Object data;
    private Object pageInfo;


    public static LauiData SETDATA(int code, String msg, int count, Object obj, Object pageInfo) {
        LauiData data = new LauiData();
        data.setCode(code);
        data.setMsg(msg);
        data.setCount(count);
        data.setData(obj);
        data.setPageInfo(pageInfo);
        return data;
    }

    public Object getPageInfo() {
        return pageInfo;
    }

    public void setPageInfo(Object pageInfo) {
        this.pageInfo = pageInfo;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
