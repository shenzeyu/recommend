package com.usst.app.baseInfo.supplier.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang.StringUtils;

import com.usst.app.baseInfo.supplier.model.Supplier;
import com.usst.code.ibatis.impl.PublicDAO;
import com.usst.code.service.BaseService;

public class SupplierService extends BaseService<Supplier> {
	public Supplier getSupplier(Supplier supplier) throws Exception {
		if (supplier == null) {
			throw new Exception("supplier is null,can not query");
		}
		Supplier sup = null;
		Map<String, String> map = new HashMap();
		map.put("code", supplier.getCode());
		Object obj = this.publicDAO.selectOne("Supplier.Supplier", map);
		if (obj != null) {
			sup = (Supplier) obj;
		}
		return sup;
	}

	public void updatePayables(String supplierId, Double changeMoney) throws Exception {
		if (StringUtils.isBlank(supplierId)) {
			throw new Exception("primary key is null,can not update Supplier payables");
		}
		Map<String, String> param = new HashMap();
		param.put("id", supplierId);

		Supplier supplier = (Supplier) this.publicDAO.selectOne("Supplier.Supplier", param);
		if (supplier != null) {
			Double money = supplier.getPayables();
			money = Double.valueOf(money.doubleValue() + changeMoney.doubleValue());
			supplier.setPayables(money);
			this.publicDAO.update("Supplier.Supplier", supplier);
		}
	}

	public void updateReceivables(String supplierId, Double changeMoney) throws Exception {
		if (StringUtils.isBlank(supplierId)) {
			throw new Exception("primary key is null,can not update Supplier receivables");
		}
		Map<String, String> param = new HashMap();
		param.put("id", supplierId);

		Supplier supplier = (Supplier) this.publicDAO.selectOne("Supplier.Supplier", param);
		if (supplier != null) {
			Double money = supplier.getReceivables();
			money = Double.valueOf(money.doubleValue() + changeMoney.doubleValue());
			supplier.setReceivables(money);
			this.publicDAO.update("Supplier.Supplier", supplier);
		}
	}

	public List<Supplier> getSupplierList() throws Exception {
		Map<String, String> map = new HashMap();
		List<Supplier> list = this.publicDAO.select("Supplier.Supplier", map);
		return list;
	}

	public Supplier getByCode(String code) throws Exception {
		if (StringUtils.isBlank(code)) {
			throw new Exception("code is null!");
		}
		Map<String, String> map = new HashMap();
		map.put("code", code);
		Supplier supplier = (Supplier) this.publicDAO.selectOne("Supplier.Supplier", map);
		return supplier;
	}
}
