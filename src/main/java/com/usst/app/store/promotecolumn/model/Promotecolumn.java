package com.usst.app.store.promotecolumn.model;

import com.usst.code.bean.Base;

public class Promotecolumn extends Base {
	private static final long serialVersionUID = 1L;
	private String columnNo;
	private String describes;
	private String remark;

	public String getColumnNo() {
		return this.columnNo;
	}

	public void setColumnNo(String columnNo) {
		this.columnNo = columnNo;
	}

	public String getDescribes() {
		return this.describes;
	}

	public void setDescribes(String describes) {
		this.describes = describes;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
}
