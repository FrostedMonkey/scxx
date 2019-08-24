package com.yizu.scgcxx.controller.plan;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yizu.scgcxx.dto.ManagerDto;
import com.yizu.scgcxx.dto.ResultDto;
import com.yizu.scgcxx.model.Plan;
import com.yizu.scgcxx.model.User;
import com.yizu.scgcxx.service.plan.ManagerService;
import com.yizu.scgcxx.util.LauiData;

@RestController
@RequestMapping("/plan")
public class ManagerController {

    @Autowired
    private ManagerService managerService;

    @RequestMapping(value = "/manager", method = RequestMethod.GET)
    public LauiData getManager(ManagerDto managerDto) {
        System.out.println(managerDto);
        PageHelper.startPage(managerDto.getPage(), managerDto.getLimit());
        List<Plan> list = managerService.getMeanger(managerDto);
        PageInfo<Plan> pageinfo = new PageInfo<Plan>(list);
        return LauiData.SETDATA(0, "", new Long(pageinfo.getTotal()).intValue(), list, pageinfo);
    }

    @RequestMapping(value = "/manager", method = RequestMethod.POST)
    public ResultDto addManager(Plan plan, HttpSession session) {
        int result = managerService.addManager(plan);
        if (result > 0) {
            return ResultDto.succeedResult("添加成功");
        } else {
            return ResultDto.failResult("添加失败");
        }
    }

    @RequestMapping(value = "/manager/{planId}", method = RequestMethod.PUT)
    public ResultDto updateManagerById(@PathVariable Integer planId, HttpSession session) {
        Plan plan = new Plan();
        SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
        plan.setPlanId(planId);
        plan.setPlanPerson(((User) session.getAttribute("userLogin")).getuName());
        int result = managerService.updateManagerById(plan);
        if (result > 0) {
            return ResultDto.succeedResult("下达成功");
        } else {
            return ResultDto.failResult("下达失败");
        }
    }

    @RequestMapping(value = "/manager/{planId}", method = RequestMethod.DELETE)
    public ResultDto deleteManagerById(@PathVariable Integer planId) {
        int result = managerService.deleteManagerById(planId);
        if (result > 0) {
            return ResultDto.succeedResult("删除成功");
        } else {
            return ResultDto.failResult("删除失败");
        }
    }

    @RequestMapping(value = "/manager", method = RequestMethod.PUT)
    public ResultDto updateManager(@RequestBody Plan plan) {
        int result = managerService.updateManager(plan);
        if (result > 0) {
            return ResultDto.succeedResult("修改成功");
        } else {
            return ResultDto.failResult("修改失败");
        }
    }

    @RequestMapping(value = "/manager", method = RequestMethod.DELETE)
    public ResultDto deleteByIds(@RequestBody Integer[] planIds) {
        int length = planIds.length;
        int result = managerService.deleteManagerByIds(planIds);
        if (length == result) {
            return ResultDto.succeedResult("删除成功");
        } else {
            return ResultDto.failResult("删除失败");
        }
    }

    @RequestMapping(value = "/manager/status/{planStatus}", method = RequestMethod.PUT)
    public ResultDto updateByIds(@PathVariable Integer planStatus, @RequestBody Integer[] planIds, HttpSession session) {
        int length = planIds.length;
        String username = ((User) session.getAttribute("userLogin")).getuName();
        int result = managerService.updateByIds(planIds, username);
        if (length == result) {
            return ResultDto.succeedResult("下达成功");
        } else {
            return ResultDto.failResult("下达失败");
        }
    }
}
