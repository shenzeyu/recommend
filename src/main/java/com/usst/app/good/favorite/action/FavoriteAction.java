package com.usst.app.good.favorite.action;

import org.apache.log4j.Logger;

import com.usst.app.good.favorite.model.Favorite;
import com.usst.app.good.favorite.service.FavoriteService;
import com.usst.code.struct.BaseAction;

public class FavoriteAction extends BaseAction {
	private static final long serialVersionUID = -1299499640055184711L;
	private static final Logger logger = Logger.getLogger(FavoriteAction.class);
	private Favorite favorite;
	private FavoriteService favoriteService;

	public Favorite getFavorite() {
		return this.favorite;
	}

	public void setFavorite(Favorite favorite) {
		this.favorite = favorite;
	}

	public void setFavoriteService(FavoriteService favoriteService) {
		this.favoriteService = favoriteService;
	}
}
