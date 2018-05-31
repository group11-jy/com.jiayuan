package com.bjtu.mapper;

import java.util.List;

import com.bjtu.bean.Movie;
import com.bjtu.bean.Object_Movies;

public interface MovieMapper {
	
	//根据movieId查询电影
	public Movie getMovie(long movieID);
	
	//查询所有电影
	public List<Movie> getMovies();
	
	//根据userId查询电影
	public List<Object_Movies> getMovesByUserId(long userId);
	
	

}
