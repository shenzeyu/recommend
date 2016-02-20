package com.usst.app.store.gift.service;

import org.apache.commons.lang.StringUtils;

import com.usst.app.component.file.service.FileUploadService;
import com.usst.app.store.gift.model.Gift;
import com.usst.code.service.BaseService;

public class GiftService extends BaseService<Gift> {
	private FileUploadService fileUploadService;

	public void setFileUploadService(FileUploadService fileUploadService) {
		this.fileUploadService = fileUploadService;
	}

	public void insertGift(Gift model) throws Exception {
		if (model == null) {
			throw new Exception("Object Gift is null,can not insert Gift Information!");
		}
		super.insert(model);
		if (StringUtils.isNotBlank(model.getPicId())) {
			this.fileUploadService.updateAppId(model.getPicId(), model.getId());
		}
	}
}
