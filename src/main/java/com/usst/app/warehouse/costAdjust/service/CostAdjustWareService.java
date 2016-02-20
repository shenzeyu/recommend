package com.usst.app.warehouse.costAdjust.service;

import java.util.HashMap;
import java.util.Map;
import org.apache.commons.lang.StringUtils;

import com.usst.app.warehouse.costAdjust.model.CostAdjustWare;
import com.usst.code.ibatis.impl.PublicDAO;
import com.usst.code.service.BaseService;

public class CostAdjustWareService extends BaseService<CostAdjustWare> {
	public void deleteByIntoId(String intoId) throws Exception {
		if (StringUtils.isBlank(intoId)) {
			throw new Exception("intoId is null");
		}
		Map<String, String> param = new HashMap();
		param.put("orderId", intoId);
		this.publicDAO.delete("CostAdjustWare.CostAdjustWare", param);
	}
}
