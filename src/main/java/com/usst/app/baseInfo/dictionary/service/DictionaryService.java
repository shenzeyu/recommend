package com.usst.app.baseInfo.dictionary.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.usst.app.baseInfo.dictionary.model.Dictionary;
import com.usst.app.baseInfo.dictionary.model.DictionaryItem;
import com.usst.code.service.BaseService;

public class DictionaryService extends BaseService<Dictionary> {
	private DictionaryItemService dictionaryItemService;

	public Dictionary getDictionaryByCode(Dictionary model) throws Exception {
		if (model == null) {
			throw new Exception("Object Dictionary is null,can not query Dictionary Data");
		}
		Dictionary dictionary = null;
		Map<String, String> map = new HashMap();
		map.put("code", model.getCode());
		Object obj = super.selectOne(map);
		if (obj != null) {
			dictionary = (Dictionary) obj;
		}
		return dictionary;
	}

	public List<DictionaryItem> getDictionaryItems(Dictionary model) {
		List<DictionaryItem> list = null;
		Map<String, String> map = new HashMap();
		map.put("code", model.getCode());
		Dictionary dictionary = (Dictionary) super.selectOne(map);
		if (dictionary != null) {
			DictionaryItem dictionaryItem = new DictionaryItem();
			dictionaryItem.setDictionaryId(dictionary.getId());
			list = this.dictionaryItemService.select(dictionaryItem);
		}
		return list;
	}

	public List<Dictionary> getDictionaryList(Dictionary model) throws Exception {
		List<Dictionary> dictionaryList = null;
		dictionaryList = super.select(model);
		return dictionaryList;
	}

	public void setDictionaryItemService(DictionaryItemService dictionaryItemService) {
		this.dictionaryItemService = dictionaryItemService;
	}
}
