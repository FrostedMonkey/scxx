package com.yizu.scgcxx.service.process.impl;

import com.yizu.scgcxx.dao.process.PkgDao;
import com.yizu.scgcxx.model.Process;
import com.yizu.scgcxx.model.Product;
import com.yizu.scgcxx.service.process.PkgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

@Service
public class PkgServicecImpl implements PkgService {
    @Autowired
    private PkgDao pkgDao;

    @Override
    public List<Product> PkgDo() {
        return pkgDao.PkgDo();
    }

    @Override
    public void addPkg(Product product, BigDecimal productResidue) {


        //40 包装中   50 已包装
        Process pro = pkgDao.queryTotalYu(product.getProcessId());//质检的这一批货物中未打包的
        System.out.println("TotalYus" + pro.getProcessTotal2());
        if (productResidue.compareTo(product.getStoreNum()) == 0) {//如果打包的量等于这个等级的剩余量
            System.out.println("111111");
            product.setProductStatus("50");
            pkgDao.addPkg(product);//添加
            pkgDao.updateProduct(null, product.getProductId(), "50");//修改product表的相应品级的状态为已打包
        } else {
            System.out.println("22222");
            product.setProductStatus("50");
            pkgDao.addPkg(product);//添加
            pkgDao.updateProduct(null, product.getProductId(), "40");

        }
        System.out.println(product.getStoreNum().compareTo(pro.getProcessTotal2()));
        if (product.getStoreNum().compareTo(pro.getProcessTotal2()) == 0) {
            System.out.println("3333");
            pkgDao.updateProduct(product.getProcessId(), null, "50");
            pkgDao.updateProcess(product.getProcessId(), "50");
        } else {
            System.out.println("4444");
            pkgDao.updateProcess(product.getProcessId(), "40");
        }
    }
}
