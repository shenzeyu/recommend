package com.usst.app.order.sale.saleCollection.service;

import java.util.HashMap;
import java.util.Map;
import org.apache.commons.lang.StringUtils;

import com.usst.app.order.sale.saleCollection.model.SaleCollection;
import com.usst.code.ibatis.impl.PublicDAO;
import com.usst.code.service.BaseService;

public class SaleCollectionService extends BaseService<SaleCollection> {
	public SaleCollection getSaleCollectionByOrderId(String orderId) throws Exception {
		if (StringUtils.isBlank(orderId)) {
			throw new Exception("orderId is null");
		}
		Map<String, String> param = new HashMap();
		param.put("orderId", orderId);
		SaleCollection saleCollection = (SaleCollection) this.publicDAO.selectOne("SaleCollection.SaleCollection",
				param);
		return saleCollection;
	}
}
