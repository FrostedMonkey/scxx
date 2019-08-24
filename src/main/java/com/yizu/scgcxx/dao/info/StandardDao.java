package com.yizu.scgcxx.dao.info;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.yizu.scgcxx.dto.StandardDto;
import com.yizu.scgcxx.model.Standard;

public interface StandardDao {
    /**
     * 查询产品规格信息
     *
     * @return
     */
    List<Standard> queryStandard(StandardDto standardDto);

    /**
     * 添加产品规格
     *
     * @param standard
     * @return
     */
    int addStandard(Standard standard);

    /**
     * 根据id删除
     *
     * @param standardId
     * @return
     */
    int deleteById(Integer standardId);

    /**
     * 多删除
     *
     * @param standard_ids
     * @return
     */
    int deleteByIds(Integer[] standard_ids);

    int updateStandard(Standard standard);

    List<Standard> query(Standard standard);

    int updateState(Standard standard);

    int updateStateByids(@Param("ids") Integer[] standardIds, @Param("standardStatus") String standardStatus);

    @Select("select * from info_standard where standard_id=#{standardId}")
    Standard queryById(Integer standardId);

    List<Standard> standardQuery();

}
