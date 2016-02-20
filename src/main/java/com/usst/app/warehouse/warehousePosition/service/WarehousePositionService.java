package com.usst.app.warehouse.warehousePosition.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang.StringUtils;

import com.usst.app.warehouse.warehousePosition.model.WarehousePosition;
import com.usst.code.ibatis.impl.PublicDAO;
import com.usst.code.service.BaseService;

public class WarehousePositionService extends BaseService<WarehousePosition> {
	public List<WarehousePosition> getWarehousePositionValByWarehouseId(String warehouseId) {
		if (StringUtils.isBlank(warehouseId)) {
			return null;
		}
		Map<String, String> param = new HashMap();
		param.put("warehouseId", warehouseId);

		List<WarehousePosition> list = this.publicDAO.select("WarehousePosition.WarehousePosition", param);
		return list;
	}

	public List<WarehousePosition> getByWareId(String warehouseId, String wareId) throws Exception {
		if (StringUtils.isBlank(warehouseId)) {
			throw new Exception("warehouseId is null");
		}
		if (StringUtils.isBlank(wareId)) {
			throw new Exception("wareId is null");
		}
		Map<String, String> param = new HashMap();
		param.put("warehouseId", warehouseId);
		param.put("wareId", wareId);

		List<WarehousePosition> list = this.publicDAO.select("WarehousePosition.WarehousePosition_wareId", param);
		return list;
	}
}
