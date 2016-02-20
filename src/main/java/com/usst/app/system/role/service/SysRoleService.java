package com.usst.app.system.role.service;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.usst.app.system.role.model.SysRole;
import com.usst.app.system.rolePower.service.SysRolePowerService;
import com.usst.code.service.BaseService;

public class SysRoleService extends BaseService<SysRole> {
	private static final Logger logger = Logger.getLogger(SysRoleService.class);
	private SysRolePowerService sysRolePowerService;

	public void setSysRolePowerService(SysRolePowerService sysRolePowerService) {
		this.sysRolePowerService = sysRolePowerService;
	}

	public void delete(String id) throws Exception {
		if (StringUtils.isBlank(id)) {
			logger.warn("sysRoleId isBlank!can not delete!");
			throw new Exception("sysRoleId isBlank!can not delete!");
		}
		this.sysRolePowerService.delete(id);

		super.delete(id);
	}
}
