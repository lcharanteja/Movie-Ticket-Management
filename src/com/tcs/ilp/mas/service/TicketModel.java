package com.tcs.ilp.mas.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import com.tcs.ilp.mas.bean.MovieBean;
import com.tcs.ilp.mas.bean.TicketBean;
import com.tcs.ilp.mas.dao.TicketImpl;

public class TicketModel {
	
TicketImpl tImpl = new TicketImpl();
	
	public ArrayList<String> viewMovies(String languageName) throws SQLException, ClassNotFoundException
	{
		return tImpl.viewMovies(languageName);
	}

	public ArrayList<Date> viewDate(String languageName, String movieName) throws SQLException, ClassNotFoundException  {
		// TODO Auto-generated method stub
		return tImpl.viewDate(languageName,movieName);
	}

	public ArrayList<Integer> viewScreen(MovieBean mbean) throws SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub
		return tImpl.viewScreen(mbean);
	}
	public ArrayList<String> viewShow(MovieBean mbean) throws SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub
		return tImpl.viewShow(mbean);
	}
	
	public int checkSeats(MovieBean mbean, Date utildate, String classtype) throws SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub
		return tImpl.checkSeats(mbean,utildate,classtype);
	}

	public int calculatingPrice(MovieBean mbean,int seatsAvailable, int seatsNeeded, Date utildate,String classtype) throws SQLException, ClassNotFoundException{
		// TODO Auto-generated method stub
		return tImpl.calculatingPrice(mbean,seatsAvailable, seatsNeeded,utildate, classtype);
	}
	
	public ArrayList<TicketBean> viewAllTicket(String email) throws SQLException, ClassNotFoundException{
		return tImpl.viewAllTicket(email);
	}
	
	public boolean BookTicket(MovieBean mbean,int seatsAvailable, int seatsNeeded, Date utildate,String classtype,String email,String show, int price, String allocatedseats) throws SQLException, ClassNotFoundException{
		return tImpl.BookTicket(mbean, seatsAvailable, seatsNeeded, utildate, classtype, email, show, price, allocatedseats);
	}
	
	public TicketBean ViewTicket(MovieBean mbean,Date utildate,String classType, String email) throws SQLException, ClassNotFoundException{
		return tImpl.ViewTicket(mbean, utildate, classType, email);
	}
	
	public int viewSeatsAll(String classtype, int screen) throws SQLException, ClassNotFoundException{
		return tImpl.viewSeatsAll(classtype, screen);
	}
	
	public String viewCustomerName(String email) throws SQLException, ClassNotFoundException{
		return tImpl.viewCustomerName(email);
	}
	
	//////////////////admin part//////////////////////
	public ArrayList<TicketBean> viewbyticketid(int id) throws SQLException{
		return tImpl.viewbyticketid(id);
	}
	public ArrayList<TicketBean> viewbycustomerid(int id) throws SQLException{
		return tImpl.viewbycustomerid(id);
	}
	public ArrayList<TicketBean> viewticketbyshow(String show) throws SQLException{
		return tImpl.viewticketbyshow(show);
}
	public ArrayList<TicketBean> viewticketbyscreen(int screen) throws SQLException{
		return tImpl.viewticketbyscreen(screen);
	}
	public ArrayList<TicketBean> viewbymoviename(String movie) throws SQLException {
		return tImpl.viewbymoviename(movie);
	}
	public ArrayList<TicketBean> viewallbookedtickets() throws SQLException{
		return tImpl.viewallbookedtickets();
	}
	
}
