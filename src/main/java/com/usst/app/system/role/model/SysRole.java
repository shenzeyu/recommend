package com.usst.app.system.role.model;

import java.util.List;

import com.usst.app.system.user.model.SysUser;
import com.usst.code.bean.Base;

public class SysRole extends Base {
	private static final long serialVersionUID = 2649324210635439526L;
	private List<SysUser> userlist;

	public List<SysUser> getUserlist() {
		return this.userlist;
	}

	public void setUserlist(List<SysUser> userlist) {
		this.userlist = userlist;
	}
}
