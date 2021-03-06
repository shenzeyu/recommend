package com.usst.app.store.promote.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;

import com.usst.app.good.good.model.Good;
import com.usst.app.good.ware.service.WareService;
import com.usst.app.good.ware.service.WareSpecificationValService;
import com.usst.app.order.price.priceAdjust.action.PriceAdjustWareAction;
import com.usst.app.store.promote.model.PromoteGood;
import com.usst.app.store.promote.service.PromoteGoodService;
import com.usst.code.struct.BaseAction;
import com.usst.code.util.PageInfo;

public class PromoteGoodAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(PriceAdjustWareAction.class);
	private PromoteGood promoteGood;
	private PromoteGoodService promoteGoodService;
	private Good good;
	private WareService wareService;
	private WareSpecificationValService wareSpecificationValService;

	public void setWareService(WareService wareService) {
		this.wareService = wareService;
	}

	public void setWareSpecificationValService(WareSpecificationValService wareSpecificationValService) {
		this.wareSpecificationValService = wareSpecificationValService;
	}

	public String listJson() {
		logger.info("start list PromoteGood");
		List<PromoteGood> resultList = null;

		int totalRows = 0;
		try {
			PageInfo pageInfo = createPageInfo();
			if (this.promoteGood == null) {
				this.promoteGood = new PromoteGood();
			}
			resultList = this.promoteGoodService.pageList(pageInfo, this.promoteGood, true);
			totalRows = pageInfo.getCount();
		} catch (Exception e) {
			logger.error("error occur when list warehouseIntoWare", e);
		}
		if (resultList == null) {
			resultList = new ArrayList();
		}
		this.jsonMap = new HashMap();
		this.jsonMap.put("total", Integer.valueOf(totalRows));
		this.jsonMap.put("rows", resultList);
		logger.info("finish list promoteGood");
		return "success";
	}

	public PromoteGood getPromoteGood() {
		return this.promoteGood;
	}

	public void setPromoteGood(PromoteGood promoteGood) {
		this.promoteGood = promoteGood;
	}

	public PromoteGoodService getPromoteGoodService() {
		return this.promoteGoodService;
	}

	public void setPromoteGoodService(PromoteGoodService promoteGoodService) {
		this.promoteGoodService = promoteGoodService;
	}

	public Good getGood() {
		return this.good;
	}

	public void setGood(Good good) {
		this.good = good;
	}
}
