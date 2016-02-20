package com.usst.app.order.sale.saleWare.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang.StringUtils;

import com.usst.app.order.sale.saleWare.model.SaleWare;
import com.usst.code.ibatis.impl.PublicDAO;
import com.usst.code.service.BaseService;

public class SaleWareService extends BaseService<SaleWare> {
	public void deleteBySaleId(String saleId) throws Exception {
		if (StringUtils.isBlank(saleId)) {
			throw new Exception("saleId is null");
		}
		Map<String, String> param = new HashMap();
		param.put("saleId", saleId);
		this.publicDAO.delete("SaleWare.SaleWare", param);
	}

	public List<SaleWare> getWareBySaleId(String saleId) throws Exception {
		if (StringUtils.isBlank(saleId)) {
			throw new Exception("saleId is null");
		}
		Map<String, String> map = new HashMap();
		map.put("saleId", saleId);
		List<SaleWare> list = this.publicDAO.select("SaleWare.SaleWare", map);
		return list;
	}

	public List<SaleWare> getSaleDetailList(SaleWare saleware) {
		List<SaleWare> list = this.publicDAO.select("SaleWare.SaleWare_saledetail", saleware);
		return list;
	}

	public List<SaleWare> getSummaryList(SaleWare saleware) {
		List<SaleWare> list = this.publicDAO.select("SaleWare.SaleWare_summary", saleware);
		return list;
	}

	public List<String> getSaleWareByCustomerId(String customerId) throws Exception {
		if (customerId == null) {
			throw new Exception("customerId is null!");
		}
		Map<String, String> param = new HashMap();
		param.put("customerId", customerId);
		List<String> list = this.publicDAO.select("SaleWare.SaleWare_customerId", param);
		return list;
	}
}
