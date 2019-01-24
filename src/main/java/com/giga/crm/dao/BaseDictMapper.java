package com.giga.crm.dao;

import com.giga.crm.model.BaseDict;

import java.util.List;

public interface BaseDictMapper {
    int deleteByPrimaryKey(String dict_id);

    int insert(BaseDict record);

    int insertSelective(BaseDict record);

    BaseDict selectByPrimaryKey(String dict_id);

    int updateByPrimaryKeySelective(BaseDict record);

    int updateByPrimaryKey(BaseDict record);

    List<BaseDict> selectBaseDictByTypeCode(String dictTypeCode);
}