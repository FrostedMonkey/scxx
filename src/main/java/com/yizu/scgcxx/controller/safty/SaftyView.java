package com.yizu.scgcxx.controller.safty;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yizu.scgcxx.dto.MenuDto;

import com.yizu.scgcxx.dto.RoleDto;

import com.yizu.scgcxx.model.User;
import com.yizu.scgcxx.service.safty.HomeService;
import com.yizu.scgcxx.service.safty.RoleService;
import com.yizu.scgcxx.service.safty.UserService;

@Controller
@RequestMapping("/safty")
public class SaftyView {

    @Autowired
    private HomeService homeService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private UserService userService;

    @RequestMapping("/home_to")
    public String ceshi(Model model, HttpSession session) {
        Subject subject = SecurityUtils.getSubject();
        User user = (User) subject.getPrincipal();

        List<MenuDto> menus = homeService.getMenus(user.getuId());
        model.addAttribute("menuList", menus);

        return "/safty/home";
    }

    /**
     * 手机端
     *
     * @return
     */
    @RequestMapping("/m_home_to")
    public String mHomeTo() {
        return "/safty/m_home";
    }


    @RequestMapping("/role_to")
    public String toRole() {
        return "/safty/role";
    }

    @RequestMapping(value = "/login_doexit", method = RequestMethod.GET)
    public String doExitLogin(HttpSession session) {
        session.removeAttribute("userLogin");
        return "/safty/login";
    }

    @RequestMapping("/user_to")
    public String toUser() {
        return "/safty/user";
    }

    @RequestMapping(value = "/role/module_to/{roId}", method = RequestMethod.GET)
    public String roleModule(@PathVariable Integer roId, Model model) {
        List<MenuDto> list = roleService.getRoleModules(roId);
        model.addAttribute("menuList", list);
        return "/safty/module";
    }

    @RequestMapping(value = "/user_to/doUser/{uId}", method = RequestMethod.GET)
    public String toEditUser(@PathVariable String uId, Model model) {
        Map<Integer, RoleDto> roles = userService.getRoles(uId);
        model.addAttribute("roles", roles);
        model.addAttribute("uId", uId);
        return "/safty/edituser";
    }

    @RequestMapping("/m_editUesr")
    public String toEaitUser() {
        return "/safty/meditUser";
    }
}
