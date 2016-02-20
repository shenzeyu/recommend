package com.usst.app.order.buy.rebate.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang.StringUtils;

import com.usst.app.order.buy.rebate.model.RebateItem;
import com.usst.app.vip.prepaid.model.Prepaid;
import com.usst.code.ibatis.impl.PublicDAO;
import com.usst.code.service.BaseService;
import com.usst.code.util.DateUtil;

public class RebateItemService extends BaseService<RebateItem> {
	public RebateItem getSupplierById(String supplierId, String rebateId) throws Exception {
		RebateItem rebateItem = null;
		if ((StringUtils.isBlank(supplierId)) && (StringUtils.isBlank(rebateId))) {
			throw new Exception("supplier supplierId is empty,can not query supplier information");
		}
		Map<String, String> map = new HashMap();
		map.put("supplierId", supplierId);
		map.put("rebateId", rebateId);
		Object obj = this.publicDAO.selectOne("RebateItem.RebateItem", map);
		if (obj != null) {
			rebateItem = (RebateItem) obj;
		}
		return rebateItem;
	}

	public void deleteByIntoId(String intoId) throws Exception {
		if (StringUtils.isBlank(intoId)) {
			throw new Exception("intoId is null");
		}
		Map<String, String> param = new HashMap();
		param.put("rebateId", intoId);
		this.publicDAO.delete("RebateItem.RebateItem_rebateId", param);
	}

	public List<RebateItem> getRebateItem(String rebateId) throws Exception {
		if (rebateId == null) {
			throw new Exception("rebateId is null");
		}
		Map<String, String> map = new HashMap();
		map.put("rebateId", rebateId);
		List<RebateItem> list = this.publicDAO.select("RebateItem.RebateItem_rebateItem", map);
		return list;
	}

	public List<RebateItem> getRebateItemByState(String rebateId) throws Exception {
		if (rebateId == null) {
			throw new Exception("rebateId is null");
		}
		Map<String, String> map = new HashMap();
		map.put("rebateId", rebateId);
		map.put("state", "c");
		List<RebateItem> list = this.publicDAO.select("RebateItem.RebateItem_state", map);
		return list;
	}

	public List<Prepaid> getTotalMoney(String supplierId, Date startTime, Date endTime) throws Exception {
		if (supplierId == null) {
			throw new Exception("supplierId is null");
		}
		Map<String, String> map = new HashMap();
		String nowStartTime = DateUtil.date2Str(startTime, "yyyy-MM-dd HH:mm:ss");
		String nowEndTime = DateUtil.date2Str(endTime, "yyyy-MM-dd HH:mm:ss");
		map.put("supplierId", supplierId);
		map.put("startTime", nowStartTime);
		map.put("endTime", nowEndTime);
		List<Prepaid> list = this.publicDAO.select("RebateItem.RebateItem_sum_query", map);
		return list;
	}
}
