package com.yizu.scgcxx.service.safty.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.aspectj.weaver.ast.And;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yizu.scgcxx.dao.safty.UrDao;
import com.yizu.scgcxx.dao.safty.UserDao;
import com.yizu.scgcxx.dto.RoleDto;
import com.yizu.scgcxx.dto.UserDto;
import com.yizu.scgcxx.model.Role;
import com.yizu.scgcxx.model.User;
import com.yizu.scgcxx.service.safty.UserService;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao userDao;

    @Autowired
    UrDao urDao;

    @Override
    public List<User> getUsers(UserDto userDto) {
        return userDao.getUsers(userDto);
    }

    @Override
    public int addUser(User user) {

        return userDao.addUser(user);
    }

    @Override
    public int updateById(User user) {

        return userDao.updateById(user);
    }

    @Override
    public int updateUserStatusById(UserDto userDto) {

        return userDao.updateUserStatusById(userDto);
    }

    @Override
    public void updateUserStatusByIds(String[] uIds, String uStatus) {
        userDao.updateUserStatusByIds(uIds, uStatus);

    }

    @Override
    public Map<Integer, RoleDto> getRoles(String id) {
        List<Role> roles = userDao.getRoles(id);//从数据库拿到ro_id  ro_name  u_id

        List<RoleDto> roleDtos = new ArrayList<RoleDto>();
        //返回的所需要的数据
        Map<Integer, RoleDto> maps = new TreeMap<Integer, RoleDto>();

        //将数据库拿到的数据便利  放在roleDtos 中
        for (Role role : roles) {
            RoleDto roleDto = new RoleDto();
            roleDto.setRoId(role.getRoId());
            roleDto.setRoName(role.getRoName());
            roleDto.setChecked(role.getuId() != null);
            maps.put(role.getRoId(), roleDto);

            if (role.getuId() != null) {
                roleDtos.add(roleDto);
            }
        }
        for (RoleDto roleDto : roleDtos) {
            maps.put(roleDto.getRoId(), roleDto);
        }
        return maps;
    }

    @Override
    public void AddUr(Integer[] roleIds, String uId) {
        int i = urDao.deleteAllUr(uId);
        int j = urDao.addUr(roleIds, uId);

    }

    @Override
    public int updUserPwd(String getuId, String newPwd) {
        return userDao.updUserPwd(getuId, newPwd);
    }
}
