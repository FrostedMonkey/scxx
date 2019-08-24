package com.yizu.scgcxx.shiro;

import java.text.MessageFormat;
import java.util.List;

import javax.annotation.Resource;

import com.yizu.scgcxx.model.Module;
import com.yizu.scgcxx.service.safty.SaftyService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.config.Ini;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.util.StringUtils;

import com.yizu.scgcxx.model.Module;
import com.yizu.scgcxx.service.safty.SaftyService;

import org.apache.shiro.mgt.SecurityManager;

public class ShiroDefinitionSectionFactory implements FactoryBean<Ini.Section> {

    private static final Logger LOG = LogManager.getLogger(ShiroDefinitionSectionFactory.class);

    public static final String PREMISSION_FORMAT = "authc,perms[{0}]";

    @Resource
    private SecurityManager securityManager;

    @Resource
    private SaftyService saftyService;

    /**
     * 注入先于动态权限加载的默认认证授权定义
     */
    private String preFilterChainDefinitions;

    /**
     * 注入后于动态权限加载的默认认证授权定义
     */
    private String postFilterChainDefinitions;

    @Override
    public Ini.Section getObject() throws Exception {

        /*
         * Ini是Map<String,Ini.Section>的实现类
         * Ini.Section是Map<String,String>的实现类，表示一个Ini配置片段实例
         */
        Ini ini = new Ini();

        // 加载动态权限前的ini配置
        ini.load(preFilterChainDefinitions);

        // 获取ini配置片段
        Ini.Section section = ini.getSection(Ini.DEFAULT_SECTION_NAME);

        /*
         * 加载动态权限
         */

        List<Module> moduleList = saftyService.getAllSubModules();

        // 由注入的资源管理对象获取所有资源数据
        for (Module module : moduleList) {
            if (StringUtils.isEmpty(module.getmUrl())) {
                continue;
            }

            // 将动态权限放入ini配置片段中
            section.put(module.getmUrl(), MessageFormat.format(PREMISSION_FORMAT, String.valueOf(module.getmId())));

        }

        // 加载动态权限之后的ini配置
        Ini postIni = new Ini();
        postIni.load(postFilterChainDefinitions);
        Ini.Section postSection = postIni.getSection(Ini.DEFAULT_SECTION_NAME);

        // 将动态权限之后的ini配置放入统一的ini配置片段中
        section.putAll(postSection);

        LOG.debug("=====Shiro安全规则=======================================================================");
        LOG.debug(section.entrySet());
        LOG.debug("=====Shiro安全规则=======================================================================");

        return section;
    }

    public void setPreFilterChainDefinitions(String preFilterChainDefinitions) {
        this.preFilterChainDefinitions = preFilterChainDefinitions;
    }

    public void setPostFilterChainDefinitions(String postFilterChainDefinitions) {
        this.postFilterChainDefinitions = postFilterChainDefinitions;
    }

    @Override
    public Class<?> getObjectType() {
        return this.getClass();
    }

    @Override
    public boolean isSingleton() {
        return false;
    }
}
