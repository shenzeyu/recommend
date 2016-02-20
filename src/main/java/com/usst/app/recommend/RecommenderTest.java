package com.usst.app.recommend;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.eval.IRStatistics;
import org.apache.mahout.cf.taste.eval.RecommenderBuilder;
import org.apache.mahout.cf.taste.eval.RecommenderIRStatsEvaluator;
import org.apache.mahout.cf.taste.impl.common.LongPrimitiveIterator;
import org.apache.mahout.cf.taste.impl.eval.AverageAbsoluteDifferenceRecommenderEvaluator;
import org.apache.mahout.cf.taste.impl.eval.GenericRecommenderIRStatsEvaluator;
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.NearestNUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.ClusterSimilarity;
import org.apache.mahout.cf.taste.impl.recommender.FarthestNeighborClusterSimilarity;
import org.apache.mahout.cf.taste.impl.recommender.GenericItemBasedRecommender;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.recommender.knn.KnnItemBasedRecommender;
import org.apache.mahout.cf.taste.impl.recommender.knn.NonNegativeQuadraticOptimizer;
import org.apache.mahout.cf.taste.impl.recommender.slopeone.SlopeOneRecommender;
import org.apache.mahout.cf.taste.impl.recommender.svd.ALSWRFactorizer;
import org.apache.mahout.cf.taste.impl.recommender.svd.Factorizer;
import org.apache.mahout.cf.taste.impl.recommender.svd.SVDRecommender;
import org.apache.mahout.cf.taste.impl.similarity.EuclideanDistanceSimilarity;
import org.apache.mahout.cf.taste.impl.similarity.LogLikelihoodSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.Recommender;
import org.apache.mahout.cf.taste.similarity.ItemSimilarity;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;
import org.apache.mahout.common.RandomUtils;

/**
 * 
 * @author bsspirit@gmail.com
 * {@link http://blog.fens.me/mahout-recommendation-api/} 
 *
 */
public class RecommenderTest {

    final static int NEIGHBORHOOD_NUM = 2;
    final static int RECOMMENDER_NUM = 3;

    public static void main(String[] args) throws TasteException, IOException {
        RandomUtils.useTestSeed();
        String file = "datafile/item.csv";
//        DataModel dataModel = RecommendFactory.buildDataModel(file);
        DataModel dataModel = new FileDataModel(new File(file));
//        userCF(dataModel);
//        treeCluster(dataModel);
//        itemCF(dataModel);
//        slopeOne(dataModel);
//        svd(dataModel);
        treeCluster(dataModel);
    }

    public static void userCF(DataModel dataModel) throws TasteException {
//        UserSimilarity userSimilarity = RecommendFactory.userSimilarity(RecommendFactory.SIMILARITY.EUCLIDEAN, dataModel);
//        UserNeighborhood userNeighborhood = RecommendFactory.userNeighborhood(RecommendFactory.NEIGHBORHOOD.NEAREST, userSimilarity, dataModel, NEIGHBORHOOD_NUM);
//        RecommenderBuilder recommenderBuilder = RecommendFactory.userRecommender(userSimilarity, userNeighborhood, true);
    	
    	final UserSimilarity userSimilarity = new EuclideanDistanceSimilarity(dataModel);
    	final UserNeighborhood userNeighborhood = new NearestNUserNeighborhood(NEIGHBORHOOD_NUM, userSimilarity, dataModel);
    	RecommenderBuilder recommenderBuilder = new RecommenderBuilder(){

			public Recommender buildRecommender(DataModel dataModel)
					throws TasteException {
				return new GenericUserBasedRecommender(dataModel, userNeighborhood, userSimilarity);
			}};
    	
//        RecommendFactory.evaluate(RecommendFactory.EVALUATOR.AVERAGE_ABSOLUTE_DIFFERENCE, recommenderBuilder, null, dataModel, 0.7);
//        RecommendFactory.statsEvaluator(recommenderBuilder, null, dataModel, 2);
    	double dl = new AverageAbsoluteDifferenceRecommenderEvaluator().evaluate(recommenderBuilder, null, dataModel, 0.7, 1.0);
    	System.out.printf("Evaluater Score:%s\n",  dl);
    	RecommenderIRStatsEvaluator evaluator = new GenericRecommenderIRStatsEvaluator();
    	IRStatistics stats = evaluator.evaluate(recommenderBuilder, null, dataModel, null, 2, GenericRecommenderIRStatsEvaluator.CHOOSE_THRESHOLD, 1.0);
    	System.out.printf("Recommender IR Evaluator: [Precision:%s,Recall:%s]\n", stats.getPrecision(), stats.getRecall());
    	
        LongPrimitiveIterator iter = dataModel.getUserIDs();
        while (iter.hasNext()) {
            long uid = iter.nextLong();
            List<RecommendedItem> list = recommenderBuilder.buildRecommender(dataModel).recommend(uid, RECOMMENDER_NUM);
            RecommendFactory.showItems(uid, list, true);
        }
    }

    public static void itemCF(DataModel dataModel) throws TasteException {
//        ItemSimilarity itemSimilarity = RecommendFactory.itemSimilarity(RecommendFactory.SIMILARITY.EUCLIDEAN, dataModel);
//        RecommenderBuilder recommenderBuilder = RecommendFactory.itemRecommender(itemSimilarity, true);
    	final ItemSimilarity itemSimilarity = new EuclideanDistanceSimilarity(dataModel);
    	RecommenderBuilder recommenderBuilder = new RecommenderBuilder(){

			public Recommender buildRecommender(DataModel dataModel)
					throws TasteException {
				return new GenericItemBasedRecommender(dataModel, itemSimilarity);
			}};
    	
//        RecommendFactory.evaluate(RecommendFactory.EVALUATOR.AVERAGE_ABSOLUTE_DIFFERENCE, recommenderBuilder, null, dataModel, 0.7);
//        RecommendFactory.statsEvaluator(recommenderBuilder, null, dataModel, 2);
		double score = new AverageAbsoluteDifferenceRecommenderEvaluator().evaluate(recommenderBuilder, null, dataModel, 0.7, 1.0);	
		System.out.printf("Evaluater Score:%s\n",  score);
		RecommenderIRStatsEvaluator evaluator = new GenericRecommenderIRStatsEvaluator();
		IRStatistics stats = evaluator.evaluate(recommenderBuilder, null, dataModel, null, 2, GenericRecommenderIRStatsEvaluator.CHOOSE_THRESHOLD, 1.0);
		System.out.printf("Recommender IR Evaluator: [Precision:%s,Recall:%s]\n", stats.getPrecision(), stats.getRecall());
		
        LongPrimitiveIterator iter = dataModel.getUserIDs();
        while (iter.hasNext()) {
            long uid = iter.nextLong();
            List<RecommendedItem> list = recommenderBuilder.buildRecommender(dataModel).recommend(uid, RECOMMENDER_NUM);
            RecommendFactory.showItems(uid, list, true);
        }
    }

    public static void slopeOne(DataModel dataModel) throws TasteException {
//        RecommenderBuilder recommenderBuilder = RecommendFactory.slopeOneRecommender();
    	RecommenderBuilder recommenderBuilder = new RecommenderBuilder(){

			public Recommender buildRecommender(DataModel dataModel)
					throws TasteException {
				return new SlopeOneRecommender(dataModel);
			}};
    	
//        RecommendFactory.evaluate(RecommendFactory.EVALUATOR.AVERAGE_ABSOLUTE_DIFFERENCE, recommenderBuilder, null, dataModel, 0.7);
//        RecommendFactory.statsEvaluator(recommenderBuilder, null, dataModel, 2);
		double score = new AverageAbsoluteDifferenceRecommenderEvaluator().evaluate(recommenderBuilder, null, dataModel, 0.7, 1.0);
		System.out.printf("Evaluater Score:%s\n",  score);
		RecommenderIRStatsEvaluator evaluator = new GenericRecommenderIRStatsEvaluator();
		IRStatistics stats = evaluator.evaluate(recommenderBuilder, null, dataModel, null, 2, GenericRecommenderIRStatsEvaluator.CHOOSE_THRESHOLD, 1.0);
		System.out.printf("Recommender IR Evaluator: [Precision:%s,Recall:%s]\n", stats.getPrecision(), stats.getRecall());	
		
        LongPrimitiveIterator iter = dataModel.getUserIDs();
        while (iter.hasNext()) {
            long uid = iter.nextLong();
            List<RecommendedItem> list = recommenderBuilder.buildRecommender(dataModel).recommend(uid, RECOMMENDER_NUM);
            RecommendFactory.showItems(uid, list, true);
        }
    }

    public static void itemKNN(DataModel dataModel) throws TasteException {
//        ItemSimilarity itemSimilarity = RecommendFactory.itemSimilarity(RecommendFactory.SIMILARITY.EUCLIDEAN, dataModel);
//        RecommenderBuilder recommenderBuilder = RecommendFactory.itemKNNRecommender(itemSimilarity, new NonNegativeQuadraticOptimizer(), 10);
    	final ItemSimilarity itemSimilarity = new EuclideanDistanceSimilarity(dataModel);
    	RecommenderBuilder recommenderBuilder = new RecommenderBuilder(){

			public Recommender buildRecommender(DataModel dataModel)
					throws TasteException {
				return new KnnItemBasedRecommender(dataModel, itemSimilarity, new NonNegativeQuadraticOptimizer(), 10);
			}};
    	
//        RecommendFactory.evaluate(RecommendFactory.EVALUATOR.AVERAGE_ABSOLUTE_DIFFERENCE, recommenderBuilder, null, dataModel, 0.7);
//        RecommendFactory.statsEvaluator(recommenderBuilder, null, dataModel, 2);
		double score = new AverageAbsoluteDifferenceRecommenderEvaluator().evaluate(recommenderBuilder, null, dataModel, 0.7, 1.0);
		System.out.printf("Evaluater Score:%s\n",  score);
		RecommenderIRStatsEvaluator evaluator = new GenericRecommenderIRStatsEvaluator();
		IRStatistics stats = evaluator.evaluate(recommenderBuilder, null, dataModel, null, 2, GenericRecommenderIRStatsEvaluator.CHOOSE_THRESHOLD, 1.0);
		System.out.printf("Recommender IR Evaluator: [Precision:%s,Recall:%s]\n", stats.getPrecision(), stats.getRecall());	
			
        LongPrimitiveIterator iter = dataModel.getUserIDs();
        while (iter.hasNext()) {
            long uid = iter.nextLong();
            List<RecommendedItem> list = recommenderBuilder.buildRecommender(dataModel).recommend(uid, RECOMMENDER_NUM);
            RecommendFactory.showItems(uid, list, true);
        }
    }

    public static void svd(DataModel dataModel) throws TasteException {
        RecommenderBuilder recommenderBuilder = RecommendFactory.svdRecommender(new ALSWRFactorizer(dataModel, 10, 0.05, 10));
//    	final Factorizer fac = new ALSWRFactorizer(dataModel, 10, 0.05, 10);
//    	RecommenderBuilder recommenderBuilder = new RecommenderBuilder(){
//
//			public Recommender buildRecommender(DataModel dataModel)
//					throws TasteException {
//				return new SVDRecommender(dataModel, fac);
//			}};
    	
        RecommendFactory.evaluate(RecommendFactory.EVALUATOR.AVERAGE_ABSOLUTE_DIFFERENCE, recommenderBuilder, null, dataModel, 0.7);
        RecommendFactory.statsEvaluator(recommenderBuilder, null, dataModel, 2);

        RecommendFactory.showResult(dataModel, recommenderBuilder, RECOMMENDER_NUM, true);
//        LongPrimitiveIterator iter = dataModel.getUserIDs();
//        while (iter.hasNext()) {
//            long uid = iter.nextLong();
//            List<RecommendedItem> list = recommenderBuilder.buildRecommender(dataModel).recommend(uid, RECOMMENDER_NUM);
//            RecommendFactory.showItems(uid, list, true);
//        }
    }

    public static void treeCluster(DataModel dataModel) throws TasteException {
        UserSimilarity userSimilarity = RecommendFactory.userSimilarity(RecommendFactory.SIMILARITY.LOGLIKELIHOOD, dataModel);
        ClusterSimilarity clusterSimilarity = RecommendFactory.clusterSimilarity(RecommendFactory.SIMILARITY.FARTHEST_NEIGHBOR_CLUSTER, userSimilarity);
        RecommenderBuilder recommenderBuilder = RecommendFactory.treeClusterRecommender(clusterSimilarity, 10);

        RecommendFactory.evaluate(RecommendFactory.EVALUATOR.AVERAGE_ABSOLUTE_DIFFERENCE, recommenderBuilder, null, dataModel, 0.7);
        RecommendFactory.statsEvaluator(recommenderBuilder, null, dataModel, 2);
        
        RecommendFactory.showResult(dataModel, recommenderBuilder, RECOMMENDER_NUM, true);
//        LongPrimitiveIterator iter = dataModel.getUserIDs();
//        while (iter.hasNext()) {
//            long uid = iter.nextLong();
//            List<RecommendedItem> list = recommenderBuilder.buildRecommender(dataModel).recommend(uid, RECOMMENDER_NUM);
//            RecommendFactory.showItems(uid, list, true);
//        }
    }
}
