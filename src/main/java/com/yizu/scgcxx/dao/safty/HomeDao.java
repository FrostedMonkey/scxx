package com.yizu.scgcxx.dao.safty;

import java.util.List;

import com.yizu.scgcxx.model.Module;


public interface HomeDao {

    List<Module> findMenus(String uid);

    List<Module> getMobileMenus();

}
