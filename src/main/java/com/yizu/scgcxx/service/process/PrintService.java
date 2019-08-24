package com.yizu.scgcxx.service.process;

import java.util.List;

import com.yizu.scgcxx.dto.DyeDto;
import com.yizu.scgcxx.model.Process;


public interface PrintService {

    List<Process> getPrint(String status, String status4);

    int updateStstus(DyeDto dyeDto);

    List<Process> getPrintHou();

}
