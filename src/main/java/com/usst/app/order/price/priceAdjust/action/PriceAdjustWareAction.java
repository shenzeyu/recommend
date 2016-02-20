package com.usst.app.order.price.priceAdjust.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;

import com.usst.app.good.good.model.Good;
import com.usst.app.good.good.service.GoodService;
import com.usst.app.good.ware.model.Ware;
import com.usst.app.good.ware.model.WareSpecificationVal;
import com.usst.app.good.ware.service.WareService;
import com.usst.app.good.ware.service.WareSpecificationValService;
import com.usst.app.order.price.priceAdjust.model.PriceAdjustWare;
import com.usst.app.order.price.priceAdjust.service.PriceAdjustWareService;
import com.usst.code.struct.BaseAction;
import com.usst.code.util.PageInfo;

public class PriceAdjustWareAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(PriceAdjustWareAction.class);
	private PriceAdjustWare saleAdjustmentWare;
	private PriceAdjustWareService priceAdjustWareService;
	private GoodService goodService;
	private WareService wareService;
	private WareSpecificationValService wareSpecificationValService;

	public void setPriceAdjustWareService(PriceAdjustWareService priceAdjustWareService) {
		this.priceAdjustWareService = priceAdjustWareService;
	}

	public void setGoodService(GoodService goodService) {
		this.goodService = goodService;
	}

	public void setWareService(WareService wareService) {
		this.wareService = wareService;
	}

	public void setWareSpecificationValService(WareSpecificationValService wareSpecificationValService) {
		this.wareSpecificationValService = wareSpecificationValService;
	}

	public String listJson() {
		logger.info("start list saleAdjustmentWare");
		List<PriceAdjustWare> resultList = null;
		int totalRows = 0;
		try {
			PageInfo pageInfo = createPageInfo();
			if (this.saleAdjustmentWare == null) {
				this.saleAdjustmentWare = new PriceAdjustWare();
			}
			resultList = this.priceAdjustWareService.pageList(pageInfo, this.saleAdjustmentWare, true);
			if (resultList != null) {
				for (PriceAdjustWare saleAdjustmentWare : resultList) {
					Ware ware = new Ware();
					ware = (Ware) this.wareService.getModel(saleAdjustmentWare.getWareId());
					if (ware != null) {
						saleAdjustmentWare.setCode(ware.getCode());
						List<WareSpecificationVal> wareSpecificationValList = this.wareSpecificationValService
								.getByWareId(ware.getId());
						String specificationVal = "";
						for (int j = 0; j < wareSpecificationValList.size(); j++) {
							specificationVal = specificationVal
									+ ((WareSpecificationVal) wareSpecificationValList.get(j))
											.getSpecificationValName();
							if (j + 1 != wareSpecificationValList.size()) {
								specificationVal = specificationVal + ",";
							}
						}
						saleAdjustmentWare.setWareSpecificationVal(specificationVal);
						Good good = (Good) this.goodService.getModel(ware.getGoodId());
						if (good != null) {
							saleAdjustmentWare.setName(good.getName());
							saleAdjustmentWare.setGoodTypeName(good.getGoodTypeName());
							saleAdjustmentWare.setPriceCost(good.getAverageCostInventory());
						}
					}
				}
			}
			totalRows = pageInfo.getCount();
		} catch (Exception e) {
			logger.error("error occur when list saleAdjustmentWare", e);
		}
		if (resultList == null) {
			resultList = new ArrayList();
		}
		this.jsonMap = new HashMap();
		this.jsonMap.put("total", Integer.valueOf(totalRows));
		this.jsonMap.put("rows", resultList);
		logger.info("finish list all saleAdjustmentWare");
		return "success";
	}

	public PriceAdjustWare getSaleAdjustmentWare() {
		return this.saleAdjustmentWare;
	}

	public void setSaleAdjustmentWare(PriceAdjustWare saleAdjustmentWare) {
		this.saleAdjustmentWare = saleAdjustmentWare;
	}
}
