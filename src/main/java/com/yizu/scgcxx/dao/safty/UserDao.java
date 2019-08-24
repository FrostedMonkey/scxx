package com.yizu.scgcxx.dao.safty;

import java.util.List;

import com.yizu.scgcxx.model.Module;
import org.apache.ibatis.annotations.Param;

import com.yizu.scgcxx.dto.UserDto;
import com.yizu.scgcxx.model.Customer;
import com.yizu.scgcxx.model.Role;
import com.yizu.scgcxx.model.User;
import org.apache.ibatis.annotations.Select;

public interface UserDao {

    List<User> getUsers(UserDto userDto);

    int addUser(User user);

    int updateById(User user);

    int updateUserStatusById(UserDto userDto);

    void updateUserStatusByIds(@Param("uIds") String[] uIds, @Param("uStatus") String uStatus);

    List<Role> getRoles(String uId);

    int updUserPwd(@Param("uId") String uId, @Param("newPwd") String newPwd);

    @Select("select * from sys_user where u_id=#{u_id}")
    User findUserById(String u_id);

    @Select("select r.ro_id,r.ro_name,r.ro_remark,r.ro_status from sys_role r join sys_ur ur on r.ro_id=ur.ro_id where r.ro_status='55' and ur.u_id=#{userId}")
    public List<Role> findRolesOfUser(String userId);

    public List<Module> findModulesOfUser(String userId);

    @Select("select * from sys_module where m_status='55' and m_ismenu=1 and m_pid is not null")
    public List<Module> findAllSubModules();

}
