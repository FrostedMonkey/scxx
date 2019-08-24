package com.yizu.scgcxx.dto;

import java.util.List;

public class MenuDto {

    private Integer menuId;

    private String menuName;

    private String menuUrl;

    private List<MenuDto> subMenuList;
    private boolean checked;

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

    public Integer getMenuId() {
        return menuId;
    }

    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public String getMenuUrl() {
        return menuUrl;
    }

    public void setMenuUrl(String menuUrl) {
        this.menuUrl = menuUrl;
    }

    public List<MenuDto> getSubMenuList() {
        return subMenuList;
    }

    public void setSubMenuList(List<MenuDto> subMenuList) {
        this.subMenuList = subMenuList;
    }

}
