package com.usst.app.good.goodType.action;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.usst.app.component.file.service.FileUploadService;
import com.usst.app.component.serialNumber.service.SerialNumberService;
import com.usst.app.good.goodBrand.model.GoodBrand;
import com.usst.app.good.goodBrand.service.GoodBrandService;
import com.usst.app.good.goodType.model.GoodType;
import com.usst.app.good.goodType.service.GoodTypeService;
import com.usst.app.system.user.model.SysUser;
import com.usst.code.bean.Base;

@Controller
@RequestMapping("/goodType/*")
public class GoodTypeController {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(GoodTypeAction.class);
	private GoodTypeService goodTypeService;
	private SerialNumberService serialNumberService;
	private GoodBrandService goodBrandService;
	private List<GoodType> goodTypeList;
	private FileUploadService fileUploadService;

	@RequestMapping("edit")
	public String edit(HttpServletRequest request) {
		try {
			logger.info("start to select GoodsType information");
			SysUser loginMain = (SysUser) request.getSession().getAttribute("loginUser");
			GoodType goodType = new GoodType();
			goodType.setId(request.getParameter("goodType.id"));
			goodType.setParentId(request.getParameter("goodType.parendId"));
			goodType.setLevel(Integer.parseInt(request.getParameter("goodType.level")));
			if (StringUtils.isNotBlank(goodType.getId())) {
				goodType = ((GoodType) goodTypeService.getModel(goodType.getId()));
				initModel(false, goodType, loginMain);
				if (goodType.getLevel().intValue() == 1) {
					request.setAttribute("Level", goodType.getLevel());
				}
				request.setAttribute("goodType", goodType);
			} else {
				initModel(true, goodType, loginMain);

				String parentId = goodType.getParentId();
				if ((StringUtils.isNotBlank(parentId)) && (parentId != null)) {
					GoodType type = (GoodType) goodTypeService.getModel(parentId);
					String parentName = type.getName();
					goodType.setLevel(Integer.valueOf(type.getLevel().intValue() + 1));
					goodType.setDeliveryId(type.getDeliveryId());
					goodType.setDeliveryName(type.getDeliveryName());
					request.setAttribute("parentName", parentName);
				} else {
					request.setAttribute("Level", goodType.getLevel());
				}
			}
		} catch (Exception e) {
			logger.error("eror occur when select goodType information", e);
		}
		return "good/goodType/edit_goodType";
	}
	@RequestMapping("save")
	public void save(GoodType goodType,HttpServletRequest request,HttpServletResponse response) {
		logger.info("start to save goodType information");
		String prefix = "";
		String appType = "GoodType";
		try {
			if (goodType == null) {
				goodType = new GoodType();
			}
			if (goodType.getLevel() == null) {
				goodType.setLevel(Integer.valueOf(1));
			}
			String picId = request.getParameter("picId");
			String pic = request.getParameter("pic");
			goodType.setPicId(picId);
			goodType.setPic(pic);
			System.out.println(JSON.toJSONString(goodType));
			System.out.println(URLDecoder.decode(goodType.getName(),"unicode"));
			int typeNum = goodTypeService.count().intValue();
			goodType.setSort(Integer.valueOf(typeNum));
			if (StringUtils.isBlank(goodType.getCode())) {
				String parentId = goodType.getParentId();
				if ((StringUtils.isNotBlank(parentId)) && (parentId != null)) {
					GoodType type = (GoodType) goodTypeService.getModel(parentId);

					prefix = type.getCode();
					appType = type.getName();
				}
				String code = this.serialNumberService.getSerialNumberNoDate(prefix, appType, 3);
				goodType.setCode(code);
			}
			if (StringUtils.isBlank(goodType.getId())) {
				goodType.setId(goodTypeService.makeId());
				goodType.setModifyTime(new Date());

				goodType.setIsParent("0");
				String parentId = goodType.getParentId();
				if ((parentId != null) && (StringUtils.isNotBlank(parentId))) {
					GoodType type = (GoodType) goodTypeService.getModel(parentId);
					type.setIsParent("1");
					goodTypeService.update(type);
				}
				goodTypeService.insert(goodType);
			} else {
				goodTypeService.update(goodType);
			}
			if (StringUtils.isBlank(goodType.getParentId())) {
				GoodBrand goodBrand = (GoodBrand) this.goodBrandService.getModel(goodType.getId());
				if (goodBrand == null) {
					goodBrand = new GoodBrand();
					goodBrand.setId(goodType.getId());
					goodBrand.setCode(goodType.getCode());
					goodBrand.setName(goodType.getName());
					goodBrand.setLevel(goodType.getLevel());
					goodBrand.setRemark(goodType.getRemark());
					goodBrand.setCreateTime(goodType.getCreateTime());
					goodBrand.setCreatorId(goodType.getCreatorId());
					goodBrand.setCreatorName(goodType.getCreatorName());
					int brandNumber = this.goodBrandService.count().intValue();
					goodBrand.setSort(Integer.valueOf(brandNumber));

					this.goodBrandService.insert(goodBrand);
				} else {
					goodBrand.setName(goodType.getName());
					goodBrand.setCode(goodType.getCode());
					goodBrand.setRemark(goodType.getRemark());
					this.goodBrandService.update(goodBrand);
				}
			}
			if (StringUtils.isNotBlank(picId)) {
				this.fileUploadService.updateAppId(picId, goodType.getId());
			}
			response.getWriter().write(Boolean.toString(true));
		} catch (Exception e) {
			try {
				response.getWriter().write(Boolean.toString(false));
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			logger.error("eror occur when inserting goodType information", e);
		}
	}

	private void initModel(boolean isCreate, Base model, Base loginMan) {
		String id = loginMan.getId();
		String name = loginMan.getName();
		if (isCreate) {
			model.setCreatorId(id);
			model.setCreatorName(name);
			model.setCreateTime(new Date());
			if (StringUtils.isBlank(model.getState())) {
				model.setState("s");
			}
			model.setFlowState(Integer.valueOf(0));
		} else {
			model.setModifierId(id);
			model.setModifierName(name);
			model.setModifyTime(new Date());
		}
	}

	public GoodTypeService getGoodTypeService() {
		return goodTypeService;
	}

	@Autowired
	public void setGoodTypeService(GoodTypeService goodTypeService) {
		this.goodTypeService = goodTypeService;
	}

	public SerialNumberService getSerialNumberService() {
		return serialNumberService;
	}
	@Autowired
	public void setSerialNumberService(SerialNumberService serialNumberService) {
		this.serialNumberService = serialNumberService;
	}

	public GoodBrandService getGoodBrandService() {
		return goodBrandService;
	}
	@Autowired
	public void setGoodBrandService(GoodBrandService goodBrandService) {
		this.goodBrandService = goodBrandService;
	}

	public List<GoodType> getGoodTypeList() {
		return goodTypeList;
	}

	public void setGoodTypeList(List<GoodType> goodTypeList) {
		this.goodTypeList = goodTypeList;
	}

	public FileUploadService getFileUploadService() {
		return fileUploadService;
	}
	@Autowired
	public void setFileUploadService(FileUploadService fileUploadService) {
		this.fileUploadService = fileUploadService;
	}

}
