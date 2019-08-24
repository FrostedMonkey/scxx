package com.yizu.scgcxx.dao.safty;

import org.apache.ibatis.annotations.Param;

public interface UrDao {

    int addUr(@Param("roleIds") Integer[] roleIds, @Param("uId") String uId);

    int deleteAllUr(String uId);

    int updUserPwd(String getuId, String newPwd);
}
