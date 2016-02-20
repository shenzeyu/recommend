package com.usst.app.good.goodRelate.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang.StringUtils;

import com.usst.app.good.goodRelate.model.GoodRelate;
import com.usst.code.ibatis.impl.PublicDAO;
import com.usst.code.service.BaseService;

public class GoodRelateService extends BaseService<GoodRelate> {
	public List<GoodRelate> getGoodRelateByGoodId(String goodId) throws Exception {
		if (StringUtils.isBlank(goodId)) {
			return null;
		}
		Map<String, String> param = new HashMap();
		param.put("goodId", goodId);
		List<GoodRelate> list = this.publicDAO.select("GoodRelate.GoodRelate", param);
		return list;
	}

	public void deleteByGoodId(String goodId) throws Exception {
		if (StringUtils.isBlank(goodId)) {
			throw new Exception("goodId is null,can not delete");
		}
		Map<String, String> param = new HashMap();
		param.put("goodId", goodId);
		this.publicDAO.delete("GoodRelate.GoodRelate", param);
	}
}
