package com.usst.app.store.promote.service;

import org.apache.commons.lang.StringUtils;

import com.usst.app.component.file.service.FileUploadService;
import com.usst.app.store.promote.model.Promote;
import com.usst.code.service.BaseService;

public class PromoteService extends BaseService<Promote> {
	private FileUploadService fileUploadService;

	public void setFileUploadService(FileUploadService fileUploadService) {
		this.fileUploadService = fileUploadService;
	}

	public void insertPromote(Promote model) throws Exception {
		if (model == null) {
			throw new Exception("Object Promote is null,can not insert Promote Information!");
		}
		super.insert(model);
		if (StringUtils.isNotBlank(model.getPicId())) {
			this.fileUploadService.updateAppId(model.getPicId(), model.getId());
		}
	}
}
