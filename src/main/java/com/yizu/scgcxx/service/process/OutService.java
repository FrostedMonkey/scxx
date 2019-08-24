package com.yizu.scgcxx.service.process;

import com.yizu.scgcxx.dto.StoreDto;
import com.yizu.scgcxx.model.Process;
import com.yizu.scgcxx.model.Store;

import java.util.List;

public interface OutService {
    List<Store> getUnout(StoreDto storeDto);

    void comOut(Integer rstoreId, Integer productId, Integer processId);

    List<Store> getAll(StoreDto storeDto);
}
