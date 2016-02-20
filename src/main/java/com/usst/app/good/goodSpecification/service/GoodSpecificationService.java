package com.usst.app.good.goodSpecification.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang.StringUtils;

import com.usst.app.good.goodSpecification.model.GoodSpecification;
import com.usst.code.ibatis.impl.PublicDAO;
import com.usst.code.service.BaseService;

public class GoodSpecificationService extends BaseService<GoodSpecification> {
	public List<GoodSpecification> getWareSpecification(String wareId) {
		if (StringUtils.isBlank(wareId)) {
			return null;
		}
		Map<String, String> param = new HashMap();
		param.put("wareId", wareId);
		List<GoodSpecification> list = this.publicDAO.select("GoodSpecification.GoodSpecification_ware", param);
		return list;
	}
}
