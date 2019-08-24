package com.yizu.scgcxx.service.plan;

import java.util.List;


import com.yizu.scgcxx.dto.ManagerDto;
import com.yizu.scgcxx.model.Plan;

public interface ManagerService {

    List<Plan> getMeanger(ManagerDto managerDto);

    int addManager(Plan plan);

    Plan queryById(Integer planId);

    int updateManagerById(Plan plan);

    int deleteManagerById(Integer planId);

    int updateManager(Plan plan);

    int deleteManagerByIds(Integer[] planIds);

    int updateByIds(Integer[] planIds, String username);

}
