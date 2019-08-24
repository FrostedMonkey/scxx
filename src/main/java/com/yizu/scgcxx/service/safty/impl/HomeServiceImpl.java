package com.yizu.scgcxx.service.safty.impl;

import java.awt.Menu;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yizu.scgcxx.dao.safty.HomeDao;
import com.yizu.scgcxx.dto.MenuDto;
import com.yizu.scgcxx.model.Module;
import com.yizu.scgcxx.service.safty.HomeService;

@Service
public class HomeServiceImpl implements HomeService {

    @Autowired
    HomeDao homeDao;

    @Override
    public List<MenuDto> getMenus(String Uid) {
        List<Module> lists = homeDao.findMenus(Uid);
        // 主菜单
        List<MenuDto> mainMenuList = new ArrayList<MenuDto>();
        // 当前页的菜单
        MenuDto currMainMenu = null;

        for (Module module : lists) {
            if (currMainMenu == null || !module.getpId().equals(currMainMenu.getMenuId())) {
                currMainMenu = new MenuDto();
                currMainMenu.setMenuId(module.getpId());
                currMainMenu.setMenuName(module.getpName());
                currMainMenu.setSubMenuList(new ArrayList<MenuDto>());
                mainMenuList.add(currMainMenu);
            }
            MenuDto subMenu = new MenuDto();
            subMenu.setMenuId(module.getmId());
            subMenu.setMenuName(module.getmName());
            subMenu.setMenuUrl(module.getmUrl());
            currMainMenu.getSubMenuList().add(subMenu);

        }
        return mainMenuList;
    }

    @Override
    public List<Module> getMobileMenus() {
        // TODO Auto-generated method stub
        return homeDao.getMobileMenus();
    }

}
