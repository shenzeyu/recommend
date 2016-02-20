package com.usst.app.good.goodCompose.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang.StringUtils;

import com.usst.app.good.goodCompose.model.GoodCompose;
import com.usst.code.ibatis.impl.PublicDAO;
import com.usst.code.service.BaseService;

public class GoodComposeService extends BaseService<GoodCompose> {
	public List<GoodCompose> getGoodComposeByGoodId(String goodId) {
		if (StringUtils.isBlank(goodId)) {
			return null;
		}
		Map<String, String> param = new HashMap();
		param.put("goodId", goodId);
		List<GoodCompose> list = this.publicDAO.select("GoodCompose.GoodCompose", param);
		return list;
	}

	public List<GoodCompose> getGoodComposeOfGoodId(String goodId) {
		if (StringUtils.isBlank(goodId)) {
			return null;
		}
		Map<String, String> param = new HashMap();
		param.put("goodId", goodId);
		List<GoodCompose> list = this.publicDAO.select("GoodCompose.GoodCompose_goodId", param);
		return list;
	}

	public void deleteByGoodId(String goodId) throws Exception {
		if (StringUtils.isBlank(goodId)) {
			throw new Exception("goodId is null,can not delete");
		}
		Map<String, String> param = new HashMap();
		param.put("goodId", goodId);
		this.publicDAO.delete("GoodCompose.GoodCompose", param);
	}
}
