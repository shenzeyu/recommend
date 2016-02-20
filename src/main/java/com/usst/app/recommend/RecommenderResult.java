package com.usst.app.recommend;

import java.io.IOException;
import java.util.List;

import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.eval.RecommenderBuilder;
import org.apache.mahout.cf.taste.impl.common.LongPrimitiveIterator;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;

import com.usst.code.util.ConfigUtil;

public class RecommenderResult {
	final static int NEIGHBORHOOD_NUM = Integer.parseInt(ConfigUtil.getRecommendNeighborhoodNum());
    final static int RECOMMENDER_NUM = Integer.parseInt(ConfigUtil.getRecommendRecommenderNum());

    public static void main(String[] args) throws TasteException, IOException {
//        String file = "datafile/job/pv.csv";
//        DataModel dataModel = RecommendFactory.buildDataModelNoPref(file);
        DataModel dataModel = RecommendFactory.buildDataModelFromMysql();
        RecommenderBuilder rb1 = RecommenderEvaluator.userCityBlock(dataModel);
        RecommenderBuilder rb2 = RecommenderEvaluator.itemLoglikelihood(dataModel);

        LongPrimitiveIterator iter = dataModel.getUserIDs();
        while (iter.hasNext()) {
            long uid = iter.nextLong();
            System.out.print("userCityBlock    =>");
            result(uid, rb1, dataModel);
            System.out.print("itemLoglikelihood=>");
            result(uid, rb2, dataModel);
        }
    }

    public static void result(long uid, RecommenderBuilder recommenderBuilder, DataModel dataModel) throws TasteException {
        List<RecommendedItem> list = recommenderBuilder.buildRecommender(dataModel).recommend(uid, RECOMMENDER_NUM);
        RecommendFactory.showItems(uid, list, false);
    }
    public static List<String> resultItem(long uid) throws TasteException, IOException{
    	DataModel dataModel = RecommendFactory.buildDataModelFromMysql();
//        RecommenderBuilder rb1 = RecommenderEvaluator.userCityBlock(dataModel);
        RecommenderBuilder rb2 = RecommenderEvaluator.itemLoglikelihood(dataModel);
    	List<RecommendedItem> list = rb2.buildRecommender(dataModel).recommend(uid, RECOMMENDER_NUM);
    	List<String> listResult = RecommendFactory.pushItems(uid, list, false);
    	return listResult;
    }
}
