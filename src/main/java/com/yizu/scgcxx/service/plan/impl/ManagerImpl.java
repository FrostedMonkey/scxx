package com.yizu.scgcxx.service.plan.impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yizu.scgcxx.dao.plan.ManagerDao;
import com.yizu.scgcxx.dto.ManagerDto;
import com.yizu.scgcxx.model.Plan;
import com.yizu.scgcxx.service.plan.ManagerService;

@Service
public class ManagerImpl implements ManagerService {
    @Autowired
    private ManagerDao managerDao;

    @Override
    public List<Plan> getMeanger(ManagerDto managerDto) {
        return managerDao.getMeanger(managerDto);
    }

    @Override
    public int addManager(Plan plan) {
        return managerDao.addManager(plan);
    }

    @Override
    public Plan queryById(Integer planId) {
        // TODO Auto-generated method stub
        return managerDao.queryById(planId);
    }

    @Override
    public int updateManagerById(Plan plan) {
        // TODO Auto-generated method stub
        return managerDao.updateManagerById(plan);
    }

    @Override
    public int deleteManagerById(Integer planId) {
        // TODO Auto-generated method stub
        return managerDao.deleteManagerById(planId);
    }

    @Override
    public int updateManager(Plan plan) {
        // TODO Auto-generated method stub
        return managerDao.updateManager(plan);
    }

    @Override
    public int deleteManagerByIds(Integer[] planIds) {
        // TODO Auto-generated method stub
        return managerDao.deleteManagerByIds(planIds);
    }

    @Override
    public int updateByIds(Integer[] planIds, String username) {
        // TODO Auto-generated method stub
        return managerDao.updateByIds(planIds, username);
    }
}
