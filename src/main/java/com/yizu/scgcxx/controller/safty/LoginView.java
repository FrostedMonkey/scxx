package com.yizu.scgcxx.controller.safty;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yizu.scgcxx.commons.Utils;

@Controller
@RequestMapping("/safty")
public class LoginView {
    /**
     * 根据浏览器发来请求头，转到移动端或者PC端登录页。
     *
     * @param via
     * @param userAgent
     * @return
     */
    @RequestMapping("/login_to")
    public String toLogin(@RequestHeader(value = "Via", required = false) String via, @RequestHeader("user-agent") String userAgent) {
        boolean is = Utils.isMobileDevice(via, userAgent);
        if (is) {
            return "/safty/m_login";
        }
        return "/safty/login";
    }
}
