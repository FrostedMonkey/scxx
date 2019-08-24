package com.yizu.scgcxx.service.safty;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.yizu.scgcxx.dto.RoleDto;
import com.yizu.scgcxx.dto.UserDto;
import com.yizu.scgcxx.model.User;

public interface UserService {

    List<User> getUsers(UserDto userDto);

    int addUser(User user);

    int updateById(User user);

    int updateUserStatusById(UserDto userDto);

    void updateUserStatusByIds(@Param("uIds") String[] uIds, @Param("uStatus") String uStatus);

    Map<Integer, RoleDto> getRoles(String id);

    void AddUr(Integer[] roleIds, String uId);

    int updUserPwd(String getuId, String newPwd);
}
