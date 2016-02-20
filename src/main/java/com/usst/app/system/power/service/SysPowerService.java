package com.usst.app.system.power.service;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.usst.app.system.power.model.SysPower;
import com.usst.app.system.rolePower.service.SysRolePowerService;
import com.usst.code.service.BaseService;

public class SysPowerService extends BaseService<SysPower> {
	private static final Logger logger = Logger.getLogger(SysPowerService.class);
	private SysRolePowerService sysRolePowerService;

	public void setSysRolePowerService(SysRolePowerService sysRolePowerService) {
		this.sysRolePowerService = sysRolePowerService;
	}

	public void delete(String id) throws Exception {
		if (StringUtils.isBlank(id)) {
			logger.warn("sysRoleId isBlank!can not delete!");
			throw new Exception("sysRoleId isBlank!can not delete!");
		}
		this.sysRolePowerService.deleteByPowerId(id);

		super.delete(id);
	}
}
