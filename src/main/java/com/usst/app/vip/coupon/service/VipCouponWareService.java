package com.usst.app.vip.coupon.service;

import java.util.HashMap;
import java.util.Map;
import org.apache.commons.lang.StringUtils;

import com.usst.app.vip.coupon.model.VipCouponWare;
import com.usst.code.ibatis.impl.PublicDAO;
import com.usst.code.service.BaseService;

public class VipCouponWareService extends BaseService<VipCouponWare> {
	public void deleteByIntoId(String intoId) throws Exception {
		if (StringUtils.isBlank(intoId)) {
			throw new Exception("intoId is null");
		}
		Map<String, String> param = new HashMap();
		param.put("vipCouponId", intoId);
		this.publicDAO.delete("VipCouponWare.VipCouponWare", param);
	}
}
