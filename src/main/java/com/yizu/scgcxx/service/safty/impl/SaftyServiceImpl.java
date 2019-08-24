package com.yizu.scgcxx.service.safty.impl;

import com.yizu.scgcxx.dao.safty.UserDao;
import com.yizu.scgcxx.model.Module;
import com.yizu.scgcxx.model.Role;
import com.yizu.scgcxx.model.User;
import com.yizu.scgcxx.service.safty.SaftyService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class SaftyServiceImpl implements SaftyService {

    @Resource
    private UserDao userDao;


    @Override //@Cacheable
    public User getUser(String userId) {
        // TODO Auto-generated method stub
        return userDao.findUserById(userId);
    }

    @Override
    public List<Role> getRolesOfUser(String userId) {

        return userDao.findRolesOfUser(userId);
    }

    @Override
    public List<Module> getModulesOfUser(String userId) {
        // TODO Auto-generated method stub
        return userDao.findModulesOfUser(userId);
    }

    @Override
    public List<Module> getAllSubModules() {
        // TODO Auto-generated method stub
        return userDao.findAllSubModules();
    }


}
