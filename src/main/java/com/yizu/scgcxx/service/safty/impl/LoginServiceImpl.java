package com.yizu.scgcxx.service.safty.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yizu.scgcxx.dao.safty.LoginDao;
import com.yizu.scgcxx.model.Ur;
import com.yizu.scgcxx.model.User;
import com.yizu.scgcxx.service.safty.LoginService;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private LoginDao loginDao;

    @Override
    public User getUser(User user) {

        return loginDao.getUser(user);
    }

}
