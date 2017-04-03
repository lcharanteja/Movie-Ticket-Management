package com.tcs.ilp.mas.service;

import java.io.IOException;
import java.sql.Date;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;

import com.tcs.ilp.mas.bean.BookingBean;
import com.tcs.ilp.mas.bean.ClassBean;
import com.tcs.ilp.mas.bean.MovieBean;
import com.tcs.ilp.mas.dao.MovieImpl;

public class MovieModel
{

	MovieImpl mImpl = new MovieImpl();
	
	public int addMovie(MovieBean mBean) throws SQLException, IOException
	{
		return mImpl.addMovie(mBean);
	}
	public ArrayList<Integer> searchScreen() throws SQLException
	{
		return mImpl.searchScreen();
	}
	public ArrayList<Integer> searchScreen(java.util.Date date, String name, String language) throws SQLException
	{
		return mImpl.searchScreen(date,name,language);
	}
	public ArrayList<String> searchLanguage() throws SQLException
	{
		return mImpl.searchLanguage();
	}
	
	public ArrayList<MovieBean> viewNowShowingMovies() throws SQLException, ParseException
	{
		return mImpl.viewNowShowingMovies();
	}
	public ArrayList<MovieBean> viewUpComingMovies() throws SQLException, ParseException
	{
		return mImpl.viewUpComingMovies();
	}
	public ArrayList<MovieBean> viewAllMovies() throws SQLException
	{
		return mImpl.viewAllMovies();
	}

	public MovieBean searchMovieById(int movieId) throws SQLException
	{ 
		return mImpl.searchMovieById(movieId);
	}
	public MovieBean deleteMovie(int movieId) throws SQLException 
	{
	return mImpl.deleteMovie(movieId);
	}
	public MovieBean updateMovie(MovieBean mb,String uploadStatus) throws SQLException, IOException
	{ 
		return mImpl.updateMovie(mb, uploadStatus);
	}
	public ArrayList<BookingBean> bookingTable() throws SQLException
	{
		return mImpl.bookingTable();
	}
	public ArrayList<ClassBean> classTable() throws SQLException
	{
		return mImpl.classTable();
	}
	public ArrayList<MovieBean> searchMovies(MovieBean mBean) throws SQLException
	{
		return mImpl.searchMovies(mBean);
	}
	public ArrayList<Integer> getIds() throws SQLException
	{
		return mImpl.getIds();
	}

}