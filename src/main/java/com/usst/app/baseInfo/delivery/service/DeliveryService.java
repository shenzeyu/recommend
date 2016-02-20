package com.usst.app.baseInfo.delivery.service;

import java.util.HashMap;
import java.util.Map;

import com.usst.app.baseInfo.delivery.model.Delivery;
import com.usst.code.ibatis.impl.PublicDAO;
import com.usst.code.service.BaseService;

public class DeliveryService extends BaseService<Delivery> {
	public Delivery getDelivery(Delivery delivery) throws Exception {
		if (delivery == null) {
			throw new Exception("DeliverWay is null,can not query");
		}
		Delivery way = null;
		Map<String, String> map = new HashMap();
		map.put("code", delivery.getCode());
		Object obj = this.publicDAO.selectOne("Delivery.Delivery", map);
		if (obj != null) {
			way = (Delivery) obj;
		}
		return way;
	}
}
