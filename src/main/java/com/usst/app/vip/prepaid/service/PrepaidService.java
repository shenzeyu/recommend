package com.usst.app.vip.prepaid.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.usst.app.vip.prepaid.model.Prepaid;
import com.usst.code.ibatis.impl.PublicDAO;
import com.usst.code.service.BaseService;

public class PrepaidService extends BaseService<Prepaid> {
	public List<Prepaid> getTotalMoney(String code, String customerName) throws Exception {
		if (code == null) {
			throw new Exception("code is null");
		}
		Map<String, String> map = new HashMap();
		map.put("code", code);
		map.put("customerName", customerName);
		List<Prepaid> list = this.publicDAO.select("Prepaid.Prepaid_sum_query", map);
		return list;
	}
}
