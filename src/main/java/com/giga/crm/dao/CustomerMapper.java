package com.giga.crm.dao;

import com.giga.crm.model.Customer;
import com.giga.crm.model.CustomerQueryVo;

import java.util.List;

public interface CustomerMapper {
    int deleteByPrimaryKey(Long cust_id);

    int insert(Customer record);

    int insertSelective(Customer record);

    Customer selectByPrimaryKey(Long cust_id);

    int updateByPrimaryKeySelective(Customer record);

    int updateByPrimaryKey(Customer record);

    List<Customer> queryCustomerByQueryVo(CustomerQueryVo customerQueryVo);

    Integer queryCountByQueryVo(CustomerQueryVo customerQueryVo);
}