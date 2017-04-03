package com.tcs.ilp.mas.dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.tcs.ilp.mas.bean.BookingBean;
import com.tcs.ilp.mas.bean.ClassBean;
import com.tcs.ilp.mas.bean.MovieBean;
import com.tcs.ilp.mas.util.DatabaseUtil;

public class MovieImpl implements MovieDAO
{



	public int addMovie(MovieBean mBean) throws SQLException, IOException
	{
		Connection con = DatabaseUtil.getConnection();
		PreparedStatement ps1 = null;
		PreparedStatement ps2 = null;
		PreparedStatement ps3 = null;
		int oldId=0;
		int result=0;
		int newId=0;
		System.out.println("retrieved movie id");
			ps2 = con.prepareStatement("select * from movieid_team5");
			ResultSet res1 = ps2.executeQuery();
			if(res1.next())
			{
				oldId = res1.getInt(1);
			}
			System.out.println("inserted into table");
			ps1 = con.prepareStatement("insert into movie_team5 values(?,?,?,?,?,?,?,?,?,?)");
			ps1.setInt(1, oldId);
			
			
			ps1.setString(2, mBean.getName());
			ps1.setString(3, mBean.getLanguage());
			ps1.setInt(4, mBean.getDuration());
			ps1.setString(5, mBean.getShow());
			Date date = new Date(mBean.getBeginDate().getTime());
			System.out.println(date);
			ps1.setDate(6, date);
			Date date1 = new Date(mBean.getEndDate().getTime());
			ps1.setDate(7,date1);
		    ps1.setInt(8, mBean.getScreen());
		    ps1.setString(9, "Trivandrum");
		    File fd= mBean.getMovieImage();
		    FileInputStream fi = new FileInputStream(fd);
		    ps1.setBinaryStream(10,(InputStream) fi,fi.available());
		    result = ps1.executeUpdate();
			if(result>0)
			{
				newId = oldId+1;
				System.out.println(oldId);
				System.out.println("updated the movie id");
				ps3 = con.prepareStatement("update MOVIEID_TEAM5 set movieid=? where movieid=?");
				ps3.setInt(1, newId);
				ps3.setInt(2, oldId);
				ps3.executeUpdate();
				return oldId;
			}
			else return 0;
	}
	
	public ArrayList<Integer> searchScreen() throws SQLException
	{
		ArrayList<Integer> sList = new ArrayList<Integer>();
		Connection con = DatabaseUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet result = null;
		ps = con.prepareStatement("select screen from screen_team5");
		result = ps.executeQuery();
		while(result.next())
		{
			sList.add(result.getInt(1));
		}
		return sList;
		
	}
	public ArrayList<Integer> searchScreen(java.util.Date date, String name, String language) throws SQLException
	{
		ArrayList<Integer> sList = new ArrayList<Integer>();
		Connection con = DatabaseUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet result = null;
		ps = con.prepareStatement("select screen from movie_team5 where date=? and name=? and language=?");
		Date date1 = new Date(date.getTime());
		ps.setDate(1, date1);
		ps.setString(2, name);
		ps.setString(3, language);
		result = ps.executeQuery();
		while(result.next())
		{
			sList.add(result.getInt(1));
		}
		return sList;
		
	}
	


	public ArrayList<MovieBean> viewNowShowingMovies() throws SQLException, ParseException 
	{
		ArrayList<MovieBean> nowShowingMovieList=new ArrayList<MovieBean>();
		Connection con = DatabaseUtil.getConnection();
		PreparedStatement ps = null;
		ps=con.prepareStatement("select * from movie_team5 where sysdate > begindate and sysdate < enddate ");
		ResultSet res= ps.executeQuery();
		while(res.next())
		{
			MovieBean mBean=new MovieBean();
			mBean.setMovieId(res.getInt(1));
			mBean.setName(res.getString(2));
			mBean.setLanguage(res.getString(3));
			mBean.setDuration(res.getInt(4));
			mBean.setShow(res.getString(5));
			mBean.setBeginDate(res.getDate(6));
			mBean.setEndDate(res.getDate(7));
			mBean.setScreen(res.getInt(8));
			nowShowingMovieList.add(mBean);
		}
		return nowShowingMovieList;
	}
	
	public ArrayList<MovieBean> viewUpComingMovies() throws SQLException, ParseException
	{
		ArrayList<MovieBean> upComingMovieList=new ArrayList<MovieBean>();
		Connection con = DatabaseUtil.getConnection();
		PreparedStatement ps = null;
		ps=con.prepareStatement("select * from movie_team5 where sysdate < begindate ");
		ResultSet res= ps.executeQuery();
		while(res.next())
		{
			MovieBean mBean=new MovieBean();
			mBean.setMovieId(res.getInt(1));
			mBean.setName(res.getString(2));
			mBean.setLanguage(res.getString(3));
			mBean.setDuration(res.getInt(4));
			mBean.setShow(res.getString(5));
			mBean.setBeginDate(res.getDate(6));
			mBean.setEndDate(res.getDate(7));
			mBean.setScreen(res.getInt(8));
			upComingMovieList.add(mBean);
		}
		return upComingMovieList;
	}
	
	public ArrayList<MovieBean> viewAllMovies() throws SQLException
	{
		Connection con = DatabaseUtil.getConnection();
		PreparedStatement ps = null;
		ArrayList<MovieBean> movieList=new ArrayList<MovieBean>();
		ps=con.prepareStatement("select * from movie_team5");
		ResultSet res= ps.executeQuery();
		while(res.next())
		{
			MovieBean mBean=new MovieBean();
			mBean.setMovieId(res.getInt(1));
			mBean.setName(res.getString(2));
			mBean.setLanguage(res.getString(3));
			mBean.setDuration(res.getInt(4));
			mBean.setShow(res.getString(5));
			mBean.setBeginDate(res.getDate(6));
			mBean.setEndDate(res.getDate(7));
			mBean.setScreen(res.getInt(8));
			movieList.add(mBean);
		}
		return movieList;
	}
	
	public MovieBean searchMovieById(int movieId) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		MovieBean mb=new MovieBean();
		con=DatabaseUtil.getConnection();
		ps=con.prepareStatement("select * from movie_team5 where movieid=?");
		ps.setInt(1, movieId);
		ResultSet result=ps.executeQuery();
		if(result.next()){
			
			mb.setMovieId(result.getInt(1));
			mb.setName(result.getString(2));
			mb.setLanguage(result.getString(3));
			mb.setDuration(result.getInt(4));
			mb.setShow(result.getString(5));
			mb.setBeginDate(result.getDate(6));
			mb.setEndDate(result.getDate(7));
			mb.setScreen(result.getInt(8));
			
			
			
			
		}
		
		DatabaseUtil.closeStatement(ps);
		DatabaseUtil.closeConnection(con);
		return mb;
		
	
}

	public MovieBean updateMovie(MovieBean mb,String uploadStatus) throws SQLException, IOException{
	
		Connection con=null;
		PreparedStatement ps1=null;
		PreparedStatement ps2=null;
		PreparedStatement ps3=null;
		MovieBean mBean = null;
		int rowsAffected1=0;
		int rowsAffected2=0;
		ResultSet res = null;
		con=DatabaseUtil.getConnection();
		java.sql.Date date = new java.sql.Date(mb.getBeginDate().getTime());
		java.sql.Date date1 = new java.sql.Date(mb.getEndDate().getTime());
		if(uploadStatus == null)
		{
		ps1=con.prepareStatement("update movie_team5 set name=?,language=?,duration=?,Show=?,begindate=?,enddate=?,screen=? where movieid=?");
		ps1.setString(1, mb.getName());
		ps1.setString(2, mb.getLanguage());
		ps1.setInt(3, mb.getDuration());
		ps1.setString(4, mb.getShow());
		ps1.setDate(5, date);
		ps1.setDate(6, date1);
		ps1.setInt(7, mb.getScreen());
		ps1.setInt(8,mb.getMovieId());
		rowsAffected1=ps1.executeUpdate();
		if(rowsAffected1>0)
		{
			
			ps3=con.prepareStatement("select * from movie_team5 where movieid=?");
			ps3.setInt(1, mb.getMovieId());
			
			res = ps3.executeQuery();
		
			if(res.next())
			{
				
				mBean=new MovieBean();
				mBean.setMovieId(res.getInt(1));
				mBean.setName(res.getString(2));
				mBean.setLanguage(res.getString(3));
				mBean.setDuration(res.getInt(4));
				mBean.setShow(res.getString(5));
				mBean.setBeginDate(res.getDate(6));
				mBean.setEndDate(res.getDate(7));
				mBean.setScreen(res.getInt(8));
				
			
			}
		}

		}
		if(uploadStatus != null)
		{
			
			ps2=con.prepareStatement("update movie_team5 set name=?,language=?,duration=?,Show=?,begindate=?,enddate=?,screen=?,image=? where movieid=?");
			ps2.setString(1, mb.getName());
			ps2.setString(2, mb.getLanguage());
			ps2.setInt(3, mb.getDuration());
			ps2.setString(4, mb.getShow());
			ps2.setDate(5, date);
			ps2.setDate(6, date1);
			ps2.setInt(7, mb.getScreen());
			ps2.setInt(9,mb.getMovieId());
			File fd= mb.getMovieImage();
		    FileInputStream fi = new FileInputStream(fd);
		    ps2.setBinaryStream(8,(InputStream) fi,fi.available());
		    rowsAffected2 = ps2.executeUpdate();
			if(rowsAffected2>0)
			{
				System.out.println("uploadStatus");
				ps3=con.prepareStatement("select * from movie_team5 where movieid=?");
				ps3.setInt(1, mb.getMovieId());
				res = ps3.executeQuery();
				if(res.next())
				{
					System.out.println("movieid");
					mBean=new MovieBean();
					mBean.setMovieId(res.getInt(1));
					mBean.setName(res.getString(2));
					mBean.setLanguage(res.getString(3));
					mBean.setDuration(res.getInt(4));
					mBean.setShow(res.getString(5));
					mBean.setBeginDate(res.getDate(6));
					mBean.setEndDate(res.getDate(7));
					mBean.setScreen(res.getInt(8));
					
					
				}

				DatabaseUtil.closeStatement(ps1);
				DatabaseUtil.closeStatement(ps3);
				DatabaseUtil.closeStatement(ps2);
				DatabaseUtil.closeConnection(con);
				
			}
			
		}
		return mBean;
		
		
		

}

	public MovieBean deleteMovie(int movieId) throws SQLException {
	Connection con=null;
	PreparedStatement ps=null;
	int rowsAffected=0;
	MovieBean mb = new MovieBean();
	con=DatabaseUtil.getConnection();
	ps=con.prepareStatement("select * from movie_team5 where movieid=?");
	ps.setInt(1, movieId);
	ResultSet result=ps.executeQuery();
	if(result.next()){
		
		mb.setMovieId(result.getInt(1));
		mb.setName(result.getString(2));
		mb.setLanguage(result.getString(3));
		mb.setDuration(result.getInt(4));
		mb.setShow(result.getString(5));
		mb.setBeginDate(result.getDate(6));
		mb.setEndDate(result.getDate(7));
		mb.setScreen(result.getInt(8));
			
	}
	ps=con.prepareStatement("delete from movie_team5 where movieid=?");
	ps.setInt(1, movieId);
	rowsAffected=ps.executeUpdate();
	if(rowsAffected>0)
	{
		DatabaseUtil.closeStatement(ps);
		DatabaseUtil.closeConnection(con);
		return mb;
	}

	DatabaseUtil.closeStatement(ps);
	DatabaseUtil.closeConnection(con);

	return mb;
}

	public ArrayList<String> searchLanguage() throws SQLException {
	ArrayList<String> lList = new ArrayList<String>();
	Connection con = DatabaseUtil.getConnection();
	PreparedStatement ps = null;
	ResultSet result = null;
	ps = con.prepareStatement("select distinct language from movie_team5");
	result = ps.executeQuery();
	while(result.next())
	{
		lList.add(result.getString(1));
	}
	return lList;
	
}

	public ArrayList<BookingBean> bookingTable() throws SQLException 
{
		ArrayList<BookingBean> bookingList = new ArrayList<BookingBean>();
		Connection con = DatabaseUtil.getConnection();
		PreparedStatement ps = null;
		ps=con.prepareStatement("select * from BOOKING_TEAM5");
		ResultSet res= ps.executeQuery();
		while(res.next())
		{
			BookingBean bBean=new BookingBean();
			bBean.setScreen(res.getInt(1));
			bBean.setBooking_date(res.getDate(2));
			bBean.setShow1_gold(res.getInt(3));
			bBean.setShow1_silver(res.getInt(4));
			bBean.setShow2_gold(res.getInt(5));
			bBean.setShow2_silver(res.getInt(6));
			bBean.setShow3_gold(res.getInt(7));
			bBean.setShow3_silver(res.getInt(8));
			bookingList.add(bBean);
		}
		
	return bookingList;
}

	public ArrayList<ClassBean> classTable() throws SQLException {
		ArrayList<ClassBean> cList = new ArrayList<ClassBean>();
		Connection con = DatabaseUtil.getConnection();
		PreparedStatement ps = null;
		ps=con.prepareStatement("select * from CLASS_TEAM5");
		ResultSet res= ps.executeQuery();
		while(res.next())
		{
			ClassBean cBean=new ClassBean();
			cBean.setClassId(res.getInt(1));
			cBean.setSeats(res.getInt(2));
			cBean.setPrice(res.getInt(3));
			cBean.setScreenType(res.getString(4));
			cBean.setCategoryType(res.getString(5));
			cBean.setScreen(res.getInt(6));
			cList.add(cBean);
		}
		
	return cList;
	}

	public ArrayList<MovieBean> searchMovies(MovieBean mb) throws SQLException 
	{
		Connection con = DatabaseUtil.getConnection();
		PreparedStatement ps = null;
		ArrayList<MovieBean> movieList=new ArrayList<MovieBean>();
		ps=con.prepareStatement("select * from movie_team5 where name=?");
		ps.setString(1, mb.getName());
		ResultSet res= ps.executeQuery();
		while(res.next())
		{
			MovieBean mBean=new MovieBean();
			mBean.setMovieId(res.getInt(1));
			mBean.setName(res.getString(2));
			mBean.setLanguage(res.getString(3));
			mBean.setDuration(res.getInt(4));
			mBean.setShow(res.getString(5));
			mBean.setBeginDate(res.getDate(6));
			mBean.setEndDate(res.getDate(7));
			mBean.setScreen(res.getInt(8));
			movieList.add(mBean);
		}
		return movieList;
}
	
	public ArrayList<Integer> getIds() throws SQLException
	{
	ArrayList<Integer> idList = new ArrayList<Integer>(); 
	Connection con = DatabaseUtil.getConnection();
	PreparedStatement ps = null;
	ps=con.prepareStatement("select movieid from movie_team5");
	ResultSet res= ps.executeQuery();
	while(res.next())
	{
		int id = res.getInt(1);
		idList.add(id);
	}
	return idList;
	}
}