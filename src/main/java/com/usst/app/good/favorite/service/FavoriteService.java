package com.usst.app.good.favorite.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.usst.app.good.favorite.model.Favorite;
import com.usst.code.ibatis.impl.PublicDAO;
import com.usst.code.service.BaseService;

public class FavoriteService extends BaseService<Favorite> {
	public List<Favorite> selectByCreatorId(Favorite favorite) throws Exception {
		if (favorite == null) {
			throw new Exception("favorite is null!");
		}
		Map<String, String> param = new HashMap();
		param.put("creatorId", favorite.getCreatorId());
		List<Favorite> list = this.publicDAO.select("Favorite.Favorite", param);
		return list;
	}
}
