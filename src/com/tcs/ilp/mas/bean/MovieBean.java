package com.tcs.ilp.mas.bean;

import java.io.File;
import java.util.Date;

public class MovieBean 
{
	private int movieId;
	private String name;
	private String language;
	private int duration;
	private String show;
	private Date beginDate;
	private Date endDate;
	private int screen;
	private File movieImage;
	
	public File getMovieImage() {
		return movieImage;
	}
	public void setMovieImage(File movieImage) {
		this.movieImage = movieImage;
	}
	public int getMovieId() {
		return movieId;
	}
	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	public Date getBeginDate() {
		return beginDate;
	}
	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public int getScreen() {
		return screen;
	}
	public void setScreen(int screen) {
		this.screen = screen;
	}
	
}
