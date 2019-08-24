package com.yizu.scgcxx.controller.info;

import java.util.List;
import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yizu.scgcxx.commons.DataStatus;
import com.yizu.scgcxx.dto.ColorDto;
import com.yizu.scgcxx.dto.ResultDto;
import com.yizu.scgcxx.model.Color;
import com.yizu.scgcxx.service.info.ColorService;
import com.yizu.scgcxx.util.LauiData;

@RestController
@RequestMapping("/info")
public class ColorController {
    @Autowired
    private ColorService colorService;

    @RequestMapping(value = "/color", method = RequestMethod.GET)
    public LauiData doQuery(ColorDto dto) {
        PageHelper.startPage(dto.getPage(), dto.getLimit());
        List<Color> color = colorService.queryColor(dto);
        PageInfo<Color> pageInfo = new PageInfo<Color>(color);
        return LauiData.SETDATA(0, "查到", new Long(pageInfo.getTotal()).intValue(), color, pageInfo);
    }

    @RequestMapping(value = "/color", method = RequestMethod.POST)
    public ResultDto addColor(Color color) {
        colorService.addColor(color);
        return ResultDto.succeedResult("添加成功");
    }

    @RequestMapping(value = "/color/{ci}", method = RequestMethod.GET)
    public Color getColor(@PathVariable("ci") Integer coId) {
        Color col = colorService.getColor(coId);
        return col;
    }

    @RequestMapping(value = "/color/{cid}", method = RequestMethod.DELETE)
    public ResultDto delete(@PathVariable("cid") Integer coId) {
        colorService.deleteColor(coId);
        return ResultDto.succeedResult("删除成功");

    }

    @RequestMapping(value = "/color", method = RequestMethod.PUT)
    public ResultDto update(@RequestBody Color color) {
        colorService.updateColor(color);
        return ResultDto.succeedResult("客户修改成功");

    }

    @RequestMapping(value = "/color", method = RequestMethod.DELETE)
    public ResultDto deleteAll(@RequestBody Integer[] ids) {
        colorService.deleteAllColor(ids);
        return ResultDto.succeedResult("删除成功");
    }

    @RequestMapping(value = "/color/status/{coId}/{coStatus}", method = RequestMethod.PUT)
    public ResultDto updateStatus(@PathVariable Integer coId, @PathVariable String coStatus) {
        Color color = new Color();
        color.setCoId(coId);
        color.setCoStatus(coStatus);
        colorService.updateColor(color);
        return ResultDto.succeedResult("颜色信息更新");
    }

    @RequestMapping(value = "/color/status/{coStatus}", method = RequestMethod.PUT)
    public ResultDto updateColorStatus(@RequestBody Integer[] coId, @PathVariable String coStatus) {
        colorService.updateSa(coId, coStatus);
        return ResultDto.succeedResult("客户信息状态已成功更新为" + DataStatus.getName(coStatus) + "！");
    }

}
