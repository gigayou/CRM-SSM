package com.giga.crm.controller;

import com.giga.crm.model.BaseDict;
import com.giga.crm.model.Customer;
import com.giga.crm.model.CustomerQueryVo;
import com.giga.crm.service.BaseDictService;
import com.giga.crm.service.CustomerService;
import com.giga.crm.utils.Page;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
@RequestMapping("customer")
public class CustomerController {

	@Value("${CUSTOMER_SOURCE_KEY}")
	private String CUSTOMER_SOURCE_KEY;
	@Value("${CUSTOMER_INDUSTRY_KEY}")
	private String CUSTOMER_INDUSTRY_KEY;
	@Value("${CUSTOMER_LEVEL_KEY}")
	private String CUSTOMER_LEVEL_KEY;

	@Autowired
	private BaseDictService baseDictService;
	@Autowired
	private CustomerService customerService;

	@RequestMapping("list")
	public String list(CustomerQueryVo customerQueryVo, Model model){

		if (StringUtils.isNotBlank(customerQueryVo.getCustName())){
			try {
				customerQueryVo.setCustName(new String(
						customerQueryVo.getCustName().getBytes("ISO-8859-1"),
						"UTF-8"
				));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}

		List<BaseDict> fromType = baseDictService.queryBaseDictByTypeCode(CUSTOMER_SOURCE_KEY);
		List<BaseDict> industryType = baseDictService.queryBaseDictByTypeCode(CUSTOMER_INDUSTRY_KEY);
		List<BaseDict> levelType = baseDictService.queryBaseDictByTypeCode(CUSTOMER_LEVEL_KEY);

		Page<Customer> page = customerService.queryCustomerByQueryVo(customerQueryVo);

		model.addAttribute("page", page);
		model.addAttribute("fromType", fromType);
		model.addAttribute("industryType", industryType);
		model.addAttribute("levelType", levelType);

		return "customer";
	}

	@RequestMapping("edit")
	@ResponseBody
	public Customer editCustomerUI(Long id){
		Customer customer = customerService.queryCustomerById(id);

		return customer;
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	@ResponseBody
	public String updateCustomer(Customer customer){
		customerService.updateCustomer(customer);

		return "OK";
	}

	@RequestMapping(value = "delete", method = RequestMethod.POST)
	@ResponseBody
	public String deleteCustomer(Long id){
		customerService.deleteCustomer(id);

		return "OK";
	}

}
