package com.yizu.scgcxx.service.process.impl;

import com.yizu.scgcxx.commons.BusinessStatus;
import com.yizu.scgcxx.dao.process.OutDao;
import com.yizu.scgcxx.dto.StoreDto;
import com.yizu.scgcxx.model.Process;
import com.yizu.scgcxx.model.Product;
import com.yizu.scgcxx.model.Store;
import com.yizu.scgcxx.model.User;
import com.yizu.scgcxx.service.process.OutService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OutServiceImpl implements OutService {
    @Autowired
    private OutDao outDao;

    @Override
    public List<Store> getUnout(StoreDto storeDto) {
        return outDao.getUnout(storeDto);
    }

    @Override
    public void comOut(Integer storeId, Integer productId, Integer processId) {
        //查询store（productId） 都成70状态 去改变 product状态（70）
        //查询product(processId) product表不为0 都成70状态 去改变process表

        /**
         * 更新store对应数据状态
         */
        Subject subject = SecurityUtils.getSubject();
        User user = (User) subject.getPrincipal();
        outDao.updateStore(storeId, user.getuName());//更新stroe状态

        /**
         * 更改product表状态
         */
        List<Store> list = outDao.queryStore(productId);
     /*   if(list.get(0).getStoreStatus().equals("70")){//最小的等于70
            outDao.updateProduct(productId,"70");//更新product状态
        }else{
            outDao.updateProduct(productId,list.get(0).getStoreStatus());
        }*/
        outDao.updateProduct(productId, list.get(0).getStoreStatus());
        /**
         * 更改procecss表状态
         */
        List<Product> list2 = outDao.queryProduct(processId);

        if (list2.get(0).getProductStatus().equals("70")) {

            outDao.updateProcess(processId, "70");
        } else {

            outDao.updateProcess(processId, list2.get(0).getProductStatus());
        }


    }

    @Override
    public List<Store> getAll(StoreDto storeDto) {
        List<Store> list = outDao.getAll(storeDto);
        for (Store s : list
        ) {
            s.setStoreStatus(BusinessStatus.getName(s.getStoreStatus()));

        }
        return list;
    }
}
