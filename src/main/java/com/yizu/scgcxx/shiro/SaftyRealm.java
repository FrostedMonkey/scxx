package com.yizu.scgcxx.shiro;

import com.yizu.scgcxx.model.Module;
import com.yizu.scgcxx.model.User;
import com.yizu.scgcxx.service.safty.SaftyService;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import javax.annotation.Resource;
import java.util.List;

public class SaftyRealm extends AuthorizingRealm {

    @Resource
    private SaftyService saftyService;

    /**
     * 获取当事人（当前用户）授权信息 参数PrincipalCollection 当事人集合
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {

        /*
         * 获取登录用户帐号
         */
        User currUser = (User) principalCollection.getPrimaryPrincipal();// 获取首要（第一）当事人

        /*
         * 创建授权信息对象
         */
        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();


//
//		// 查询角色
//		List<Role> roleList = saftyService.getRolesOfUser(currUser.getUserId());
//
//		// 将角色信息放入授权信息对象
//		for (Role role : roleList) {
//			simpleAuthorizationInfo.addRole(String.valueOf(role.getRo_id()));
//		}
//


        /*
         * 查询用户权限，并将权限放入授权信息对象中
         */
        List<Module> moduleList = saftyService.getModulesOfUser(currUser.getuId());
        for (Module module : moduleList) {
            simpleAuthorizationInfo.addStringPermission(String.valueOf(module.getmId()));
        }

        // System.out.println(currUser.getUserId()+"->"+simpleAuthorizationInfo.getStringPermissions());

        /*
         * 返回授权信息
         */
        return simpleAuthorizationInfo;
    }

    /**
     * 获取认证信息 参数 AuthenticationToken 认证令牌（如：一组用户名和密码就是一个认证令牌）
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) {

        String userId = (String) token.getPrincipal();// 获得当事人（当前用户）

        User user = saftyService.getUser(userId);

        /*
         * 如果不存在前用户信息，返回null
         */
        if (user == null) {
            return null;
        }

        /*
         * 创建当前用户
         */

        User logUser = new User();
        logUser.setuId(user.getuId());
        logUser.setuName(user.getuName());
        logUser.setuPwd(user.getuPwd());

        /*
         * 创建认证信息，三个构造参数含义依次如下：
         *  参数1：principal当前用户
         *  参数2：credentials认证凭证（如：口令、密码等）
         *  参数3：realm名称
         */
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(logUser, user.getuPwd(), this.getName());

        /*
         * 返回认证信息
         */
        return info;
    }

}