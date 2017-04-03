package com.tcs.ilp.mas.dao;


import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;

import com.tcs.ilp.mas.bean.BookingBean;
import com.tcs.ilp.mas.bean.ClassBean;
import com.tcs.ilp.mas.bean.MovieBean;

public interface MovieDAO 
{
	public int addMovie(MovieBean mBean) throws SQLException, FileNotFoundException, IOException;
	public ArrayList<Integer> searchScreen() throws SQLException;
	public ArrayList<String> searchLanguage() throws SQLException;
	public ArrayList<MovieBean> viewNowShowingMovies() throws SQLException, ParseException ;
	public ArrayList<MovieBean> viewUpComingMovies() throws SQLException, ParseException;
	public ArrayList<MovieBean> viewAllMovies() throws SQLException;
	public MovieBean searchMovieById(int movieId) throws SQLException;
	public MovieBean deleteMovie(int MovieId)throws SQLException;
	public MovieBean updateMovie(MovieBean mb,String uploadStatus) throws SQLException, FileNotFoundException, IOException;
    public ArrayList<BookingBean> bookingTable() throws SQLException;
    public ArrayList<ClassBean> classTable() throws SQLException;
    public ArrayList<MovieBean> searchMovies(MovieBean mb) throws SQLException;
    public ArrayList<Integer> searchScreen(java.util.Date date, String name, String language) throws SQLException;
	public ArrayList<Integer> getIds() throws SQLException;
}
