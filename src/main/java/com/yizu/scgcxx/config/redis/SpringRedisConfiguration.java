package com.yizu.scgcxx.config.redis;

import java.lang.reflect.Method;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.CachingConfigurer;
import org.springframework.cache.annotation.CachingConfigurerSupport;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.interceptor.KeyGenerator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.connection.RedisConnectionFactory;

@Configuration
@EnableCaching
public class SpringRedisConfiguration {

    private static Logger LOG = LoggerFactory.getLogger(SpringRedisConfiguration.class);

    @Bean
    @Resource
    public RedisCacheManager cacheManager(RedisConnectionFactory connectionFactory) {

        RedisCacheManager redisCacheManager = RedisCacheManager.create(connectionFactory);
        LOG.info("Bean：对象redisCacheManager创建加载成功！");
        return redisCacheManager;
    }

    @Bean
    public KeyGenerator keyGenerator() {

        /*
         * String : 内容不可改变的字符串
         * StringBuider: 内容可改变的字符容器，线程不安全，效率较高
         * StringBuffer: 内容可改变的字符容器，线程安全，效率较低
         *
         *
         */

        KeyGenerator keyGenerator = new KeyGenerator() {

            @Override
            public Object generate(Object target, Method method, Object... params) {
                StringBuilder sb = new StringBuilder()
                        .append(target.getClass().getName())
                        .append(".")
                        .append(method.getName())
                        .append("(");
                for (int i = 0; i < params.length; i++) {
                    if (i == 0) {
                        sb.append(params[i].toString());
                    } else {
                        sb.append(",").append(params[i].toString());
                    }

                }
                sb.append(")");

                LOG.info("缓存key===>" + sb.toString());
                return sb.toString();
            }

        };

        LOG.info("Bean：对象keyGenerator创建加载成功！");

        return keyGenerator;

    }

    @Bean
    @Resource
    public CachingConfigurer cachingConfigurer(CacheManager cacheManager, KeyGenerator keyGenerator) {

        CachingConfigurer redisCachingConfigurer = new CachingConfigurerSupport() {
            @Override
            public CacheManager cacheManager() {
                return cacheManager;
            }

            @Override
            public KeyGenerator keyGenerator() {
                return keyGenerator;
            }
        };
        LOG.info("Bean：对象redisCachingConfigurer创建加载成功！");
        return redisCachingConfigurer;
    }
}
