package com.usst.app.baseInfo.area.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.usst.app.baseInfo.area.model.Area;
import com.usst.app.baseInfo.area.service.AreaService;
import com.usst.app.component.serialNumber.service.SerialNumberService;
import com.usst.app.system.user.model.SysUser;
import com.usst.code.struct.BaseAction;
import com.usst.code.util.ConfigUtil;
import com.usst.code.util.PageInfo;

public class AreaAction extends BaseAction {
	private static final long serialVersionUID = 807541785027360823L;
	private static final Logger logger = Logger.getLogger(AreaAction.class);
	private AreaService areaService;
	private SerialNumberService serialNumberService;
	private Area area;
	private List<Area> areaList;

	public String list() {
		String maxLevel = ConfigUtil.getAreaLevel();
		getRequest().setAttribute("maxLevel", maxLevel);
		return "list_area";
	}

	public String listJson() {
		if (this.area == null) {
			this.area = new Area();
		}
		logger.info("start to list Area information");
		List<Area> list = null;
		int totalRows = 0;
		try {
			PageInfo pageInfo = createPageInfo();
			list = this.areaService.pageList(pageInfo, this.area, true);
			if (list == null) {
				list = new ArrayList();
			}
			totalRows = pageInfo.getCount();
		} catch (Exception e) {
			logger.info("eror occur when listing Area information");
			e.printStackTrace();
		}
		this.jsonMap = new HashMap();
		this.jsonMap.put("total", Integer.valueOf(totalRows));
		this.jsonMap.put("rows", list);

		logger.info("finish list all Area data!");

		return "success";
	}

	public String edit() {
		try {
			logger.info("start to query area information");
			SysUser loginMan = getSessionUserInfo();
			if (this.area == null) {
				this.area = new Area();
			}
			if (StringUtils.isNotBlank(this.area.getId())) {
				this.area = ((Area) this.areaService.getModel(this.area.getId()));

				initModel(false, this.area, loginMan);
			} else {
				initModel(true, this.area, loginMan);
			}
			if (this.area == null) {
				this.area = new Area();
			}
		} catch (Exception e) {
			logger.info("error occur when query area information");
			e.printStackTrace();
		}
		return "edit_area";
	}

	public void save() {
		logger.info("start to update area information");
		try {
			if (this.area == null) {
				this.area = new Area();
			}
			Integer level = Integer.valueOf(this.area.getLevel());

			int areaCount = this.areaService.count().intValue();
			this.area.setSort(Integer.valueOf(areaCount));
			this.area.setLevel(level.intValue());
			if (StringUtils.isBlank(this.area.getId())) {
				String prefix = "DQ";
				String appType = "Area";
				if (StringUtils.isNotBlank(this.area.getParentId())) {
					Area parentArea = (Area) this.areaService.getModel(this.area.getParentId());
					prefix = parentArea.getCode();
					appType = parentArea.getName();
				}
				String code = this.serialNumberService.getSerialNumberNoDate(prefix, appType, 2);
				this.area.setCode(code);

				this.areaService.insert(this.area);
			} else {
				this.areaService.update(this.area);
			}
			responseFlag(true);
		} catch (Exception e) {
			logger.info("error occur when save area information");
			e.printStackTrace();
			responseFlag(false);
		}
	}

	public void isCodeExisted() {
		boolean isCodeExisted = true;

		String id = this.area.getId();
		String code = this.area.getCode();
		logger.info("check isCodeExisted,code:" + code + ";id:" + id);
		try {
			this.area = this.areaService.checkUniqueAreaByName(code);
			if (this.area == null) {
				isCodeExisted = false;
			} else {
				isCodeExisted = true;
			}
			logger.info("check isCodeExisted result:" + isCodeExisted);
			responseFlag(isCodeExisted);
		} catch (Exception e) {
			logger.error("error occur when check isCodeExisted!", e);
		}
	}

	public void checkAreaName() {
		String code = this.area.getName();
		logger.info("check isCodeExisted,code:" + code);
		try {
			this.area = this.areaService.checkUniqueAreaByName(code);
			if (this.area == null) {
				responseFlag(true);
			} else {
				responseFlag(false);
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("error occur when check isCodeExisted!", e);
		}
	}

	public void delete() {
		try {
			logger.info("start to delete area information");
			if (this.area == null) {
				this.area = new Area();
			}
			if (StringUtils.isNotBlank(this.area.getId())) {
				this.areaService.delete(this.area);
				responseFlag(true);
			} else {
				responseFlag(false);
			}
		} catch (Exception e) {
			logger.info("error occur when deleting area information");
			e.printStackTrace();
			responseFlag(false);
		}
	}

	public void setAreaService(AreaService areaService) {
		this.areaService = areaService;
	}

	public void setSerialNumberService(SerialNumberService serialNumberService) {
		this.serialNumberService = serialNumberService;
	}

	public Area getArea() {
		return this.area;
	}

	public void setArea(Area area) {
		this.area = area;
	}

	public List<Area> getAreaList() {
		return this.areaList;
	}

	public void setAreaList(List<Area> areaList) {
		this.areaList = areaList;
	}
}
