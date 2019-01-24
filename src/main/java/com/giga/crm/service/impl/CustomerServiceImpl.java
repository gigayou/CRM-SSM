package com.giga.crm.service.impl;

import com.giga.crm.dao.CustomerMapper;
import com.giga.crm.model.Customer;
import com.giga.crm.model.CustomerQueryVo;
import com.giga.crm.service.CustomerService;
import com.giga.crm.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerMapper customerMapper;

	@Override
	public Page<Customer> queryCustomerByQueryVo(CustomerQueryVo customerQueryVo) {
		customerQueryVo.setStart((customerQueryVo.getPage() - 1) * customerQueryVo.getRows());
		List<Customer> customers = customerMapper.queryCustomerByQueryVo(customerQueryVo);
		Integer count = customerMapper.queryCountByQueryVo(customerQueryVo);

		Page<Customer> page = new Page<>(count, customerQueryVo.getPage(),
				customerQueryVo.getRows(), customers);
		return page;
	}

	@Override
	public Customer queryCustomerById(Long custId) {
		return customerMapper.selectByPrimaryKey(custId);
	}

	@Override
	public void updateCustomer(Customer customer) {
		customerMapper.updateByPrimaryKeySelective(customer);
	}

	@Override
	public void deleteCustomer(Long dictId) {
		customerMapper.deleteByPrimaryKey(dictId);
	}
}
