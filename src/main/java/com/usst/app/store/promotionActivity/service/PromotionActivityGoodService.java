package com.usst.app.store.promotionActivity.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang.StringUtils;

import com.usst.app.store.promotionActivity.model.PromotionActivityGood;
import com.usst.code.ibatis.impl.PublicDAO;
import com.usst.code.service.BaseService;

public class PromotionActivityGoodService extends BaseService<PromotionActivityGood> {
	private PromotionActivityGoodService promotionActivityGoodService;

	public PromotionActivityGoodService getPromotionActivityGoodService() {
		return this.promotionActivityGoodService;
	}

	public void setPromotionActivityGoodService(PromotionActivityGoodService promotionActivityGoodService) {
		this.promotionActivityGoodService = promotionActivityGoodService;
	}

	public void deleteByPromoteId(String intoId) throws Exception {
		if (StringUtils.isBlank(intoId)) {
			throw new Exception("intoId is null");
		}
		Map<String, String> param = new HashMap();
		param.put("promoteId", intoId);
		this.publicDAO.delete("PromotionActivityGood.PromotionActivityGood", param);
	}

	public List<PromotionActivityGood> getPromotionActivityGoodByPromoteId(String promoteId) throws Exception {
		if (StringUtils.isBlank(promoteId)) {
			throw new Exception("promoteId is null");
		}
		Map<String, String> param = new HashMap();
		param.put("promoteId", promoteId);
		List<PromotionActivityGood> list = this.publicDAO
				.select("PromotionActivityGood.PromotionActivityGood_promoteId", param);
		return list;
	}

	public List<PromotionActivityGood> getGoodsByGoodType(String typeId) throws Exception {
		Map<String, String> param = new HashMap();
		param.put("typeId", typeId);
		List<PromotionActivityGood> list = this.publicDAO.select("PromotionActivityGood.PromotionActivityGood_type",
				param);
		return list;
	}
}
