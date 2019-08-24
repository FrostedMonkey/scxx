package com.yizu.scgcxx.dao.plan;

import java.util.List;


import org.apache.ibatis.annotations.Param;

import com.yizu.scgcxx.dto.ManagerDto;
import com.yizu.scgcxx.model.Plan;

public interface ManagerDao {

    List<Plan> getMeanger(ManagerDto managerDto);

    int addManager(Plan plan);

    Plan queryById(Integer planId);

    int updateManagerById(Plan plan);

    int deleteManagerById(Integer planId);

    int updateManager(Plan plan);

    int deleteManagerByIds(Integer[] planIds);

    int updateByIds(@Param("planIds") Integer[] planIds, @Param("username") String username);

}
