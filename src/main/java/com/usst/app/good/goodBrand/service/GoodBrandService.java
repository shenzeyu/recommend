package com.usst.app.good.goodBrand.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.usst.app.good.goodBrand.model.GoodBrand;
import com.usst.code.ibatis.impl.PublicDAO;
import com.usst.code.service.BaseService;
@Service
public class GoodBrandService extends BaseService<GoodBrand> {
	public void delete(String goodBrandId) throws Exception {
		if (StringUtils.isBlank(goodBrandId)) {
			throw new Exception("the primary key is null,can not delete");
		}
		GoodBrand goodBrand = new GoodBrand();
		goodBrand.setParentId(goodBrandId);

		List<GoodBrand> list = this.publicDAO.select("GoodBrand.GoodBrand", goodBrand);
		if ((list != null) && (!list.isEmpty())) {
			for (int i = 0; i < list.size(); i++) {
				super.delete(((GoodBrand) list.get(i)).getId());
			}
		}
		super.delete(goodBrandId);
	}

	public Integer count() {
		Integer num = (Integer) this.publicDAO.selectOne("GoodBrand.GoodBrand_count", null);
		if ((num == null) || (num.intValue() < 0)) {
			num = Integer.valueOf(0);
		}
		return num;
	}

	public GoodBrand getByCode(String code) throws Exception {
		if (StringUtils.isBlank(code)) {
			throw new Exception("code is null!");
		}
		Map<String, String> map = new HashMap();
		map.put("code", code);
		GoodBrand goodBrand = (GoodBrand) this.publicDAO.selectOne("GoodBrand.GoodBrand", map);
		return goodBrand;
	}

	public List<GoodBrand> getGoodBrandList(Integer level) {
		Map param = new HashMap();
		param.put("level", level);
		List<GoodBrand> list = this.publicDAO.select("GoodBrand.GoodBrandBylevel", param);
		return list;
	}

	public List<GoodBrand> getGoodBrandList2(GoodBrand goodBrand) {
		Map param = new HashMap();
		param.put("level", goodBrand.getLevel());
		param.put("id", goodBrand.getId());

		List<GoodBrand> list = this.publicDAO.select("GoodBrand.GoodBrandBylevel", param);
		return list;
	}

	public List<GoodBrand> getGoodBrandList1(GoodBrand goodBrand) {
		List<GoodBrand> list = this.publicDAO.select("GoodBrand.GoodBrandByleve2", goodBrand);
		return list;
	}

	public List<GoodBrand> getparentIdGoodBrand(String parentId) throws Exception {
		if (StringUtils.isBlank(parentId)) {
			throw new Exception("the parentId  is null!");
		}
		Map<String, String> map = new HashMap();
		map.put("parentId", parentId);
		List<GoodBrand> list = this.publicDAO.select("GoodBrand.GoodBrand", map);

		return list;
	}

	public List<GoodBrand> getGoodBrandListPage3(String goodtypeId) {
		return this.publicDAO.select("GoodBrand.GoodBrand_page3", goodtypeId);
	}
}
