package com.yizu.scgcxx.controller.process;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yizu.scgcxx.dto.ProcessDto;
import com.yizu.scgcxx.dto.ResultDto;
import com.yizu.scgcxx.model.Process;
import com.yizu.scgcxx.model.User;
import com.yizu.scgcxx.service.process.ArrangeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/process")
public class ArrangeController {

    @Autowired
    private ArrangeService arrangeService;

    @RequestMapping(value = "/UnArrange", method = RequestMethod.GET)
    public PageInfo<Process> getUnArrange(ProcessDto processDto) {
        PageHelper.startPage(processDto.getPage(), processDto.getLimit());
        List<Process> list = arrangeService.getUnArrange(processDto);
        PageInfo<Process> pageinfo = new PageInfo<Process>(list);
        return pageinfo;
    }

    @RequestMapping(value = "/Arrange", method = RequestMethod.GET)
    public PageInfo<Process> getArrange(ProcessDto processDto) {
        PageHelper.startPage(processDto.getPage(), processDto.getLimit());
        List<Process> list = arrangeService.getArrange(processDto);
        PageInfo<Process> pageinfo = new PageInfo<Process>(list);
        return pageinfo;
    }

    @RequestMapping(value = "/completeArrange", method = RequestMethod.PUT)
    public ResultDto completeArrange(@RequestBody Process process, HttpSession session) {
        process.setDyePerson(((User) session.getAttribute("userLogin")).getuName());
        int result = arrangeService.completeArrange(process);
        if (result > 0) {
            return ResultDto.succeedResult("整理成功");
        } else {
            return ResultDto.failResult("整理失败");
        }
    }

    @RequestMapping(value = "/afterArrange", method = RequestMethod.GET)
    public PageInfo<Process> getAll(ProcessDto processDto) {
        PageHelper.startPage(processDto.getPage(), processDto.getLimit());
        List<Process> list = arrangeService.getAll(processDto);
        PageInfo<Process> pageinfo = new PageInfo<Process>(list);
        return pageinfo;
    }


}
