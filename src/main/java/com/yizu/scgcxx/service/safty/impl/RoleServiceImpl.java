package com.yizu.scgcxx.service.safty.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yizu.scgcxx.dao.safty.RoleDao;
import com.yizu.scgcxx.dto.MenuDto;
import com.yizu.scgcxx.dto.RoleDto;
import com.yizu.scgcxx.model.Module;
import com.yizu.scgcxx.model.Role;
import com.yizu.scgcxx.service.safty.RoleService;

@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleDao roleDao;

    @Override
    public List<Role> getRole(RoleDto roleDto) {
        return roleDao.getRole(roleDto);
    }

    @Override
    public int deleteById(Integer roId) {
        // TODO Auto-generated method stub
        return roleDao.deleteById(roId);
    }

    @Override
    public int updateById(Integer roId, String roStatus) {
        // TODO Auto-generated method stub
        return roleDao.updateById(roId, roStatus);
    }

    @Override
    public int addRole(Role role) {
        // TODO Auto-generated method stub
        return roleDao.addRole(role);
    }

    @Override
    public Role queryById(Integer roId) {
        return roleDao.queryById(roId);
    }

    @Override
    public int updataRole(Role role) {
        // TODO Auto-generated method stub
        return roleDao.updataRole(role);
    }

    @Override
    public int deleteByIds(Integer[] roids) {
        return roleDao.deleteByIds(roids);
    }

    @Override
    public int updateByIds(Integer[] roIds, String roStatus) {
        // TODO Auto-generated method stub
        return roleDao.updateByIds(roIds, roStatus);
    }

    @Override
    public List<MenuDto> getRoleModules(Integer roId) {
        List<MenuDto> tree = new ArrayList<MenuDto>();
        List<Module> lists = roleDao.getRoleModules(roId);
        MenuDto mainMenu = null;
        for (Module module : lists) {
            if (mainMenu == null || !mainMenu.getMenuId().equals(module.getpId())) {
                mainMenu = new MenuDto();
                mainMenu.setMenuId(module.getpId());
                mainMenu.setMenuName(module.getpName());
                mainMenu.setSubMenuList(new ArrayList<MenuDto>());
                tree.add(mainMenu);
            }
            MenuDto chMenu = new MenuDto();
            chMenu.setMenuId(module.getmId());
            chMenu.setMenuName(module.getmName());
            chMenu.setChecked(module.getRoId() != null);
            mainMenu.getSubMenuList().add(chMenu);
        }
        return tree;
    }

    @Override
    public void setRoleModules(Integer[] mIds, Integer roId) {
        roleDao.deleteModuleById(roId);
        roleDao.insertRoleModules(roId, mIds);

    }
}
