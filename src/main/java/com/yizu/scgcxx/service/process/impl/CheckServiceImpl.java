package com.yizu.scgcxx.service.process.impl;

import com.yizu.scgcxx.dao.process.CheckDao;
import com.yizu.scgcxx.dto.ProcessDto;
import com.yizu.scgcxx.model.Process;
import com.yizu.scgcxx.model.User;
import com.yizu.scgcxx.service.process.CheckService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

@Service
public class CheckServiceImpl implements CheckService {
    @Autowired
    private CheckDao checkDao;

    @Override
    public List<Process> getAll(ProcessDto processDto) {
        return checkDao.getAll(processDto);
    }

    @Override
    public void addCheck(Process process, BigDecimal nums) {
        BigDecimal[] level = {process.getProcessOne(), process.getProcessTwo(), process.getProcessThree(), process.getProcessFour()};
        //状态问题
        String status = "30";
        if (nums.equals(process.getPlanResidue2())) {
            status = "35";
        }
        Process p = null;
        if (process.getProcessStatus().equals("25")) {//25  传入等级数量为空添加一条空数据 如果不为空添加一条数据
            for (int i = 0; i < level.length; i++) {
                p = new Process();
                p.setProcessId(process.getProcessId());
                p.setProductLevel("0" + (i + 1));
                p.setCheckNum(level[i]);//借用此变量
                p.setProcessStatus(status);
                p.setProcessStd(process.getProcessStd());
                p.setProcessColor(process.getProcessColor());
                p.setProcessCus(process.getProcessCus());

                checkDao.AddMessageDuct(p);
            }
        } else {//30 做product表的修改
            for (int i = 0; i < level.length; i++) {
                // System.out.println("bbbbbbbbbbb");
                p = new Process();
                p.setProcessId(process.getProcessId());
                p.setProductLevel("0" + (i + 1));
                p.setCheckNum(level[i]);//借用此变量
                p.setProcessStatus(status);
                checkDao.updateDuct(p);
            }
        }
        if (status.equals("35")) {
            p = new Process();
            p.setProcessId(process.getProcessId());
            p.setProcessStatus("35");
            p.setCheckNum(nums);
            Subject subject = SecurityUtils.getSubject();
            User user = (User) subject.getPrincipal();
            p.setCheckPerson(user.getuName());
            checkDao.updateNull(process.getProcessId());
            checkDao.updateProcess(p);
        } else {
            p = new Process();
            p.setProcessId(process.getProcessId());
            p.setProcessStatus("30");
            p.setCheckNum(nums);
            checkDao.updateProcess(p);

        }
    }
}
