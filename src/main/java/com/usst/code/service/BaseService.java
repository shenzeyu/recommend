package com.usst.code.service;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.usst.code.bean.Base;
import com.usst.code.ibatis.impl.PublicDAO;
import com.usst.code.util.PageInfo;
public class BaseService<T> {
	private static final Logger logger = Logger.getLogger(BaseService.class);
	protected PublicDAO publicDAO;
	protected String nameSpace;
	protected String sqlIdPrefix;
	@Autowired
	public void setPublicDAO(PublicDAO publicDAO) {
		this.publicDAO = publicDAO;
	}

	public BaseService() {
		Class clazz = getClass();
		Type genType = clazz.getGenericSuperclass();
		if ((genType instanceof ParameterizedType)) {
			Type[] params = ((ParameterizedType) genType).getActualTypeArguments();
			if ((params != null) && (params.length > 0)) {
				clazz = (Class) params[0];
			}
		}
		String clazzName = clazz.getSimpleName();
		this.nameSpace = clazzName;
		this.sqlIdPrefix = (this.nameSpace + "." + this.nameSpace);
	}

	public String makeId() {
		return this.publicDAO.makeId();
	}

	public Object selectToT(String sqlId, Object param) {
		Object obj = this.publicDAO.selectToT(sqlId, param);
		return obj;
	}

	public T insert(Base model) throws Exception {
		if (model == null) {
			throw new Exception("objParam is null!");
		}
		String id = model.getId();
		if (StringUtils.isEmpty(id)) {
			id = makeId();
			model.setId(id);
		}
		this.publicDAO.insert(this.sqlIdPrefix, model);

		return (T) model;
	}

	public T update(Base model) throws Exception {
		if (model == null) {
			throw new Exception("objParam is null!");
		}
		if (StringUtils.isBlank(model.getId())) {
			throw new Exception("id is null!");
		}
		this.publicDAO.update(this.sqlIdPrefix, model);

		return (T) model;
	}

	public T insertOrUpdate(String sqlId, Base model) {
		return (T) this.publicDAO.insertOrUpdate(sqlId, model);
	}

	public void delete(String id) throws Exception {
		if (StringUtils.isBlank(id)) {
			throw new Exception("id is null!");
		}
		logger.info("delete model,sqlIdPrefix:" + this.sqlIdPrefix + ";id:" + id);
		Map objParam = new HashMap();
		objParam.put("id", id);
		this.publicDAO.delete(this.sqlIdPrefix, objParam);
	}

	public T getModel(String id) {
		T t = null;

		logger.debug("selectOne model,sqlIdPrefix:" + this.sqlIdPrefix + ";id:" + id);
		Map objParam = new HashMap();
		objParam.put("id", id);

		Object obj = this.publicDAO.selectOne(this.sqlIdPrefix, objParam);
		if (obj != null) {
			t = (T) obj;
		}
		return t;
	}

	public List<T> select(Object objParam) {
		List<T> list = this.publicDAO.select(this.sqlIdPrefix, objParam);
		return list;
	}

	public List<T> select(String str, Object objParam) {
		List<T> list = this.publicDAO.select(str, objParam);
		return list;
	}

	public T selectOne(Object objParam) {
		T o = null;
		List<T> list = select(objParam);
		if ((list != null) && (!list.isEmpty())) {
			o = list.get(0);
		}
		return o;
	}

	public List<T> pageList(PageInfo pageInfo, Object objParam, boolean isUseCache) {
		List<T> result = null;
		if (pageInfo == null) {
			pageInfo = new PageInfo();
		}
		if (isUseCache) {
			result = this.publicDAO.queryByCache(this.sqlIdPrefix, objParam, pageInfo);
		} else {
			result = this.publicDAO.query(this.sqlIdPrefix, objParam, pageInfo);
		}
		return result;
	}
}
