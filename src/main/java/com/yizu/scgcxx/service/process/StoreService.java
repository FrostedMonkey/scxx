package com.yizu.scgcxx.service.process;

import java.util.List;


import com.yizu.scgcxx.dto.StoreDto;
import com.yizu.scgcxx.model.Store;

public interface StoreService {

    List<Store> getStore(String status);

    void updStore(StoreDto storeDto);

    List<Store> getStoreAfter();

}
