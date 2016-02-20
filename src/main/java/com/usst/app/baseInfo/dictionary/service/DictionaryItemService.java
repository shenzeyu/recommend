package com.usst.app.baseInfo.dictionary.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang.StringUtils;

import com.usst.app.baseInfo.dictionary.model.DictionaryItem;
import com.usst.code.ibatis.impl.PublicDAO;
import com.usst.code.service.BaseService;
import com.usst.code.util.PageHelp;
import com.usst.code.util.PageInfo;

public class DictionaryItemService extends BaseService<DictionaryItem> {
	public List<DictionaryItem> list(DictionaryItem model, PageInfo pageInfo) {
		List<DictionaryItem> list = this.publicDAO.queryByCache("DictionaryItem.DictionaryItem", model, pageInfo);
		pageInfo.setCount(PageHelp.getTotalElements().intValue());
		PageHelp.clean();
		return list;
	}

	public DictionaryItem getDictionaryItemByCode(DictionaryItem model) throws Exception {
		if (model == null) {
			throw new Exception("Object Dictionary is null,can not query Dictionary Data");
		}
		DictionaryItem dictionaryItem = null;
		Map<String, String> map = new HashMap();
		map.put("code", model.getCode());
		map.put("dictionaryId", model.getDictionaryId());
		Object obj = super.selectOne(map);
		if (obj != null) {
			dictionaryItem = (DictionaryItem) obj;
		}
		return dictionaryItem;
	}

	public void deleteObjectByDictionaryId(String dictionaryId) throws Exception {
		if (StringUtils.isBlank(dictionaryId)) {
			throw new Exception("dictionaryId is null or empty,can not delete DictionaryItem Data");
		}
		Map<String, String> map = new HashMap();
		map.put("dictionaryId", dictionaryId);
		this.publicDAO.delete("DictionaryItem.DictionaryItem_by_dictionaryId", map);
	}
}
