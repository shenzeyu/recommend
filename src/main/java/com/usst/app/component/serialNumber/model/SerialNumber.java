package com.usst.app.component.serialNumber.model;

import java.util.Date;

import com.usst.code.bean.Base;

public class SerialNumber extends Base {
	private static final long serialVersionUID = 7543978725421725065L;
	private String appType;
	private Date serialDate;
	private Integer number;

	public String getAppType() {
		return this.appType;
	}

	public void setAppType(String appType) {
		this.appType = appType;
	}

	public Date getSerialDate() {
		return this.serialDate;
	}

	public void setSerialDate(Date serialDate) {
		this.serialDate = serialDate;
	}

	public Integer getNumber() {
		return this.number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}
}
