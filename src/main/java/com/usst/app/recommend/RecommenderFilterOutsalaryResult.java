package com.usst.app.recommend;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.eval.RecommenderBuilder;
import org.apache.mahout.cf.taste.impl.common.LongPrimitiveIterator;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.recommender.IDRescorer;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;

public class RecommenderFilterOutsalaryResult {
	final static int NEIGHBORHOOD_NUM = 2;
    final static int RECOMMENDER_NUM = 3;
    public static void main(String[] args) throws TasteException, IOException {
        String file = "datafile/job/pv.csv";
        DataModel dataModel = RecommendFactory.buildDataModelNoPref(file);
        RecommenderBuilder rb1 = RecommenderEvaluator.userCityBlock(dataModel);
        RecommenderBuilder rb2 = RecommenderEvaluator.itemLoglikelihood(dataModel);

        LongPrimitiveIterator iter = dataModel.getUserIDs();
        while (iter.hasNext()) {
            long uid = iter.nextLong();
            System.out.print("userCityBlock    =>");
            filterOutsalary(uid, rb1, dataModel);
            System.out.print("itemLoglikelihood=>");
            filterOutsalary(uid, rb2, dataModel);
        }
    }
	private static void filterOutsalary(long uid, RecommenderBuilder recommenderBuilder,
			DataModel dataModel) throws TasteException, IOException {
		Set<Long> jobids = getOutdateJobID("datafile/job/job.csv");
        IDRescorer rescorer = new JobRescorer1(jobids);
        List<RecommendedItem> list = recommenderBuilder.buildRecommender(dataModel).recommend(uid, RECOMMENDER_NUM, rescorer);
        RecommendFactory.showItems(uid, list, false);
		
	}
	private static Set<Long> getOutdateJobID(String string) {
//		BufferedReader br = new BufferedReader(new FileReader(new File(string)));
		Set<Long> jobid = new HashSet<Long>();
		try(BufferedReader br = new BufferedReader(new FileReader(new File(string)))){
			for(String s=null;(s=br.readLine())!=null;){
				String[] strs = s.split(",");
				int salary = Integer.parseInt(strs[2]); 
				if(salary<6140){
					jobid.add(Long.parseLong(strs[0]));
				}
			}
		} catch (NumberFormatException | IOException e) {
			e.printStackTrace();
		}
		return jobid;
	}
	
}
class JobRescorer1 implements IDRescorer{
	final private Set<Long> jobid;
	
	public JobRescorer1(Set<Long> jobid) {
		super();
		this.jobid = jobid;
	}

	@Override
	public double rescore(long id, double originalScore) {
		return isFiltered(id)?Double.NaN:originalScore;
	}

	@Override
	public boolean isFiltered(long id) {
		return jobid.contains(id);
	}
	
}
