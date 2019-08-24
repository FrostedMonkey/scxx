package com.yizu.scgcxx.dao.process;

import com.yizu.scgcxx.dto.StoreDto;

import com.yizu.scgcxx.model.Product;
import com.yizu.scgcxx.model.Store;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OutDao {
    List<Store> getUnout(StoreDto storeDto);

    void updateStore(@Param("storeId") Integer storeId, @Param("storeOutPer") String storeOutPer);

    List<Store> queryStore(Integer productId);

    void updateProduct(@Param("productId") Integer productId, @Param("productStatus") String productStatus);

    List<Product> queryProduct(Integer processId);

    void updateProcess(@Param("processId") Integer processId, @Param("processStatus") String processStatus);

    List<Store> getAll(StoreDto storeDto);
}
