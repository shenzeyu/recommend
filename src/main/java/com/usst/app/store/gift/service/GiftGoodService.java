package com.usst.app.store.gift.service;

import java.util.HashMap;
import java.util.Map;
import org.apache.commons.lang.StringUtils;

import com.usst.app.store.gift.model.GiftGood;
import com.usst.code.ibatis.impl.PublicDAO;
import com.usst.code.service.BaseService;

public class GiftGoodService extends BaseService<GiftGood> {
	public void deleteByPromoteId(String intoId) throws Exception {
		if (StringUtils.isBlank(intoId)) {
			throw new Exception("intoId is null");
		}
		Map<String, String> param = new HashMap();
		param.put("promoteId", intoId);
		this.publicDAO.delete("GiftGood.GiftGood", param);
	}
}
