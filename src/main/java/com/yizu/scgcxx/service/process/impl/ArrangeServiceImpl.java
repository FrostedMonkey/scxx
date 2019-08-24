package com.yizu.scgcxx.service.process.impl;

import com.yizu.scgcxx.commons.BusinessStatus;
import com.yizu.scgcxx.dao.process.ArrangeDao;
import com.yizu.scgcxx.dto.ProcessDto;
import com.yizu.scgcxx.model.Process;
import com.yizu.scgcxx.service.process.ArrangeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ArrangeServiceImpl implements ArrangeService {

    @Autowired
    private ArrangeDao arrangeDao;

    @Override
    public List<Process> getUnArrange(ProcessDto processDto) {
        return arrangeDao.getUnArrange(processDto);
    }

    @Override
    public List<Process> getArrange(ProcessDto processDto) {
        return arrangeDao.getArrange(processDto);
    }

    @Override
    public int completeArrange(Process process) {
        return arrangeDao.completeArrange(process);
    }

    @Override
    public List<Process> getAll(ProcessDto processDto) {

        List<Process> list = arrangeDao.getAll(processDto);
        for (Process pro : list) {
            pro.setProcessStatus(BusinessStatus.getName(pro.getProcessStatus()));
        }
        return list;
    }
}
