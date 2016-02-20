package com.usst.app.showlist.action;

import javax.servlet.http.HttpServletRequest;

import com.usst.code.struct.BaseAction;

public class FormcenterAction extends BaseAction {
	public String list() {
		HttpServletRequest request = getRequest();
		String type = request.getParameter("type");
		request.setAttribute("type", type);
		return "show_list";
	}
}
