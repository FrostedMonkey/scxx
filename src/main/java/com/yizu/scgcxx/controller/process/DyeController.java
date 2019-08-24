package com.yizu.scgcxx.controller.process;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.yizu.scgcxx.model.Process;
import com.yizu.scgcxx.model.User;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yizu.scgcxx.dto.ProcessDto;
import com.yizu.scgcxx.dto.ResultDto;
import com.yizu.scgcxx.service.process.DyeService;

@RestController
@RequestMapping("/process")
public class DyeController {
    @Autowired
    private DyeService dyeService;

    /**
     * 查询未染色
     *
     * @param processDto
     * @return
     */
    @RequestMapping(value = "/m_dye", method = RequestMethod.GET)
    public PageInfo<Process> getDye(ProcessDto processDto) {
        PageHelper.startPage(processDto.getPage(), processDto.getLimit());
        List<Process> list = dyeService.getDye(processDto);
        PageInfo<Process> pageinfo = new PageInfo<Process>(list);
        return pageinfo;
    }

    @RequestMapping(value = "/completeDye", method = RequestMethod.PUT)
    public ResultDto completeDye(@RequestBody Process process, HttpSession session) {

        process.setDyePerson(((User) session.getAttribute("userLogin")).getuName());
        int result = dyeService.completeDyeById(process);
        if (result > 0) {
            return ResultDto.succeedResult("染色成功");
        } else {
            return ResultDto.failResult("染色失败");
        }
    }

    /**
     * 获得已然色数据
     *
     * @param processDto
     * @return
     */
    @RequestMapping(value = "/m_complete_dye", method = RequestMethod.GET)
    public PageInfo<Process> getCompleteDye(ProcessDto processDto) {
        PageHelper.startPage(processDto.getPage(), processDto.getLimit());
        List<Process> list = dyeService.getCompleteDye(processDto);
        PageInfo<Process> pageinfo = new PageInfo<Process>(list);
        return pageinfo;
    }

    @RequestMapping(value = "/dye-afterDyed", method = RequestMethod.GET)
    public PageInfo<Process> getAll(ProcessDto processDto) {
        PageHelper.startPage(processDto.getPage(), processDto.getLimit());
        List<Process> list = dyeService.getAll();
        PageInfo<Process> pageinfo = new PageInfo<Process>(list);
        return pageinfo;
    }

}
