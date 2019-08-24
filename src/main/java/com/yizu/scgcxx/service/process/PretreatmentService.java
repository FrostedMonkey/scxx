package com.yizu.scgcxx.service.process;

import com.yizu.scgcxx.dto.ProcessDto;
import com.yizu.scgcxx.model.Process;

import java.util.List;

public interface PretreatmentService {
    List<Process> getUnPretreatment(ProcessDto processDto);

    List<Process> getPretreatment(ProcessDto processDto);

    List<Process> getAll(ProcessDto processDto);

    int completePre(Process process);
}
