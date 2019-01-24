package com.giga.crm.service.impl;

import com.giga.crm.dao.BaseDictMapper;
import com.giga.crm.model.BaseDict;
import com.giga.crm.service.BaseDictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BaseDictServiceImpl implements BaseDictService {

	@Autowired
	private BaseDictMapper baseDictMapper;

	@Override
	public List<BaseDict> queryBaseDictByTypeCode(String dictTypeCode) {
		return baseDictMapper.selectBaseDictByTypeCode(dictTypeCode);
	}
}
