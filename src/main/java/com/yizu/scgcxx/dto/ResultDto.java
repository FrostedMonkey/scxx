package com.yizu.scgcxx.dto;

import java.util.List;


public class ResultDto {


    public static ResultDto succeedResult() {
        return new ResultDto(true, null, null);
    }

    public static ResultDto succeedResult(String msg) {
        return new ResultDto(true, msg, null);
    }

    public static ResultDto succeedResult(String msg, Object data) {
        return new ResultDto(true, msg, data);
    }

    public static ResultDto failResult() {
        return new ResultDto(false, null, null);
    }

    public static ResultDto failResult(String msg) {
        return new ResultDto(false, msg, null);
    }

    public static ResultDto failResult(String msg, Object data) {
        return new ResultDto(false, msg, data);
    }


    private boolean success;
    private String message;
    private Object data;

    public ResultDto() {
        super();
    }

    private ResultDto(boolean success, String message, Object data) {
        super();
        this.success = success;
        this.message = message;
        this.data = data;
    }


    public boolean isSuccess() {
        return success;
    }

    public String getMessage() {
        return message;
    }

    public Object getData() {
        return data;
    }

    public List<Object> getExtendlist(List<Object> list) {
        return list;
    }
}
