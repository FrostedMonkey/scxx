package com.yizu.scgcxx.controller.process;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yizu.scgcxx.dto.ProcessDto;
import com.yizu.scgcxx.dto.ResultDto;
import com.yizu.scgcxx.model.Process;
import com.yizu.scgcxx.model.User;
import com.yizu.scgcxx.service.process.PretreatmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/process")
public class PretreatmentController {
    @Autowired
    private PretreatmentService pretreatmentService;

    /**
     * 查询已投坯
     *
     * @param processDto
     * @return
     */
    @RequestMapping(value = "/UnPretreatment", method = RequestMethod.GET)
    public PageInfo<Process> getUnPretreatment(ProcessDto processDto) {
        PageHelper.startPage(processDto.getPage(), processDto.getLimit());
        List<Process> list = pretreatmentService.getUnPretreatment(processDto);
        PageInfo<Process> pageinfo = new PageInfo<Process>(list);
        return pageinfo;
    }

    @RequestMapping(value = "/Pretreatment", method = RequestMethod.GET)
    public PageInfo<Process> getPretreatment(ProcessDto processDto) {
        PageHelper.startPage(processDto.getPage(), processDto.getLimit());
        List<Process> list = pretreatmentService.getPretreatment(processDto);
        PageInfo<Process> pageinfo = new PageInfo<Process>(list);
        return pageinfo;
    }

    @RequestMapping(value = "/afterPretreatment", method = RequestMethod.GET)
    public PageInfo<Process> getAll(ProcessDto processDto) {
        PageHelper.startPage(processDto.getPage(), processDto.getLimit());
        List<Process> list = pretreatmentService.getAll(processDto);
        PageInfo<Process> pageinfo = new PageInfo<Process>(list);
        return pageinfo;
    }

    @RequestMapping(value = "/completePre", method = RequestMethod.PUT)
    public ResultDto completePre(@RequestBody Process process, HttpSession session) {
        process.setPretreatPerson(((User) session.getAttribute("userLogin")).getuName());
        int result = pretreatmentService.completePre(process);
        if (result > 0) {
            return ResultDto.succeedResult("前处理完成");
        } else {
            return ResultDto.failResult("失败");
        }
    }
}
