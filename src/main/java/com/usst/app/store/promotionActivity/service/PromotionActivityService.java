package com.usst.app.store.promotionActivity.service;

import org.apache.commons.lang.StringUtils;

import com.usst.app.component.file.service.FileUploadService;
import com.usst.app.store.promotionActivity.model.PromotionActivity;
import com.usst.code.service.BaseService;

public class PromotionActivityService extends BaseService<PromotionActivity> {
	private FileUploadService fileUploadService;

	public void setFileUploadService(FileUploadService fileUploadService) {
		this.fileUploadService = fileUploadService;
	}

	public void insertPromotionActivity(PromotionActivity model) throws Exception {
		if (model == null) {
			throw new Exception("Object PromotionActivity is null,can not insert PromotionActivity Information!");
		}
		super.insert(model);
		if (StringUtils.isNotBlank(model.getPicId())) {
			this.fileUploadService.updateAppId(model.getPicId(), model.getId());
		}
	}
}
