package com.yizu.scgcxx.controller.safty;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yizu.scgcxx.dto.CustomerDto;
import com.yizu.scgcxx.dto.ResultDto;
import com.yizu.scgcxx.dto.UserDto;
import com.yizu.scgcxx.model.Customer;
import com.yizu.scgcxx.model.User;
import com.yizu.scgcxx.service.safty.UserService;
import com.yizu.scgcxx.util.LauiData;

@RestController
@RequestMapping("/safty")
public class UserController {

    @Autowired
    UserService userService;

    @RequestMapping(value = "/user_do", method = RequestMethod.GET)
    public LauiData doQueryAll(UserDto userDto) {
        PageHelper.startPage(userDto.getPage(), userDto.getLimit());
        List<User> users = userService.getUsers(userDto);
        PageInfo pageInfo = new PageInfo(users, 5);
        return LauiData.SETDATA(0, "查到", new Long(pageInfo.getTotal()).intValue(), users, pageInfo);
    }

    @RequestMapping(value = "/user_do", method = RequestMethod.POST)
    public ResultDto doAddUser(User user) {
        int i = userService.addUser(user);
        if (i > 0) {
            return ResultDto.succeedResult("添加成功");
        } else {
            return ResultDto.failResult("添加失败");
        }
    }

    @RequestMapping(value = "/user_do", method = RequestMethod.PUT)
    public ResultDto doUpdateById(@RequestBody User user) {
        int i = userService.updateById(user);
        if (i > 0) {
            return ResultDto.succeedResult("修改成功");
        } else {
            return ResultDto.failResult("修改失败");
        }
    }

    @RequestMapping(value = "/user_do/status/{uId}/{uStatus}", method = RequestMethod.PUT)
    public ResultDto updateCustomerStatus(@PathVariable String uId, @PathVariable String uStatus) {
        UserDto userDto = new UserDto();
        userDto.setuId(uId);
        userDto.setuStatus(uStatus);
        int i = userService.updateUserStatusById(userDto);
        if (i > 0) {
            return ResultDto.succeedResult("客户信息状态更新成功");
        } else {
            return ResultDto.failResult("客户信息状态更新失败");
        }
    }

    @RequestMapping(value = "/user_do/status/{uStatus}", method = RequestMethod.PUT)
    public ResultDto updateCustomerStatus(@RequestBody String[] uIds, @PathVariable String uStatus) {
        userService.updateUserStatusByIds(uIds, uStatus);
        return ResultDto.succeedResult("批量状态修改成功");
    }

    @RequestMapping(value = "/user_do/quanx/{uId}", method = RequestMethod.PUT)
    public ResultDto setRoleModules(@RequestBody Integer[] roleIds, @PathVariable String uId) {
        userService.AddUr(roleIds, uId);
        return ResultDto.succeedResult("用户角色修改成功");
    }


}
