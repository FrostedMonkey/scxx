package com.yizu.scgcxx.controller.info;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yizu.scgcxx.dto.ResultDto;
import com.yizu.scgcxx.dto.StandardDto;
import com.yizu.scgcxx.model.Standard;
import com.yizu.scgcxx.service.info.StandardService;
import com.yizu.scgcxx.util.LauiData;

@RestController // 等同于 @Controller + @ResponseBody
@RequestMapping("/info")
public class StandardController {
    @Autowired
    private StandardService standardService;

    @RequestMapping(value = "/standard", method = RequestMethod.GET)
    public LauiData doQuery(StandardDto standardDto) {
        PageHelper.startPage(standardDto.getPage(), standardDto.getLimit());
        List<Standard> standardList = standardService.getStandard(standardDto);
        PageInfo<Standard> pageinfo = new PageInfo<Standard>(standardList);
        return LauiData.SETDATA(0, "查到", new Long(pageinfo.getTotal()).intValue(), standardList, pageinfo);
    }

    //添加
    @RequestMapping(value = "/standard", method = RequestMethod.POST)
    public ResultDto doAdd(Standard standard) {
        int result = standardService.addStandard(standard);
        if (result > 0) {
            return ResultDto.succeedResult("添加成功");
        } else {
            return ResultDto.failResult("添加失败");
        }
    }

    //编辑
    @RequestMapping(value = "/standard", method = RequestMethod.PUT)
    public ResultDto updateStandard(@RequestBody Standard standard) {
        int result = standardService.updateStandard(standard);
        if (result > 0) {
            return ResultDto.succeedResult("修改成功");
        } else {
            return ResultDto.failResult("修改失败");
        }
    }

    @RequestMapping(value = "/standard", method = RequestMethod.DELETE)
    public ResultDto doDeletes(@RequestBody Integer[] standard_ids) {
        int count = standard_ids.length;
        int result = standardService.deleteByIds(standard_ids);
        if (count == result) {
            return ResultDto.succeedResult("删除成功");
        } else {
            return ResultDto.failResult("删除失败");
        }
    }

    @RequestMapping(value = "/standard/{standardId}", method = RequestMethod.DELETE)
    public ResultDto doDelete(@PathVariable("standardId") Integer standardId) {
        int result = standardService.deleteById(standardId);
        if (result > 0) {
            return ResultDto.succeedResult("删除成功");
        } else {
            return ResultDto.failResult("删除失败");
        }
    }

    @RequestMapping(
            value = "/standard/status/{standardId}/{standardStatus}",
            method = RequestMethod.PUT)
    public ResultDto updateCustomerStatus(@PathVariable Integer standardId, @PathVariable String standardStatus) {
        Standard standard = new Standard();
        standard.setStandardId(standardId);
        standard.setStandardStatus(standardStatus);
        int i = standardService.updateState(standard);
        if (i > 0) {
            return ResultDto.succeedResult("信息状态已成功更新为确定");
        } else {
            return ResultDto.failResult("状态更新失败");
        }

    }

    @RequestMapping(
            value = "/standard/status/{standardStatus}",
            method = RequestMethod.PUT)
    public ResultDto updateCustomerStatus(@RequestBody Integer[] standardIds, @PathVariable String standardStatus) {
        int i = standardService.updateStateByids(standardIds, standardStatus);
        if (i == standardIds.length) {
            return ResultDto.succeedResult("客户信息状态已成功更新");
        } else {
            return ResultDto.succeedResult("客户信息状态已成功更新");
        }
    }

    @RequestMapping(value = "/standard/{standardId}", method = RequestMethod.GET)
    public Standard queryById(@PathVariable Integer standardId) {
        return standardService.queryById(standardId);
    }

}
