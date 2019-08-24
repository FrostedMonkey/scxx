package com.yizu.scgcxx.dao.info;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import com.yizu.scgcxx.dto.ColorDto;
import com.yizu.scgcxx.model.Color;

public interface ColorDao {
    public void adColor(Color color);

    public void deColor(Integer id);

    public void deleteAlColor(Integer[] ids);

    public void upColor(Color color);

    @Select("select * from info_color where co_id=#{coId}")
    public Color findColorById(Integer coId);

    public void updateSt(Integer[] coId, String coStatus);

    public List<Color> findColor(ColorDto dto);

    public List<Color> colorQuery();

}
