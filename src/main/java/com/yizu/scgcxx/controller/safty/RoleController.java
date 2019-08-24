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
import com.yizu.scgcxx.commons.DataStatus;
import com.yizu.scgcxx.dto.ResultDto;
import com.yizu.scgcxx.dto.RoleDto;
import com.yizu.scgcxx.model.Role;
import com.yizu.scgcxx.service.safty.RoleService;
import com.yizu.scgcxx.util.LauiData;

@RestController
@RequestMapping("/safty")
public class RoleController {
    @Autowired
    private RoleService roleService;

    /**
     * 查询
     *
     * @param roleDto
     * @return
     */
    @RequestMapping(value = "/role", method = RequestMethod.GET)
    public LauiData getRole(RoleDto roleDto) {
        PageHelper.startPage(roleDto.getPage(), roleDto.getLimit());
        List<Role> roles = roleService.getRole(roleDto);
        PageInfo<Role> pageInfo = new PageInfo<Role>(roles);
        return LauiData.SETDATA(0, "", new Long(pageInfo.getTotal()).intValue(), roles, pageInfo);
    }

    /**
     * 删除
     *
     * @param roId
     * @return
     */
    @RequestMapping(value = "/role/{roId}", method = RequestMethod.DELETE)
    public ResultDto delteById(@PathVariable("roId") Integer roId) {
        System.out.println(roId);
        int i = roleService.deleteById(roId);
        if (i > 0) {
            return ResultDto.succeedResult("删除成功");
        } else {
            return ResultDto.failResult("删除失败");
        }
    }

    /**
     * 根据id更改状态
     *
     * @param roId
     * @param roStatus
     * @return
     */
    @RequestMapping(value = "/role/status/{roId}/{roStatus}", method = RequestMethod.PUT)
    public ResultDto updateById(@PathVariable Integer roId, @PathVariable String roStatus) {
        int i = roleService.updateById(roId, roStatus);
        if (i > 0) {
            return ResultDto.succeedResult("客户信息状态已成功更新为" + DataStatus.getName(roStatus) + "！");
        } else {
            return ResultDto.failResult("客户信息状态已成功更新失败");
        }
    }

    /**
     * 添加角色
     *
     * @param role
     * @return
     */
    @RequestMapping(value = "/role", method = RequestMethod.POST)
    public ResultDto addRole(Role role) {
        int i = roleService.addRole(role);
        if (i > 0) {
            return ResultDto.succeedResult("添加成功");
        } else {
            return ResultDto.failResult("添加失败");
        }
    }

    /**
     * 根据id查询角色
     *
     * @param roId
     * @return
     */
    @RequestMapping(value = "/role/{roId}", method = RequestMethod.GET)
    public Role queryById(@PathVariable Integer roId) {
        return roleService.queryById(roId);
    }

    /**
     * 删除角色
     *
     * @param role
     * @return
     */
    @RequestMapping(value = "/role", method = RequestMethod.PUT)
    public ResultDto updataRole(@RequestBody Role role) {
        int i = roleService.updataRole(role);
        if (i > 0) {
            return ResultDto.succeedResult("修改成功");
        } else {
            return ResultDto.failResult("修改失败");
        }
    }

    /**
     * 删除多条
     *
     * @param roids
     * @return
     */
    @RequestMapping(value = "/role", method = RequestMethod.DELETE)
    public ResultDto deleteByIds(@RequestBody Integer[] roids) {
        int count = roids.length;
        int result = roleService.deleteByIds(roids);
        if (count == result) {
            return ResultDto.succeedResult("删除成功");
        } else {
            return ResultDto.failResult("删除失败");
        }
    }

    /**
     * 更改多条
     *
     * @param roStatus
     * @param roIds
     * @return
     */
    @RequestMapping(value = "/role/status/{roStatus}", method = RequestMethod.PUT)
    public ResultDto updateByIds(@PathVariable String roStatus, @RequestBody Integer[] roIds) {
        int length = roIds.length;
        int result = roleService.updateByIds(roIds, roStatus);
        if (length == result) {
            return ResultDto.succeedResult("客户信息状态已成功更新为" + DataStatus.getName(roStatus) + "！");
        } else {
            return ResultDto.failResult("客户信息状态已成功更新失败");
        }
    }

    @RequestMapping(value = "/role/module/{roId}", method = RequestMethod.PUT)
    public ResultDto updateByids(@PathVariable Integer roId, @RequestBody Integer[] mIds) {
        roleService.setRoleModules(mIds, roId);
        return ResultDto.succeedResult("更新权限成功");

    }
}
