package com.yizu.scgcxx.controller.process;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yizu.scgcxx.dto.ProcessDto;
import com.yizu.scgcxx.dto.ResultDto;
import com.yizu.scgcxx.model.Process;
import com.yizu.scgcxx.model.User;
import com.yizu.scgcxx.service.process.RawclothService;
import com.yizu.scgcxx.util.LauiData;

@RestController
@RequestMapping("/process")
public class RawclothController {
    @Autowired
    private RawclothService rawclothService;

    @RequestMapping(value = "/rawcloth", method = RequestMethod.GET)
    public LauiData getRawcloth(ProcessDto processDto) {
        PageHelper.startPage(processDto.getPage(), processDto.getLimit());
        List<Process> list = rawclothService.getRawcloth(processDto);
        PageInfo<Process> pageInfo = new PageInfo<Process>(list);
        return LauiData.SETDATA(0, "", new Long(pageInfo.getTotal()).intValue(), list, pageInfo);
    }

    @RequestMapping(value = "/rawcloth/plan", method = RequestMethod.GET)
    public LauiData getPlan(@RequestParam int page, @RequestParam int limit) {
        PageHelper.startPage(page, limit);
        List<Process> list = rawclothService.getTotal();
        PageInfo<Process> pageInfo = new PageInfo<Process>(list);
        return LauiData.SETDATA(0, "", new Long(list.size()).intValue(), list, pageInfo);
    }

    @RequestMapping(value = "/rawcloth", method = RequestMethod.POST)
    public ResultDto addProcess(Process process, HttpSession session) {
        process.setGroupPerson(((User) session.getAttribute("userLogin")).getuName());
        System.out.println(((User) session.getAttribute("userLogin")).getuName());
        System.out.println(process);
        int result = rawclothService.addProcess(process);
        if (result > 0) {
            return ResultDto.succeedResult("添加成功");
        } else {
            return ResultDto.failResult("添加失败");
        }
    }

    @RequestMapping(value = "/rawcloth/{processId}", method = RequestMethod.DELETE)
    public ResultDto deleteById(@PathVariable Integer processId) {
        int result = rawclothService.deleteById(processId);
        if (result > 0) {
            return ResultDto.succeedResult("删除成功");
        } else {
            return ResultDto.failResult("删除失败");
        }
    }

    @RequestMapping(value = "/rawcloth/{processId}/{processStatus}")
    public ResultDto updateById(@PathVariable Integer processId, @PathVariable String processStatus, HttpSession session) {
        String username = ((User) session.getAttribute("userLogin")).getuName();
        int result = rawclothService.updateById(processId, processStatus, username);
        if (result > 0) {
            return ResultDto.succeedResult("投坯成功");
        } else {
            return ResultDto.failResult("投坯失败");
        }
    }

    @RequestMapping(value = "/rawcloth/{planId}/{processId}", method = RequestMethod.GET)
    public Process queryResidueById(@PathVariable Integer planId, @PathVariable Integer processId) {
        Process process = rawclothService.queryResidueById(planId, processId);
        return process;
    }

    @RequestMapping(value = "/rawcloth", method = RequestMethod.PUT)
    public ResultDto updateProcess(@RequestBody Process process) {
        int result = rawclothService.updateProcess(process);
        if (result > 0) {
            return ResultDto.succeedResult("修改成功");
        } else {
            return ResultDto.failResult("修改失败");
        }
    }
}
