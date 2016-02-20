package com.usst.app.warehouse.combined.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;

import com.usst.app.good.ware.model.Ware;
import com.usst.app.good.ware.service.WareService;
import com.usst.app.warehouse.combined.model.CombinedWare;
import com.usst.app.warehouse.combined.service.CombinedWareService;
import com.usst.code.struct.BaseAction;
import com.usst.code.util.PageInfo;

public class CombinedWareAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(CombinedWareAction.class);
	private CombinedWare combinedWare;
	private CombinedWareService combinedWareService;
	private WareService wareService;

	public void setCombinedWareService(CombinedWareService combinedWareService) {
		this.combinedWareService = combinedWareService;
	}

	public void setWareService(WareService wareService) {
		this.wareService = wareService;
	}

	public String listJson() {
		logger.info("start list combined");
		List<CombinedWare> resultList = null;
		int totalRows = 0;
		try {
			if (this.combinedWare == null) {
				this.combinedWare = new CombinedWare();
			}
			PageInfo pageInfo = createPageInfo();
			resultList = this.combinedWareService.pageList(pageInfo, this.combinedWare, true);
			if (resultList != null) {
				for (CombinedWare combinedWare : resultList) {
					Ware ware = (Ware) this.wareService.getModel(combinedWare.getWareId());
					combinedWare.setCode(ware.getCode());
				}
			}
			totalRows = pageInfo.getCount();
		} catch (Exception e) {
			logger.error("error occur when list combined", e);
		}
		if (resultList == null) {
			resultList = new ArrayList();
		}
		this.jsonMap = new HashMap();
		this.jsonMap.put("total", Integer.valueOf(totalRows));
		this.jsonMap.put("rows", resultList);
		logger.info("finish list all combined!");
		return "success";
	}

	public CombinedWare getCombinedWare() {
		return this.combinedWare;
	}

	public void setCombinedWare(CombinedWare combinedWare) {
		this.combinedWare = combinedWare;
	}
}
