package com.tcs.ilp.mas.dao;

import java.sql.SQLException;

import java.util.ArrayList;
import java.util.Date;

import com.tcs.ilp.mas.bean.CustomerBean;
import com.tcs.ilp.mas.bean.MovieBean;
import com.tcs.ilp.mas.bean.TicketBean;

public interface TicketDAO {
	
	public ArrayList<String> viewMovies(String languageName) throws SQLException, ClassNotFoundException;
	public ArrayList<Date> viewDate(String languageName, String movieName) throws SQLException, ClassNotFoundException;
	public ArrayList<Integer> viewScreen(MovieBean mbean) throws SQLException, ClassNotFoundException;
	public ArrayList<String> viewShow(MovieBean mbean) throws SQLException, ClassNotFoundException;
	public int checkSeats(MovieBean mbean, Date utildate, String classtype) throws SQLException, ClassNotFoundException;
	public int calculatingPrice(MovieBean mbean,int seatsAvailable, int seatsNeeded,Date utildate, String classtype) throws SQLException, ClassNotFoundException;
	public ArrayList viewAllTicket(String email) throws SQLException, ClassNotFoundException;
	public TicketBean ViewTicket(MovieBean mbean,Date utildate,String classType, String email) throws SQLException, ClassNotFoundException;
	public boolean BookTicket(MovieBean mbean,int seatsAvailable, int seatsNeeded, Date utildate, String classtype, String email, String show, int price, String allocatedseats) throws SQLException, ClassNotFoundException;
	public int viewSeatsAll(String classtype, int screen) throws SQLException, ClassNotFoundException;

/////////////////////////Admin view part////////////////////////////////////////
	
	public ArrayList<TicketBean> viewbyticketid(int id) throws SQLException;
	public ArrayList<TicketBean> viewbycustomerid(int id) throws SQLException;
public ArrayList<TicketBean> viewticketbyshow(String show) throws SQLException;
	public ArrayList<TicketBean> viewticketbyscreen(int screen) throws SQLException;
	public ArrayList<TicketBean> viewbymoviename(String movie) throws SQLException ;
	public ArrayList<TicketBean> viewallbookedtickets() throws SQLException;
	


}
