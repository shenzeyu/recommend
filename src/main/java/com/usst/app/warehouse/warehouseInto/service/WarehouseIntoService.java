package com.usst.app.warehouse.warehouseInto.service;

import java.util.HashMap;
import java.util.Map;
import org.apache.commons.lang.StringUtils;

import com.usst.app.warehouse.warehouseInto.model.WarehouseInto;
import com.usst.code.ibatis.impl.PublicDAO;
import com.usst.code.service.BaseService;

public class WarehouseIntoService extends BaseService<WarehouseInto> {
	public WarehouseInto getWarehouseIntoByOrderId(String orderId) throws Exception {
		if (StringUtils.isBlank(orderId)) {
			throw new Exception("orderId is null");
		}
		Map<String, String> param = new HashMap();
		param.put("orderId", orderId);
		param.put("type", "0");
		WarehouseInto warehouseInto = (WarehouseInto) this.publicDAO.selectOne("WarehouseInto.WarehouseInto", param);
		return warehouseInto;
	}
}
