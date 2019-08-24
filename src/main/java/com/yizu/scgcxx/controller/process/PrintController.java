package com.yizu.scgcxx.controller.process;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.yizu.scgcxx.service.process.PrintService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import com.yizu.scgcxx.dto.DyeDto;
import com.yizu.scgcxx.dto.ResultDto;
import com.yizu.scgcxx.model.Process;
import com.yizu.scgcxx.model.User;


@RestController
@RequestMapping("/process")
public class PrintController {

    @Autowired
    PrintService printService;

    @RequestMapping(value = "/print_do", method = RequestMethod.GET)
    public PageInfo getDye(DyeDto dyeDto) {
        PageHelper.startPage(dyeDto.getPage(), dyeDto.getLimit());
        List<Process> prints = printService.getPrint(dyeDto.getStatus4(), dyeDto.getProcessStatus());
        PageInfo pageInfo = new PageInfo(prints);
        return pageInfo;
    }

    @RequestMapping(value = "/print_do", method = RequestMethod.PUT)
    public ResultDto getDye(@RequestBody DyeDto dyeDto, HttpSession session) {
        Subject subject = SecurityUtils.getSubject();
        User user = (User) subject.getPrincipal();
        dyeDto.setPrintPerson(user.getuName());

        int i = printService.updateStstus(dyeDto);
        if (i > 0) {
            return ResultDto.succeedResult("下达完成");
        }
        return ResultDto.failResult("下达失败");
    }

    @RequestMapping(value = "/print_do/{id}", method = RequestMethod.GET)
    public PageInfo getDyeHou(DyeDto dyeDto) {
        PageHelper.startPage(dyeDto.getPage(), dyeDto.getLimit());
        List<Process> printHou = printService.getPrintHou();
        PageInfo pageInfo = new PageInfo(printHou);
        return pageInfo;
    }
}
