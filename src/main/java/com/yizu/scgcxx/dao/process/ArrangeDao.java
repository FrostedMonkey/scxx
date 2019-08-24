package com.yizu.scgcxx.dao.process;

import com.yizu.scgcxx.dto.ProcessDto;
import com.yizu.scgcxx.model.Process;

import java.util.List;

public interface ArrangeDao {

    List<Process> getUnArrange(ProcessDto processDto);

    List<Process> getArrange(ProcessDto processDto);

    int completeArrange(Process process);

    List<Process> getAll(ProcessDto processDto);
}
