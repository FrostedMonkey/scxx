package com.yizu.scgcxx.service.process.impl;

import java.util.List;

import com.yizu.scgcxx.commons.BusinessStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.yizu.scgcxx.model.Process;
import com.yizu.scgcxx.dao.process.DyeDao;
import com.yizu.scgcxx.dto.ProcessDto;
import com.yizu.scgcxx.service.process.DyeService;

@Service
public class DyeServiceImpl implements DyeService {
    @Autowired
    private DyeDao dyeDao;

    @Override
    public List<Process> getDye(ProcessDto processDto) {
        return dyeDao.getDye(processDto);
    }

    @Override
    public int completeDyeById(Process process) {

        return dyeDao.completeDyeById(process);
    }

    @Override
    public List<Process> getCompleteDye(ProcessDto processDto) {
        System.out.println(processDto);
        return dyeDao.getCompleteDye(processDto);
    }

    @Override
    public List<Process> getAll() {
        List<Process> list = dyeDao.getAll();
        //List<Process> lists=null;
        for (int i = 0; i < list.size(); i++) {
            Process process = list.get(i);
            Integer type = process.getPlanType();
            String status = process.getProcessStatus();
            String st = BusinessStatus.getName(status);
            process.setProcessStatus(st);

        }
        return list;
    }

}
