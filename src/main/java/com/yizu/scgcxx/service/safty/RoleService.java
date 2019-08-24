package com.yizu.scgcxx.service.safty;

import java.util.List;

import com.yizu.scgcxx.dto.MenuDto;
import com.yizu.scgcxx.dto.RoleDto;
import com.yizu.scgcxx.model.Role;

public interface RoleService {

    List<Role> getRole(RoleDto roleDto);

    int deleteById(Integer roId);

    int updateById(Integer roId, String roStatus);

    int addRole(Role role);

    Role queryById(Integer roId);

    int updataRole(Role role);

    int deleteByIds(Integer[] roids);

    int updateByIds(Integer[] roIds, String roStatus);

    List<MenuDto> getRoleModules(Integer roId);

    void setRoleModules(Integer[] mIds, Integer roId);

}
