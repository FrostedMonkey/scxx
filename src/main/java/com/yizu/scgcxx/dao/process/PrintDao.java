package com.yizu.scgcxx.dao.process;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yizu.scgcxx.dto.DyeDto;
import com.yizu.scgcxx.model.Process;

public interface PrintDao {

    List<Process> getPrint(@Param("status3") String status3, @Param("status4") String status4);

    int updateStstus(DyeDto dyeDto);

    List<Process> getPrintHou();

}
