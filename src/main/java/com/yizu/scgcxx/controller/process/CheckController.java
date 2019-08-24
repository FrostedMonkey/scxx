package com.yizu.scgcxx.controller.process;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yizu.scgcxx.dto.ProcessDto;
import com.yizu.scgcxx.dto.ResultDto;
import com.yizu.scgcxx.model.Process;
import com.yizu.scgcxx.service.process.CheckService;
import com.yizu.scgcxx.util.LauiData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.util.List;

@RestController
@RequestMapping("/process")
public class CheckController {
    @Autowired
    private CheckService checkService;

    @RequestMapping(value = "/check", method = RequestMethod.GET)
    public LauiData queryAll(ProcessDto processDto) {
        PageHelper.startPage(processDto.getPage(), processDto.getLimit());
        List<Process> list = checkService.getAll(processDto);
        PageInfo<Process> pageInfo = new PageInfo<Process>(list);
        return LauiData.SETDATA(0, "", new Long(pageInfo.getTotal()).intValue(), list, pageInfo);
    }

    @RequestMapping(value = "/check/{nums}", method = RequestMethod.POST)
    public ResultDto addCheck(Process process, @PathVariable BigDecimal nums) {
        System.out.println(process);
        System.out.println(nums);
        checkService.addCheck(process, nums);
        return ResultDto.succeedResult("成功");
    }
}
