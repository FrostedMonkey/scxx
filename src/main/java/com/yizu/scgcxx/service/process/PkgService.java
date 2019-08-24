package com.yizu.scgcxx.service.process;

import com.yizu.scgcxx.model.Product;
import com.yizu.scgcxx.model.Store;

import java.math.BigDecimal;
import java.util.List;

public interface PkgService {
    List<Product> PkgDo();

    void addPkg(Product product, BigDecimal productResidue);
}
