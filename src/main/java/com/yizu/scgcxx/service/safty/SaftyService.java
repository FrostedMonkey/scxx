package com.yizu.scgcxx.service.safty;

import com.yizu.scgcxx.model.Module;
import com.yizu.scgcxx.model.Role;
import com.yizu.scgcxx.model.User;

import java.util.List;

public interface SaftyService {

    List<Role> getRolesOfUser(String userId);

    List<Module> getModulesOfUser(String userId);

    User getUser(String userId);

    List<Module> getAllSubModules();

}

