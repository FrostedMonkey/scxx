package com.yizu.scgcxx.service.process;

import com.yizu.scgcxx.dto.ProcessDto;
import com.yizu.scgcxx.model.Process;

import java.math.BigDecimal;
import java.util.List;

public interface CheckService {
    List<Process> getAll(ProcessDto processDto);

    void addCheck(Process process, BigDecimal nums);
}
