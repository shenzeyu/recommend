package com.usst.app.store.promote.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang.StringUtils;

import com.usst.app.store.promote.model.PromoteGood;
import com.usst.code.ibatis.impl.PublicDAO;
import com.usst.code.service.BaseService;

public class PromoteGoodService extends BaseService<PromoteGood> {
	public void deleteByPromoteId(String intoId) throws Exception {
		if (StringUtils.isBlank(intoId)) {
			throw new Exception("intoId is null");
		}
		Map<String, String> param = new HashMap();
		param.put("promoteId", intoId);
		this.publicDAO.delete("PromoteGood.PromoteGood", param);
	}

	public List<PromoteGood> getPromoteGoodByPromoteId(String promoteId) throws Exception {
		if (StringUtils.isBlank(promoteId)) {
			throw new Exception("promoteId is null");
		}
		Map<String, String> param = new HashMap();
		param.put("promoteId", promoteId);
		List<PromoteGood> list = this.publicDAO.select("PromoteGood.PromoteGood_promoteId", param);
		return list;
	}
}
