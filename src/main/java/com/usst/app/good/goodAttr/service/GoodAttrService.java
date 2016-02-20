package com.usst.app.good.goodAttr.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang.StringUtils;

import com.usst.app.good.goodAttr.model.GoodAttr;
import com.usst.code.ibatis.impl.PublicDAO;
import com.usst.code.service.BaseService;

public class GoodAttrService extends BaseService<GoodAttr> {
	public void deleteByKindId(String kindId) throws Exception {
		if (StringUtils.isBlank(kindId)) {
			throw new Exception("kindId is null");
		}
		Map<String, String> param = new HashMap();
		param.put("goodKindId", kindId);
		this.publicDAO.delete("GoodAttr.GoodAttr_goodKindId", param);
	}

	public List<GoodAttr> getGoodAttr(String goodId) throws Exception {
		if (StringUtils.isBlank(goodId)) {
			throw new Exception("goodId is null");
		}
		Map<String, String> param = new HashMap();
		param.put("goodId", goodId);
		List<GoodAttr> list = this.publicDAO.select("GoodAttr.GoodAttr_GoodAttrValue", param);
		return list;
	}

	public List<GoodAttr> getGoodAttrByGoodtypeId(String goodtypeId) throws Exception {
		if (StringUtils.isBlank(goodtypeId)) {
			throw new Exception("goodId is null");
		}
		Map<String, String> param = new HashMap();
		param.put("goodtypeId", goodtypeId);
		List<GoodAttr> list = this.publicDAO.select("GoodAttr.GoodAttr_goodtype", param);
		return list;
	}
}
