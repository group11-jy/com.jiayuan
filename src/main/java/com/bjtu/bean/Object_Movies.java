package com.bjtu.bean;

public class Object_Movies {
	long movieId;
	String title;
	String genres;
	float preferance;
	public Object_Movies() {
		super();
	}
	public Object_Movies(long movieId, String title, String genres, float preferance) {
		super();
		this.movieId = movieId;
		this.title = title;
		this.genres = genres;
		this.preferance = preferance;
	}
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
	public float getPreferance() {
		return preferance;
	}
	public void setPreferance(float preferance) {
		this.preferance = preferance;
	}

}
