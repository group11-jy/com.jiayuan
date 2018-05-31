package com.bjtu.bean;

public class Movie {
	long movieId;
	String title;
	String genres;
	public long getMovieId() {
		return movieId;
	}
	public void setMovieId(long movieId) {
		this.movieId = movieId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getGenres() {
		return genres;
	}
	public void setGenres(String genres) {
		this.genres = genres;
	}
	public Movie(long movieId, String title, String genres) {
		super();
		this.movieId = movieId;
		this.title = title;
		this.genres = genres;
	}
	public Movie() {
		super();
	}
	

}
