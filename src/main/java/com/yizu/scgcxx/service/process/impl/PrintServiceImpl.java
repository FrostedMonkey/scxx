package com.yizu.scgcxx.service.process.impl;

import java.util.List;

import com.yizu.scgcxx.commons.BusinessStatus;
import com.yizu.scgcxx.service.process.PrintService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yizu.scgcxx.dao.process.PrintDao;
import com.yizu.scgcxx.dto.DyeDto;
import com.yizu.scgcxx.model.Process;

@Service
public class PrintServiceImpl implements PrintService {

    @Autowired
    PrintDao printDao;

    @Override
    public List<Process> getPrint(String status, String status4) {

        return printDao.getPrint(status, status4);
    }

    @Override
    public int updateStstus(DyeDto dyeDto) {

        return printDao.updateStstus(dyeDto);
    }

    @Override
    public List<Process> getPrintHou() {
        List<Process> printHou = printDao.getPrintHou();
        for (Process pro : printHou) {
            if (pro.getProcessStatus().equals("20")) {
                pro.setProcessStatus("以印花待整理");
            } else {
                pro.setProcessStatus(BusinessStatus.getName(pro.getProcessStatus()));
            }

        }
        return printHou;
    }

}
