package com.yizu.scgcxx.service.info.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yizu.scgcxx.dao.info.StandardDao;
import com.yizu.scgcxx.dto.StandardDto;
import com.yizu.scgcxx.model.Standard;
import com.yizu.scgcxx.service.info.StandardService;

@Service
public class StandardServiceImpl implements StandardService {
    @Autowired
    private StandardDao standardDao;

    @Override
    public List<Standard> getStandard(StandardDto standardDto) {
        return standardDao.queryStandard(standardDto);
    }

    @Override
    public int addStandard(Standard standard) {
        return standardDao.addStandard(standard);
    }

    @Override
    public int deleteById(Integer standardId) {

        return standardDao.deleteById(standardId);
    }

    @Override
    public int deleteByIds(Integer[] standard_ids) {

        return standardDao.deleteByIds(standard_ids);
    }

    @Override
    public int updateStandard(Standard standard) {
        // TODO Auto-generated method stub
        return standardDao.updateStandard(standard);
    }

    @Override
    public List<Standard> query(Standard standard) {
        // TODO Auto-generated method stub
        return standardDao.query(standard);
    }

    @Override
    public int updateState(Standard standard) {

        return standardDao.updateState(standard);
    }

    @Override
    public int updateStateByids(Integer[] standardIds, String standardStatus) {
        return standardDao.updateStateByids(standardIds, standardStatus);
    }

    @Override
    public Standard queryById(Integer standardId) {
        return standardDao.queryById(standardId);
    }

    @Override
    public List<Standard> standardQuery() {
        return standardDao.standardQuery();
    }

}
