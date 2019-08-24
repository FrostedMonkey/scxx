package com.yizu.scgcxx.dao.process;

import java.util.List;

import com.yizu.scgcxx.model.Process;
import com.yizu.scgcxx.dto.ProcessDto;

public interface DyeDao {

    List<Process> getDye(ProcessDto processDto);

    int completeDyeById(Process process);

    List<Process> getCompleteDye(ProcessDto processDto);

    List<Process> getAll();
}
