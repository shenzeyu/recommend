package com.usst.app.order.sale.saleCollection.service;

import java.util.HashMap;
import java.util.Map;
import org.apache.commons.lang.StringUtils;

import com.usst.app.order.sale.saleCollection.model.SaleCollectionItem;
import com.usst.code.ibatis.impl.PublicDAO;
import com.usst.code.service.BaseService;

public class SaleCollectionItemService extends BaseService<SaleCollectionItem> {
	public void deleteItemByCollectionId(String collectionId) throws Exception {
		if (StringUtils.isBlank(collectionId)) {
			throw new Exception("collectionId is null");
		}
		Map<String, String> param = new HashMap();
		param.put("collectionId", collectionId);
		this.publicDAO.delete("SaleCollectionItem.SaleCollectionItem", param);
	}

	public SaleCollectionItem getSaleCollectionBycollectionId(String collectionId) throws Exception {
		if (StringUtils.isBlank(collectionId)) {
			throw new Exception("collectionId is null");
		}
		Map<String, String> param = new HashMap();
		param.put("collectionId", collectionId);
		SaleCollectionItem list = (SaleCollectionItem) this.publicDAO.selectOne("SaleCollectionItem.SaleCollectionItem",
				param);
		return list;
	}
}
