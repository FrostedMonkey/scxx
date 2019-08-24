package com.yizu.scgcxx.service.safty;

import java.util.List;

import com.yizu.scgcxx.dto.MenuDto;
import com.yizu.scgcxx.model.Module;

public interface HomeService {

    List<MenuDto> getMenus(String Uid);

    List<Module> getMobileMenus();

}
