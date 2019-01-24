package com.giga.crm.service;

import com.giga.crm.model.BaseDict;

import java.util.List;

public interface BaseDictService {

	List<BaseDict> queryBaseDictByTypeCode(String dictTypeCode);
}
