package com.yizu.scgcxx.dao.process;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yizu.scgcxx.dto.ProcessDto;
import com.yizu.scgcxx.model.Process;

public interface RawclothDao {

    List<Process> getRawcloth(ProcessDto processDto);

    List<Process> getTotal();

    int addProcess(Process process);

    int deleteById(Integer processId);

    int updateById(@Param("processId") Integer processId, @Param("processStatus") String processStatus, @Param("username") String username);

    Process queryById(Integer processId);

    Process queryResidueById(@Param("planId") Integer planId, @Param("processId") Integer processId);

    int updateProcess(Process process);
}
