package com.yizu.scgcxx.dao.process;

import com.yizu.scgcxx.model.Process;
import com.yizu.scgcxx.model.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PkgDao {
    List<Product> PkgDo();

    void addPkg(Product product);

    Process queryTotalYu(Integer processId);

    void updateProduct(@Param("processId") Integer processId, @Param("productId") Integer productId, @Param("productStatus") String productStatus);

    void updateProcess(@Param("processId") Integer processId, @Param("processStatus") String processStatus);
}
