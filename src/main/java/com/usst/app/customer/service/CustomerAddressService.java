package com.usst.app.customer.service;

import java.util.HashMap;
import java.util.Map;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.usst.app.customer.model.CustomerAddress;
import com.usst.code.ibatis.impl.PublicDAO;
import com.usst.code.service.BaseService;

public class CustomerAddressService extends BaseService<CustomerAddress> {
	private static final Logger logger = Logger.getLogger(CustomerService.class);

	public CustomerAddress getAdress(String customerId, String isDefault) throws Exception {
		CustomerAddress address = null;
		if (StringUtils.isBlank(isDefault)) {
			throw new Exception("customer code is empty,can not query customer information");
		}
		Map<String, String> map = new HashMap();

		map.put("isDefault", isDefault);
		map.put("customerId", customerId);
		Object obj = this.publicDAO.selectOne("CustomerAddress.CustomerAddress", map);
		if (obj != null) {
			address = (CustomerAddress) obj;
		}
		return address;
	}
}
