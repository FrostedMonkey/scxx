package com.yizu.scgcxx.dao.process;

import com.yizu.scgcxx.dto.ProcessDto;
import com.yizu.scgcxx.model.Process;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.PathVariable;

import java.math.BigDecimal;
import java.util.List;

public interface CheckDao {
    List<Process> getAll(ProcessDto processDto);

    int queryMessage(@Param("processId") Integer processId, @Param("productLevel") String s);

    void AddMessageDuct(Process p);

    void updateDuct(Process p);


    void updateProcess(Process p);

    void updateNull(Integer processId);
}
