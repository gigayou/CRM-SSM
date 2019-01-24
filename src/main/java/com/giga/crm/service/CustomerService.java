package com.giga.crm.service;

import com.giga.crm.model.Customer;
import com.giga.crm.model.CustomerQueryVo;
import com.giga.crm.utils.Page;

public interface CustomerService {
	Page<Customer> queryCustomerByQueryVo(CustomerQueryVo customerQueryVo);

	Customer queryCustomerById(Long custId);

	void updateCustomer(Customer customer);

	void deleteCustomer(Long dictId);
}
