package com.usst.app.baseInfo.payment.service;

import java.util.HashMap;
import java.util.Map;

import com.usst.app.baseInfo.payment.model.Payment;
import com.usst.code.ibatis.impl.PublicDAO;
import com.usst.code.service.BaseService;

public class PaymentService extends BaseService<Payment> {
	public Payment getPayment(Payment payment) throws Exception {
		if (payment == null) {
			throw new Exception("payment is null,can not query");
		}
		Payment way = null;
		Map<String, String> map = new HashMap();
		map.put("code", payment.getCode());
		Object obj = this.publicDAO.selectOne("Payment.Payment", map);
		if (obj != null) {
			way = (Payment) obj;
		}
		return way;
	}
}
