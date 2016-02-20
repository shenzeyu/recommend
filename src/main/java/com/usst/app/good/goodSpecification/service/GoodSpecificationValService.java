package com.usst.app.good.goodSpecification.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang.StringUtils;

import com.usst.app.good.goodSpecification.model.GoodSpecificationVal;
import com.usst.code.ibatis.impl.PublicDAO;
import com.usst.code.service.BaseService;

public class GoodSpecificationValService extends BaseService<GoodSpecificationVal> {
	public List<GoodSpecificationVal> getSpecificationValBySpecificationId(String goodSpecificationId) {
		if (StringUtils.isBlank(goodSpecificationId)) {
			return null;
		}
		Map<String, String> param = new HashMap();
		param.put("goodSpecificationId", goodSpecificationId);
		List<GoodSpecificationVal> list = this.publicDAO.select("GoodSpecificationVal.GoodSpecificationVal", param);
		return list;
	}

	public void deleteBySpecicationId(String goodSpecificationId) throws Exception {
		if (StringUtils.isBlank(goodSpecificationId)) {
			throw new Exception("goodSpecificationId is null");
		}
		Map<String, String> param = new HashMap();
		param.put("goodSpecificationId", goodSpecificationId);
		this.publicDAO.delete("GoodSpecificationVal.GoodSpecificationVal", param);
	}

	public List<GoodSpecificationVal> getByIdArr(String[] specificationValIdArr) {
		if ((specificationValIdArr == null) || (specificationValIdArr.length == 0)) {
			return null;
		}
		Map<String, String[]> param = new HashMap();
		param.put("specificationValIdArr", specificationValIdArr);
		List<GoodSpecificationVal> list = this.publicDAO.select("GoodSpecificationVal.GoodSpecificationVal_idArr",
				param);
		return list;
	}
}
