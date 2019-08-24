package com.yizu.scgcxx.dao.safty;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.yizu.scgcxx.dto.MenuDto;
import com.yizu.scgcxx.dto.RoleDto;
import com.yizu.scgcxx.model.Module;
import com.yizu.scgcxx.model.Role;

public interface RoleDao {

    List<Role> getRole(RoleDto roleDto);

    int deleteById(Integer roId);

    int updateById(@Param("roId") Integer roId, @Param("roStatus") String roStatus);

    int addRole(Role role);

    @Select("select * from sys_role where ro_id=#{roId}")
    Role queryById(Integer roId);

    int updataRole(Role role);

    int deleteByIds(Integer[] roids);

    int updateByIds(@Param("roIds") Integer[] roIds, @Param("roStatus") String roStatus);

    List<Module> getRoleModules(Integer roId);

    void deleteModuleById(Integer roId);

    void insertRoleModules(@Param("roId") Integer roId, @Param("mIds") Integer[] mIds);

}
