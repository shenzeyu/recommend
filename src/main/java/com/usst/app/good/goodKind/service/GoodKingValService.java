package com.usst.app.good.goodKind.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang.StringUtils;

import com.usst.app.good.goodKind.model.GoodKingVal;
import com.usst.code.ibatis.impl.PublicDAO;
import com.usst.code.service.BaseService;

public class GoodKingValService extends BaseService<GoodKingVal> {
	public List<GoodKingVal> getKingValByKingId(String goodKingId) {
		if (StringUtils.isBlank(goodKingId)) {
			return null;
		}
		Map<String, String> param = new HashMap();
		param.put("goodKingId", goodKingId);
		List<GoodKingVal> list = this.publicDAO.select("GoodKingVal.GoodKingVal", param);
		return list;
	}

	public void deleteBySpecicationId(String goodKingId) throws Exception {
		if (StringUtils.isBlank(goodKingId)) {
			throw new Exception("goodKingId is null");
		}
		Map<String, String> param = new HashMap();
		param.put("goodKingId", goodKingId);
		this.publicDAO.delete("GoodKingVal.GoodKingVal", param);
	}

	public List<GoodKingVal> getByIdArr(String[] KingValIdArr) {
		if ((KingValIdArr == null) || (KingValIdArr.length == 0)) {
			return null;
		}
		Map<String, String[]> param = new HashMap();
		param.put("KingValIdArr", KingValIdArr);
		List<GoodKingVal> list = this.publicDAO.select("GoodKingVal.GoodKingVal_idArr", param);
		return list;
	}

	public List<GoodKingVal> getKingValByGoodtypeId(String goodtypeId) {
		if (StringUtils.isBlank(goodtypeId)) {
			return null;
		}
		Map<String, String> param = new HashMap();
		param.put("goodtypeId", goodtypeId);
		List<GoodKingVal> list = this.publicDAO.select("GoodKingVal.GoodKingVal_goodtype", param);
		return list;
	}
}
