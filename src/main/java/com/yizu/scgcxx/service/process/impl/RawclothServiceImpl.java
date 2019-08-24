package com.yizu.scgcxx.service.process.impl;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yizu.scgcxx.dao.process.RawclothDao;
import com.yizu.scgcxx.dto.ProcessDto;
import com.yizu.scgcxx.model.Process;
import com.yizu.scgcxx.service.process.RawclothService;

@Service
public class RawclothServiceImpl implements RawclothService {
    @Autowired
    private RawclothDao rawclothDao;

    @Override
    public List<Process> getRawcloth(ProcessDto processDto) {
        return rawclothDao.getRawcloth(processDto);
    }

    @Override
    public List<Process> getTotal() {
        return rawclothDao.getTotal();
    }

    @Override
    public int addProcess(Process process) {
        // TODO Auto-generated method stub
        return rawclothDao.addProcess(process);
    }

    @Override
    public int deleteById(Integer processId) {
        // TODO Auto-generated method stub
        return rawclothDao.deleteById(processId);
    }

    @Override
    public int updateById(Integer processId, String processStatus, String username) {
        // TODO Auto-generated method stub
        return rawclothDao.updateById(processId, processStatus, username);
    }

    @Override
    public Process queryById(Integer processId) {
        // TODO Auto-generated method stub
        return rawclothDao.queryById(processId);
    }

    @Override
    public Process queryResidueById(Integer planId, Integer processId) {
        // TODO Auto-generated method stub
        return rawclothDao.queryResidueById(planId, processId);
    }

    @Override
    public int updateProcess(Process process) {
        // TODO Auto-generated method stub
        return rawclothDao.updateProcess(process);
    }
}
