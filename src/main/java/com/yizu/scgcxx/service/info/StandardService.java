package com.yizu.scgcxx.service.info;

import java.util.List;

import com.yizu.scgcxx.dto.StandardDto;
import com.yizu.scgcxx.model.Standard;

public interface StandardService {
    /**
     * 查询产品规格表
     *
     * @return
     */
    public List<Standard> getStandard(StandardDto standardDto);

    /**
     * 添加产品规格信息
     *
     * @param standard
     * @return
     */
    public int addStandard(Standard standard);

    /**
     * 根据id删除一条数据
     *
     * @param standardId
     * @return
     */
    public int deleteById(Integer standardId);

    /**
     * 删除多条
     *
     * @param standard_ids
     * @return
     */
    public int deleteByIds(Integer[] standard_ids);

    public int updateStandard(Standard standard);

    public List<Standard> query(Standard standard);

    public int updateState(Standard standard);

    public int updateStateByids(Integer[] standardIds, String standardStatus);

    public Standard queryById(Integer standardId);

    public List<Standard> standardQuery();
}
