package com.usst.app.warehouse.warehouseMove.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang.StringUtils;

import com.usst.app.warehouse.warehouseInto.model.WarehouseIntoWare;
import com.usst.app.warehouse.warehouseMove.model.WarehouseMoveWare;
import com.usst.code.ibatis.impl.PublicDAO;
import com.usst.code.service.BaseService;

public class WarehouseMoveWareService extends BaseService<WarehouseMoveWare> {
	public void deleteByWarehouseMoveId(String warehouseMoveId) throws Exception {
		if (StringUtils.isBlank(warehouseMoveId)) {
			throw new Exception("warehouseMoveId is null");
		}
		Map<String, String> param = new HashMap();
		param.put("warehouseMoveId", warehouseMoveId);
		this.publicDAO.delete("WarehouseMoveWare.WarehouseMoveWare", param);
	}

	public List pageListTransfer(WarehouseMoveWare ware) {
		List<WarehouseIntoWare> result = this.publicDAO.select("WarehouseMoveWare.WarehouseMoveWare_Transfer", ware);
		return result;
	}

	public List pageListSummary(WarehouseMoveWare ware) {
		List<WarehouseIntoWare> result = this.publicDAO.select("WarehouseMoveWare.WarehouseMoveWare_Summary", ware);
		return result;
	}
}
