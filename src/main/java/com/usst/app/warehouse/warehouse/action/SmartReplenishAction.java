package com.usst.app.warehouse.warehouse.action;

import org.apache.log4j.Logger;

import com.usst.code.struct.BaseAction;

public class SmartReplenishAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(SmartReplenishAction.class);

	public String list() {
		return "list_smartReplenish";
	}
}
