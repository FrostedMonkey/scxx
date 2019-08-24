package com.yizu.scgcxx.service.info.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yizu.scgcxx.dao.info.ColorDao;
import com.yizu.scgcxx.dto.ColorDto;
import com.yizu.scgcxx.model.Color;
import com.yizu.scgcxx.service.info.ColorService;

@Service
public class ColorServiceImpl implements ColorService {
    @Autowired
    private ColorDao colorDao;

    @Override
    public List<Color> queryColor(ColorDto dto) {
        return colorDao.findColor(dto);
    }

    @Override
    public void addColor(Color color) {
        colorDao.adColor(color);
    }

    @Override
    public void deleteColor(Integer id) {
        colorDao.deColor(id);
    }

    @Override
    public void deleteAllColor(Integer[] ids) {
        for (Integer id : ids) {
            colorDao.deColor(id);
        }
    }

    @Override
    public void updateColor(Color color) {
        colorDao.upColor(color);
    }

    @Override
    public void updateSa(Integer[] coId, String coStatus) {
        colorDao.updateSt(coId, coStatus);

    }

    @Override
    public Color getColor(Integer coId) {
        return colorDao.findColorById(coId);
    }

    @Override
    public List<Color> colorQuery() {

        return colorDao.colorQuery();
    }
}
