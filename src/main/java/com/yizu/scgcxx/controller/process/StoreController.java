package com.yizu.scgcxx.controller.process;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.yizu.scgcxx.model.User;
import com.yizu.scgcxx.service.process.StoreService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import com.yizu.scgcxx.dto.ResultDto;
import com.yizu.scgcxx.dto.StoreDto;

import com.yizu.scgcxx.model.Store;


@RestController
@RequestMapping("/process")
public class StoreController {

    @Autowired
    StoreService storeService;

    @RequestMapping(value = "/store_do", method = RequestMethod.GET)
    public PageInfo<Store> getStore(StoreDto storeDto) {
        PageHelper.startPage(storeDto.getPage(), storeDto.getLimit());
        List<Store> stores = storeService.getStore(storeDto.getStoreStatus());
        PageInfo pageInfo = new PageInfo(stores);
        return pageInfo;
    }

    @RequestMapping(value = "/store_do", method = RequestMethod.PUT)
    public ResultDto updStore(@RequestBody StoreDto storeDto) {
        Subject subject = SecurityUtils.getSubject();
        User user = (User) subject.getPrincipal();
        storeDto.setStorePer(user.getuName());
        System.out.println(storeDto);

        try {
            storeService.updStore(storeDto);
            return ResultDto.succeedResult();
        } catch (Exception e) {
            return ResultDto.failResult();
        }
    }

    @RequestMapping(value = "/store_do/{id}", method = RequestMethod.GET)
    public PageInfo<Store> getStoreAfter(StoreDto storeDto) {
        PageHelper.startPage(storeDto.getPage(), storeDto.getLimit());
        List<Store> storeAfter = storeService.getStoreAfter();
        PageInfo pageInfo = new PageInfo(storeAfter);
        return pageInfo;
    }

}
