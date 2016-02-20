package com.usst.app.recommend.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.mahout.cf.taste.common.TasteException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Service;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.usst.app.recommend.RecommenderResult;
import com.usst.app.recommend.model.Recommend;

@Service
public class RecommendService extends SqlMapClientTemplate{
	public void insertRecommend(Recommend recommend){
//		getSqlMapClientTemplate().insert("Recommend.Recommend_insert", recommend);
		super.insert("Recommend.Recommend_insert", recommend);
	}
	public String queryIdByUid(String uid){
		return (String) super.queryForObject("Recommend.Recommend_selectByUid", uid);
	}
	public String queryIdByIid(String iid){
		return (String) super.queryForObject("Recommend.Recommend_selectByIid", iid);
	}
	public Long queryUidById(String id){
		return Long.parseLong((String) super.queryForObject("Recommend.Recommend_selectById", id));
	}
	public List<String> getRecommendItems(String id){
		List<String> list = new ArrayList<String>();
		try {
			List<String> listIid = RecommenderResult.resultItem(queryUidById(id));
			for(String iid:listIid){
				list.add(queryIdByIid(iid));
			}
		} catch (TasteException | IOException e) {
			e.printStackTrace();
		}
		return list;
	}
	@Autowired
	public void setSqlMapClientForAutowire(SqlMapClient sqlMapClient) {
        super.setSqlMapClient(sqlMapClient);
    }
	
}
