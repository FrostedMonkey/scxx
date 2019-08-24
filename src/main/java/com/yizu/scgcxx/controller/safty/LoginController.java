package com.yizu.scgcxx.controller.safty;

import javax.servlet.http.HttpSession;

import com.yizu.scgcxx.model.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.yizu.scgcxx.commons.Constants;
import com.yizu.scgcxx.dto.ResultDto;

import com.yizu.scgcxx.service.safty.LoginService;


@RestController
@RequestMapping("/safty")
public class LoginController {

    @Autowired
    private LoginService loginService;

    @RequestMapping(value = "/login_do", method = RequestMethod.GET)
    public ResultDto login(User user, HttpSession session) {

        try {
            Subject subject = SecurityUtils.getSubject();

            //创建登录令牌
            UsernamePasswordToken usernamePasswordToken =
                    new UsernamePasswordToken(user.getuId(), user.getuPwd());

            //登录，该方法声明抛出异常，可以捕获异常，并进行应对处理
            subject.login(usernamePasswordToken);

            //是否通过认证
            if (subject.isAuthenticated()) {

                //获得当前用户信息
                User userLogin = (User) subject.getPrincipal();

                //将当前用户放入Session。注：这里的Session是由Shiro提供的。
                subject.getSession().setAttribute(Constants.SESSION_ATTR_NAME_CURR_USER, userLogin);


                return ResultDto.succeedResult();
            }

            return ResultDto.failResult("登录失败！");

        } catch (UnknownAccountException e) {
            return ResultDto.failResult("用户名不存在！");

        } catch (IncorrectCredentialsException e) {
            return ResultDto.failResult("账户密码 不正确!");
        } catch (LockedAccountException e) {
            return ResultDto.failResult("用户名 被锁定 !");
        } catch (Exception e) {
            e.printStackTrace();
            return ResultDto.failResult("系统错误！");
        }

    }


}
