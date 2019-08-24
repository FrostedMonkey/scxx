package com.yizu.scgcxx.model;

public class Ur {
    private String uId;

    private Integer roId;

    private User user;

    private Role role;


    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public String getuId() {
        return uId;
    }

    public void setuId(String uId) {
        this.uId = uId == null ? null : uId.trim();
    }

    public Integer getRoId() {
        return roId;
    }

    public void setRoId(Integer roId) {
        this.roId = roId;
    }

    @Override
    public String toString() {
        return "Ur [uId=" + uId + ", roId=" + roId + ", user=" + user + ", role=" + role + "]";
    }


}