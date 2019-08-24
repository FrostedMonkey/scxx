package com.yizu.scgcxx.controller.safty;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.yizu.scgcxx.dto.ResultDto;
import com.yizu.scgcxx.model.User;
import com.yizu.scgcxx.service.safty.HomeService;
import com.yizu.scgcxx.service.safty.UserService;

@RestController
@RequestMapping("/safty")
public class HomeController {

    @Autowired
    private HomeService homeService;
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/m_menus", method = RequestMethod.GET)
    public ResultDto getMobileMenus() {
        return ResultDto.succeedResult("", homeService.getMobileMenus());
    }

    @RequestMapping(value = "/m_doexit", method = RequestMethod.GET)
    public ResultDto doMobileExit(HttpSession session) {
        session.removeAttribute("userLogin");
        return ResultDto.succeedResult("退出成功");
    }

    @RequestMapping(value = "/mUpdPwd", method = RequestMethod.PUT)
    public ResultDto doUpdMobileUser(@RequestBody Map<String, String> dto, HttpSession session) {
        System.out.println("新-----" + dto.get("newPwd"));
        System.out.println("旧-----" + dto.get("oldPwd"));
        User user = (User) session.getAttribute("userLogin");
        System.out.println(user.getuPwd());
        if (user.getuPwd().equals(dto.get("oldPwd"))) {
            int i = userService.updUserPwd(user.getuId(), dto.get("newPwd"));
            if (i > 0) {
                user.setuPwd(dto.get("newPwd"));
                session.setAttribute("userLogin", user);
                System.out.println("session" + user.getuPwd());
                return ResultDto.succeedResult("修改成功");
            }
        }
        return ResultDto.failResult("修改失败");

    }
}
