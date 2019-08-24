package com.yizu.scgcxx.service.process.impl;

import com.yizu.scgcxx.commons.BusinessStatus;
import com.yizu.scgcxx.dao.process.PretreatmentDao;
import com.yizu.scgcxx.dto.ProcessDto;
import com.yizu.scgcxx.model.Process;
import com.yizu.scgcxx.service.process.PretreatmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PretreatmentServiceImpl implements PretreatmentService {
    @Autowired
    private PretreatmentDao pretreatmentDao;

    @Override
    public List<Process> getUnPretreatment(ProcessDto processDto) {
        return pretreatmentDao.getUnPretreatment(processDto);
    }

    @Override
    public List<Process> getPretreatment(ProcessDto processDto) {
        return pretreatmentDao.getPretreatment(processDto);
    }

    @Override
    public List<Process> getAll(ProcessDto processDto) {
        List<Process> list = pretreatmentDao.getAll(processDto);
        for (Process p : list) {
            if (p.getPlanType() == 1 && p.getProcessStatus().equals("10")) {//白布前处理完成到整理
                p.setProcessStatus("前处理完成待整理");
            } else if (p.getPlanType() == 2 && p.getProcessStatus().equals("10")) {//色布待染色
                p.setProcessStatus("前处理完成待染色");
            } else if (p.getPlanType() == 2 && p.getProcessStatus().equals("15")) {//色布待整理
                p.setProcessStatus("染色完成待整理");
            } else if (p.getPlanType() == 3 && p.getProcessStatus().equals("10")) {//无底印花
                p.setProcessStatus("前处理完成待印花");
            } else if (p.getPlanType() == 3 && p.getProcessStatus().equals("20")) {//
                p.setProcessStatus("印花完成待整理");
            } else if (p.getPlanType() == 4 && p.getProcessStatus().equals("10")) {
                p.setProcessStatus("前处理完成待染色");
            } else if (p.getPlanType() == 4 && p.getProcessStatus().equals("15")) {
                p.setProcessStatus("染色完成待印花");
            } else if (p.getPlanType() == 4 && p.getProcessStatus().equals("20")) {
                p.setProcessStatus("印花完成待整理");
            } else {
                p.setProcessStatus(BusinessStatus.getName(p.getProcessStatus()));
            }
        }
        return list;
    }

    @Override
    public int completePre(Process process) {
        return pretreatmentDao.completePre(process);
    }
}
