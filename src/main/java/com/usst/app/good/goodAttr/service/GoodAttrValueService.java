package com.usst.app.good.goodAttr.service;

import java.util.HashMap;
import java.util.Map;

import com.usst.app.good.goodAttr.model.GoodAttrValue;
import com.usst.code.ibatis.impl.PublicDAO;
import com.usst.code.service.BaseService;

public class GoodAttrValueService extends BaseService<GoodAttrValue> {
	public void deleteByGoodId(String goodId) {
		Map<String, String> map = new HashMap();
		map.put("goodId", goodId);
		this.publicDAO.delete("GoodAttrValue.GoodAttrValue_goodId", map);
	}
}
