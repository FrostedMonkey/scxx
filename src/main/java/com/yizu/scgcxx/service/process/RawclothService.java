package com.yizu.scgcxx.service.process;

import java.util.List;

import com.yizu.scgcxx.dto.ProcessDto;
import com.yizu.scgcxx.model.Process;

public interface RawclothService {

    List<Process> getRawcloth(ProcessDto processDto);

    List<Process> getTotal();

    int addProcess(Process process);

    int deleteById(Integer processId);

    int updateById(Integer processId, String processStatus, String username);

    Process queryById(Integer processId);

    Process queryResidueById(Integer planId, Integer processId);

    int updateProcess(Process process);


}
