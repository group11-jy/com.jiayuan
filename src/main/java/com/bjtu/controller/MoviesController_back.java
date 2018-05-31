package com.bjtu.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.NearestNUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.GenericItemBasedRecommender;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.CityBlockSimilarity;
import org.apache.mahout.cf.taste.impl.similarity.PearsonCorrelationSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.Recommender;
import org.apache.mahout.cf.taste.similarity.ItemSimilarity;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bjtu.bean.Movie;
import com.bjtu.bean.Object_Movies;
import com.bjtu.mapper.MovieMapper;

@Controller
public class MoviesController_back {
	
	@Autowired
	MovieMapper movieMapper;

	//@RequestMapping("gotoIndex")
	public String gotoIndex() {
		return "index";
	}

	//@RequestMapping("getMovie")
	public String toRecomend(String userID, String num, String check, ModelMap model) throws Exception, Exception {

		long ID = Long.parseLong(userID);
		int nummber = Integer.parseInt(num);

		List<RecommendedItem> items;
		//Movie movie;
		Set<Object_Movies> movies=new HashSet<Object_Movies>();

		System.out.println(ID);
		//基于用户推荐
		if (check.equals("1")) {
			items = getRecommendedItem1(ID, nummber);
		}
		//基于物品推荐
		else if(check.equals("2")){
			items = getRecommendedItem(ID, nummber);
		}
		//默认为基于用户推荐
		else{
			items = getRecommendedItem1(ID, nummber);
		}

		for (RecommendedItem item : items) {
			System.out.println(item.getItemID() + ":" + item.getValue());
			
			Movie movie=new Movie();
			Object_Movies object_movies=new Object_Movies();
			
			//根据id查询电影
			movie=movieMapper.getMovie(item.getItemID());
			
			object_movies.setMovieId(movie.getMovieId());
			object_movies.setTitle(movie.getTitle());
			object_movies.setGenres(movie.getGenres());
			object_movies.setPreferance(item.getValue());
			
			System.out.println(object_movies.getMovieId()+":"+object_movies.getTitle());
			
			movies.add(object_movies);
			
		}
		
		//List<Movie> movies=movieMapper.getMovies(item.getItemID());
		
		//model.addAttribute("items", items);
		model.addAttribute("movies",movies);

		return "movies";
	}

	// 基于物品的推荐
	public List<RecommendedItem> getRecommendedItem(long ID, int num) throws IOException, TasteException {
		// 一、加载数据
		DataModel model = new FileDataModel(new File("F:\\ratings.csv"));

		// 二、获取物品相似度比较的公式
		ItemSimilarity similarity = new CityBlockSimilarity(model);
		// 三、获取推荐系统对象
		Recommender recommender = new GenericItemBasedRecommender(model, similarity);

		// 获取推荐结果
		List<RecommendedItem> items = recommender.recommend(ID, num);

		return items;
	}

	// 基于用户的推荐
	public List<RecommendedItem> getRecommendedItem1(long ID, int num) throws IOException, TasteException {
		// 一、加载数据
		DataModel model = new FileDataModel(new File("F:\\ratings.csv"));

		// 二、获取相似度计算公式
		UserSimilarity similarity = new PearsonCorrelationSimilarity(model);

		// 三、获取最近邻获取方式
		UserNeighborhood neighborhood = new NearestNUserNeighborhood(3, similarity, model);

		// 四、推荐模型构建
		Recommender recommender = new GenericUserBasedRecommender(model, neighborhood, similarity);

		// 获取推荐结果
		List<RecommendedItem> items = recommender.recommend(ID, num);

		return items;
	}

}