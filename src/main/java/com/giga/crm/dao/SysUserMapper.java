package com.giga.crm.dao;

import com.giga.crm.model.SysUser;

public interface SysUserMapper {
    int deleteByPrimaryKey(Long user_id);

    int insert(SysUser record);

    int insertSelective(SysUser record);

    SysUser selectByPrimaryKey(Long user_id);

    int updateByPrimaryKeySelective(SysUser record);

    int updateByPrimaryKey(SysUser record);
}