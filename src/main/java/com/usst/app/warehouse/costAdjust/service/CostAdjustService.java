package com.usst.app.warehouse.costAdjust.service;

import java.util.HashMap;
import java.util.Map;
import org.apache.commons.lang.StringUtils;

import com.usst.app.warehouse.costAdjust.model.CostAdjust;
import com.usst.code.ibatis.impl.PublicDAO;
import com.usst.code.service.BaseService;

public class CostAdjustService extends BaseService<CostAdjust> {
	public void deleteByOrderId(String orderId) throws Exception {
		if (StringUtils.isBlank(orderId)) {
			throw new Exception("orderId is null");
		}
		Map<String, String> param = new HashMap();
		param.put("orderId", orderId);
		this.publicDAO.delete("CostAdjustWare.CostAdjustWare", param);
	}
}
