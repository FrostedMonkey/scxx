package com.yizu.scgcxx.service.process;

import java.util.List;

import com.yizu.scgcxx.model.Process;
import com.yizu.scgcxx.dto.ProcessDto;

public interface DyeService {

    List<Process> getDye(ProcessDto processDto);

    int completeDyeById(Process process);

    List<Process> getCompleteDye(ProcessDto processDto);

    List<Process> getAll();
}
