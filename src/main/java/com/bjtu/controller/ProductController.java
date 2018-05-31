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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bjtu.bean.Movie;
import com.bjtu.bean.Object_Movies;
import com.bjtu.mapper.MovieMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class ProductController {

	@Autowired
	MovieMapper movieMapper;

	@RequestMapping("gotoIndex")
	public String gotoIndex(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			@RequestParam(value = "userId", defaultValue = "1") String userId, ModelMap model) {

		// 在查询之前只需要调用，传入页码，以及每页的大小
		PageHelper.startPage(pn, 15);

		List<Movie> movies = movieMapper.getMovies();

		// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
		PageInfo page = new PageInfo(movies, 6);

		model.addAttribute("pageInfo", page);
		model.addAttribute("userId", userId);

		return "index";
	}

	@RequestMapping("userbased")
	public String toUserBased() {
		return "recommand";
	}

	@RequestMapping("watched")
	public String watched(String userID, ModelMap model) {

		long ID = Long.parseLong(userID);
		List<Object_Movies> movies_watched = movieMapper.getMovesByUserId(ID);

		model.addAttribute("movies_watched", movies_watched);

		return "movies_watched";

	}

	// 基于用户的推荐controller
	@RequestMapping("getMovie")
	public String toRecomend(String userID, String num, ModelMap model) throws Exception, Exception {

		long ID = Long.parseLong(userID);
		int nummber = Integer.parseInt(num);

		List<RecommendedItem> items;
		// Movie movie;
		Set<Object_Movies> movies = new HashSet<Object_Movies>();

		System.out.println(ID);
		// 基于用户推荐
		items = getRecommendedItem1(ID, nummber);

		for (RecommendedItem item : items) {
			System.out.println(item.getItemID() + ":" + item.getValue());

			Movie movie = new Movie();
			Object_Movies object_movies = new Object_Movies();

			// 根据id查询电影
			movie = movieMapper.getMovie(item.getItemID());

			object_movies.setMovieId(movie.getMovieId());
			object_movies.setTitle(movie.getTitle());
			object_movies.setGenres(movie.getGenres());
			object_movies.setPreferance(item.getValue());

			System.out.println(object_movies.getMovieId() + ":" + object_movies.getTitle());

			movies.add(object_movies);

		}

		// List<Movie> movies=movieMapper.getMovies(item.getItemID());

		// model.addAttribute("items", items);
		model.addAttribute("movies", movies);

		return "movies";
	}

	// 基于物品的推荐controller
	@RequestMapping("to_movie_recommand/{movieId}/{userId}")
	public String toRecomendItem(@PathVariable String movieId,@PathVariable String userId, ModelMap model) throws Exception {

		long ID = Long.parseLong(movieId);
		long user=Long.parseLong(userId);

		Movie movie_used = movieMapper.getMovie(ID);

		List<RecommendedItem> items;

		Set<Object_Movies> movies = new HashSet<Object_Movies>();

		items = getRecommendedItem(user, 12);

		for (RecommendedItem item : items) {
			System.out.println(item.getItemID() + ":" + item.getValue());

			Movie movie = new Movie();
			Object_Movies object_movies = new Object_Movies();

			// 根据id查询电影
			movie = movieMapper.getMovie(item.getItemID());

			object_movies.setMovieId(movie.getMovieId());
			object_movies.setTitle(movie.getTitle());
			object_movies.setGenres(movie.getGenres());
			object_movies.setPreferance(item.getValue());

			System.out.println(object_movies.getMovieId() + ":" + object_movies.getTitle());

			movies.add(object_movies);

		}

		model.addAttribute("movies", movies);
		model.addAttribute("movie_used", movie_used);

		return "movie_item_based";
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