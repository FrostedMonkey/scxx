package com.yizu.scgcxx.dao.process;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yizu.scgcxx.dto.StoreDto;
import com.yizu.scgcxx.model.Store;

public interface StoreDao {

    List<Store> getStore(String status);

    String getStoreStatus(Integer id);

    void updStore(StoreDto storeDto);

    void updProductStatus(@Param("productStatus") String productStatus, @Param("productId") Integer productId);

    String getProductStatus(Integer productId);

    void updateProcessStatus(@Param("status") String status, @Param("productId") Integer productId);

    void updProductAllStatus(Integer productId);

    List<Store> getStoreAfter();
}
