package com.usst.app.good.goodExtend.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang.StringUtils;

import com.usst.app.good.goodExtend.model.GoodExtend;
import com.usst.code.ibatis.impl.PublicDAO;
import com.usst.code.service.BaseService;

public class GoodExtendService extends BaseService<GoodExtend> {
	public GoodExtend getByGoodId(String goodId) throws Exception {
		if (StringUtils.isBlank(goodId)) {
			throw new Exception("goodId is null");
		}
		Map<String, String> param = new HashMap();
		param.put("goodId", goodId);
		List<GoodExtend> list = this.publicDAO.select("GoodExtend.GoodExtend", param);
		if ((list == null) || (list.size() == 0)) {
			return null;
		}
		return (GoodExtend) list.get(0);
	}

	public GoodExtend getByGroupGoodId(String groupgoodId) throws Exception {
		if (StringUtils.isBlank(groupgoodId)) {
			throw new Exception("goodId is null");
		}
		Map<String, String> param = new HashMap();
		param.put("groupgoodId", groupgoodId);
		List<GoodExtend> list = this.publicDAO.select("GoodExtend.GoodExtend_groupgood", param);
		if ((list == null) || (list.size() == 0)) {
			return null;
		}
		return (GoodExtend) list.get(0);
	}

	public void deleteByGoodId(String goodId) throws Exception {
		if (StringUtils.isBlank(goodId)) {
			throw new Exception("goodId is null");
		}
		Map<String, String> param = new HashMap();
		param.put("goodId", goodId);
		this.publicDAO.delete("GoodExtend.GoodExtend", param);
	}

	public void updateByGroupGoodId(GoodExtend goodExtend) throws Exception {
		if (goodExtend == null) {
			throw new Exception("goodExtend is null");
		}
		this.publicDAO.update("GoodExtend.GoodExtend_groupgood", goodExtend);
	}
}
