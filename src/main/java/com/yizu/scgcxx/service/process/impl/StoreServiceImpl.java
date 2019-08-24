package com.yizu.scgcxx.service.process.impl;

import java.util.List;

import com.yizu.scgcxx.service.process.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yizu.scgcxx.dao.process.StoreDao;
import com.yizu.scgcxx.dto.StoreDto;
import com.yizu.scgcxx.model.Store;


@Service
public class StoreServiceImpl implements StoreService {

    @Autowired
    StoreDao storeDao;

    @Override
    public List<Store> getStore(String status) {

        return storeDao.getStore(status);
    }

    @Override
    public void updStore(StoreDto storeDto) {
        //操作store表  更改当前包的状态  为 60
        storeDto.setStoreStatus("60");
        storeDao.updStore(storeDto);

        //1.拿到同一产品下的所有  打包 中 状态     最晚的状态
        String storeStatus = storeDao.getStoreStatus(storeDto.getProductId());

        //操作product 表
        //如果 store 表里  最晚的状态为 60  则该   产品 状态改为60

		/*if(storeStatus.equals("60")){
			storeDao.updProductStatus("60", storeDto.getProductId());	
		}else{
			storeDao.updProductStatus("55", storeDto.getProductId());	
		}*/

        storeDao.updProductStatus(storeStatus, storeDto.getProductId());


        //操作process  表
        //1.拿到product  表 同一组 下所有产品  中的最晚状态
        String productStatus = storeDao.getProductStatus(storeDto.getProductId());

        if (productStatus.equals("60")) {//如果Product 同组  最晚状态为 60  这组 为 60
            storeDao.updateProcessStatus("60", storeDto.getProductId());
            storeDao.updProductAllStatus(storeDto.getProductId());
        } else {
            storeDao.updateProcessStatus("55", storeDto.getProductId());
        }

    }

    @Override
    public List<Store> getStoreAfter() {
        List<Store> list = storeDao.getStoreAfter();
        for (Store store : list) {
            if (store.getStoreStatus().equals("60")) {
                store.setStoreStatus("已入库");
            }
            if (store.getStoreStatus().equals("70")) {
                store.setStoreStatus("已交货");
            }
        }
        return list;
    }


}
