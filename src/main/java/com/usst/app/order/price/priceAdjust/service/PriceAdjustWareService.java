package com.usst.app.order.price.priceAdjust.service;

import java.util.HashMap;
import java.util.Map;
import org.apache.commons.lang.StringUtils;

import com.usst.app.order.price.priceAdjust.model.PriceAdjustWare;
import com.usst.code.ibatis.impl.PublicDAO;
import com.usst.code.service.BaseService;

public class PriceAdjustWareService extends BaseService<PriceAdjustWare> {
	public void deleteByOrderId(String orderId) throws Exception {
		if (StringUtils.isBlank(orderId)) {
			throw new Exception("orderId is null");
		}
		Map<String, String> param = new HashMap();
		param.put("orderId", orderId);
		this.publicDAO.delete("PriceAdjustWare.PriceAdjustWare", param);
	}
}
