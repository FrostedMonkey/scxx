package com.yizu.scgcxx.controller.process;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yizu.scgcxx.dto.ProcessDto;
import com.yizu.scgcxx.dto.ResultDto;
import com.yizu.scgcxx.dto.StoreDto;
import com.yizu.scgcxx.model.Process;
import com.yizu.scgcxx.model.Store;
import com.yizu.scgcxx.service.process.OutService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/process")
public class OutController {
    @Autowired
    private OutService outService;

    @RequestMapping(value = "/UnOut", method = RequestMethod.GET)
    public PageInfo getDye(StoreDto storeDto) {
        PageHelper.startPage(storeDto.getPage(), storeDto.getLimit());
        List<Store> list = outService.getUnout(storeDto);
        PageInfo<Store> pageinfo = new PageInfo<Store>(list);
        return pageinfo;

    }

    @RequestMapping(value = "/comOut/{storeId}/{productId}/{processId}", method = RequestMethod.PUT)
    public ResultDto comOut(@PathVariable Integer storeId, @PathVariable Integer productId, @PathVariable Integer processId) {
        System.out.println("productId  " + productId + "   processId" + processId);
        outService.comOut(storeId, productId, processId);
        return ResultDto.succeedResult("出库成功");

    }

    @RequestMapping(value = "Allout", method = RequestMethod.GET)
    public PageInfo getAll(StoreDto storeDto) {
        PageHelper.startPage(storeDto.getPage(), storeDto.getLimit());
        List<Store> list = outService.getAll(storeDto);
        PageInfo<Store> pageinfo = new PageInfo<Store>(list);
        return pageinfo;

    }
}
