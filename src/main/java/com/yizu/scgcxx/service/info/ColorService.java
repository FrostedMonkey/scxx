package com.yizu.scgcxx.service.info;

import java.util.List;

import com.yizu.scgcxx.dto.ColorDto;
import com.yizu.scgcxx.model.Color;

public interface ColorService {
    public List<Color> queryColor(ColorDto dto);

    public void addColor(Color color);

    public void deleteColor(Integer coId);

    public void updateColor(Color color);

    public void deleteAllColor(Integer[] ids);

    public Color getColor(Integer coId);

    public void updateSa(Integer[] coId, String coStatus);

    public List<Color> colorQuery();

}