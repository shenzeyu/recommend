package com.usst.app.recommend.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.mahout.cf.taste.common.TasteException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Service;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.usst.app.good.good.model.Good;
import com.usst.app.good.good.service.GoodService;
import com.usst.app.recommend.RecommenderResult;
import com.usst.app.recommend.model.Recommend;

@Service
public class RecommendService extends SqlMapClientTemplate {
	private GoodService goodService;

	public void insertRecommend(Recommend recommend) {
		// getSqlMapClientTemplate().insert("Recommend.Recommend_insert",
		// recommend);
		super.insert("Recommend.Recommend_insert", recommend);
	}

	public String queryIdByUid(String uid) {
		return (String) super.queryForObject("Recommend.Recommend_selectByUid", uid);
	}

	public String queryIdByIid(String iid) {
		return (String) super.queryForObject("Recommend.Recommend_selectByIid", iid);
	}

	public Long queryUidById(String id) {
		return Long.parseLong((String) super.queryForObject("Recommend.Recommend_selectById", id));
	}

	public List<Good> getRecommendItems(String id) {
		List<Good> list = new ArrayList<Good>();
		try {
			if (StringUtils.isBlank(id)) {
				id = queryIdByUid("1");
			}
			List<String> listIid = RecommenderResult.resultItem(queryUidById(id));
			if (listIid.size() == 0) {
				for (String iid : new String[] { "1", "2", "3" }) {
					listIid.add(iid);
				}
			}
			for (String iid : listIid) {
				list.add(this.goodService.getModel(queryIdByIid(iid)));
			}

		} catch (TasteException | IOException e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<Good> getNewItems() {
		List<Good> list = new ArrayList<Good>();
		List<String> ids = super.queryForList("Recommend.Recommend_selectByTime");
		int i = 0;
		System.out.println(ids.size());
		for(String id : ids){
			list.add(this.goodService.getModel(id));
			if(i>=10)break;
			i++;
		}
		return list;
	}
	@Autowired
	public void setSqlMapClientForAutowire(SqlMapClient sqlMapClient) {
		super.setSqlMapClient(sqlMapClient);
	}

	@Autowired
	public void setGoodService(GoodService goodService) {
		this.goodService = goodService;
	}

}
