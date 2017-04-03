package com.tcs.ilp.mas.dao;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import java.util.Date;

import com.tcs.ilp.mas.bean.CustomerBean;
import com.tcs.ilp.mas.bean.MovieBean;
import com.tcs.ilp.mas.bean.TicketBean;
import com.tcs.ilp.mas.util.DatabaseUtil;

public class TicketImpl implements TicketDAO {
	PreparedStatement ps1=null;
	PreparedStatement ps2=null;
	PreparedStatement ps3=null;
	PreparedStatement ps=null;
	Connection con=null;

	public ArrayList<String> viewMovies(String languageName) throws SQLException, ClassNotFoundException
	{
		ArrayList<String> movieList=new ArrayList<String>();
		String movie = null;
		con=DatabaseUtil.getConnection();
		ps=con.prepareStatement("select name from movie_team5 where language=?");
		ps.setString(1, languageName);

		ResultSet res=ps.executeQuery();

		while(res.next())
		{

			movie= res.getString(1);
			movieList.add(movie);
		}
		DatabaseUtil.closeStatement(ps);
		DatabaseUtil.closeConnection(con);
		return movieList;
	}

	public ArrayList<Date> viewDate(String languageName, String movieName) throws SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub

		ArrayList<Date> dateList=new ArrayList<Date>();


		Date startDate = null;
		Date endDate=null;
		con=DatabaseUtil.getConnection();
		ps=con.prepareStatement("select begindate, enddate from movie_team5 where language=? and name=?");
		ps.setString(1, languageName);
		ps.setString(2, movieName);

		ResultSet res=ps.executeQuery();

		while(res.next())
		{
			startDate = (Date)res.getDate(1);
			endDate= (Date)res.getDate(2);		
			long interval = 24*1000 * 60 * 60; // 1 hour in millis
			long endTime =endDate.getTime() ; // create your endtime here, possibly using Calendar or Date
			long curTime = startDate.getTime();
			while (curTime <= endTime) {
				dateList.add(new java.sql.Date(curTime));
				curTime += interval;
			}

			//dateList.add(date);
			//dateList.add(date1);
		}
		DatabaseUtil.closeStatement(ps);
		DatabaseUtil.closeConnection(con);
		return dateList;
	}

	public ArrayList<Integer> viewScreen(MovieBean mbean) throws SQLException, ClassNotFoundException
	{
		ArrayList<Integer> screenList=new ArrayList<Integer>();

		int screen =0;
		con=DatabaseUtil.getConnection();
		ps=con.prepareStatement("select screen from movie_team5 where language=? and name=?");
		ps.setString(1, mbean.getLanguage());
		ps.setString(2, mbean.getName());

		ResultSet res=ps.executeQuery();

		while(res.next())
		{
			screen = res.getInt(1);
			screenList.add(screen);
		}
		DatabaseUtil.closeStatement(ps);
		DatabaseUtil.closeConnection(con);
		return screenList;
	}	

	public ArrayList<String> viewShow(MovieBean mbean) throws SQLException, ClassNotFoundException
	{
		ArrayList<String> showList=new ArrayList<String>();

		String show =null;
		con=DatabaseUtil.getConnection();
		ps=con.prepareStatement("select show from movie_team5 where language=? and name=? and screen=?");
		ps.setString(1, mbean.getLanguage());
		ps.setString(2, mbean.getName());
		ps.setInt(3, mbean.getScreen());

		ResultSet res=ps.executeQuery();

		while(res.next())
		{
			show = res.getString(1);
			showList.add(show);
		}
		DatabaseUtil.closeStatement(ps);
		DatabaseUtil.closeConnection(con);
		return showList;

	}

	public ArrayList<TicketBean> viewAllTicket(String email) throws SQLException, ClassNotFoundException 
	{
		// TODO Auto-generated method stub
		TicketBean tBean=null;
		ArrayList<TicketBean> ticketList=new ArrayList<TicketBean>();
		int customerid=0;
		con=DatabaseUtil.getConnection();
		ps1=con.prepareStatement("select customerid from customer_team5 where email=?");
		ps1.setString(1, email);

		ResultSet result=ps1.executeQuery();

		while(result.next()){
			customerid=result.getInt(1);
		}
		//System.out.println(customerid);
		ps=con.prepareStatement("select * from ticket_team5 where customerid=?");
		ps.setInt(1, customerid);
		result=ps.executeQuery();

		while(result.next()){
			tBean=new TicketBean();
			tBean.setTicketID(result.getInt(1));
			tBean.setCustomerID(result.getInt(2));
			tBean.setBookingDate(result.getDate(3));
			tBean.setScreen(result.getInt(4));
			tBean.setShow(result.getString(5));
			tBean.setNoOfTickets(result.getInt(6));
			tBean.setClassType(result.getString(7));
			tBean.setMovieName(result.getString(8));
			tBean.setAllocatedSeats(result.getString(9));

			ticketList.add(tBean);
		}
		DatabaseUtil.closeStatement(ps1);
		DatabaseUtil.closeStatement(ps);
		DatabaseUtil.closeConnection(con);

		return ticketList;
	}

	public int checkSeats(MovieBean mbean, Date utildate, String classtype) throws SQLException, ClassNotFoundException {
		int seats=0;
		String show =mbean.getShow();
		con=DatabaseUtil.getConnection();
		if(classtype.equalsIgnoreCase("Silver"))
		{
			if(show.equalsIgnoreCase("M"))
			{
				ps=con.prepareStatement("select show1_silver from booking_team5 where screen =? and bookingdate=?");
				ps.setInt(1, mbean.getScreen());
				ps.setDate(2, new java.sql.Date(utildate.getTime()));		
			}
			else if (show.equalsIgnoreCase("A"))
			{
				ps=con.prepareStatement("select show2_silver from  booking_team5 where screen =? and bookingdate=?");
				ps.setInt(1, mbean.getScreen());
				ps.setDate(2, new java.sql.Date(utildate.getTime()));			
			}
			else if (show.equalsIgnoreCase("E"))
			{
				ps=con.prepareStatement("select show3_silver from booking_team5 where screen =? and bookingdate=?");
				ps.setInt(1, mbean.getScreen());
				ps.setDate(2, new java.sql.Date(utildate.getTime()));			
			}	
		}	
		else if(classtype.equalsIgnoreCase("Gold"))
		{
			if(show.equalsIgnoreCase("M"))
			{
				ps=con.prepareStatement("select show1_gold from booking_team5 where screen =? and bookingdate=?");
				ps.setInt(1, mbean.getScreen());
				ps.setDate(2, new java.sql.Date(utildate.getTime()));			
			}
			else if (show.equalsIgnoreCase("A"))
			{
				ps=con.prepareStatement("select show2_gold from booking_team5 where screen =? and bookingdate=?");
				ps.setInt(1, mbean.getScreen());
				ps.setDate(2, new java.sql.Date(utildate.getTime()));			
			}
			else if (show.equalsIgnoreCase("E"))
			{
				ps=con.prepareStatement("select show3_gold from booking_team5 where screen =? and bookingdate=?");
				ps.setInt(1, mbean.getScreen());
				ps.setDate(2, new java.sql.Date(utildate.getTime()));
			}
		}
		ResultSet res=ps.executeQuery();

		while(res.next())
		{
			seats = res.getInt(1);
		}
		DatabaseUtil.closeStatement(ps);
		DatabaseUtil.closeConnection(con);
		return seats;
	}

	public int calculatingPrice(MovieBean mbean,int seatsAvailable, int seatsNeeded, Date utildate, String classtype) throws SQLException, ClassNotFoundException
	{
		int price=0;
		System.out.println("tell me where i am");
		con=DatabaseUtil.getConnection();
		if((seatsAvailable > seatsNeeded)&&(seatsNeeded <= 10))
		{
			ps1=con.prepareStatement("select price from class_team5 where screen =? and classtype=?");
			System.out.println("i m here...in impl");
			ps1.setInt(1, mbean.getScreen());
			ps1.setString(2, classtype);
		}

		ResultSet res= ps1.executeQuery();
		while(res.next())
		{
			price =(seatsNeeded *  res.getInt(1) );
			System.out.println("price in impl="+price);
		}

		DatabaseUtil.closeStatement(ps1);
		DatabaseUtil.closeConnection(con);		
		return price;
	}
		
	public boolean BookTicket(MovieBean mbean,int seatsAvailable, int seatsNeeded, Date utildate, String classtype, String email, String show, int price, String allocatedseats) throws SQLException, ClassNotFoundException{

		con=DatabaseUtil.getConnection();
		System.out.println("Allocated seats are="+allocatedseats);
		int updateSeats = seatsAvailable-seatsNeeded;
		boolean flag=false;

		if((classtype.equalsIgnoreCase("Silver"))&&(seatsAvailable > seatsNeeded))
		{
			if(show.equalsIgnoreCase("M"))
			{
				ps=con.prepareStatement("update booking_team5 set show1_silver=?  where screen =? and bookingdate=?");
				ps.setInt(1, updateSeats);
				ps.setInt(2, mbean.getScreen());
				ps.setDate(3, new java.sql.Date(utildate.getTime()));

			}			
			else if (show.equalsIgnoreCase("A"))
			{
				ps=con.prepareStatement("update booking_team5 set show2_silver=?  where screen =? and bookingdate=?");
				ps.setInt(1, updateSeats);
				ps.setInt(2, mbean.getScreen());
				ps.setDate(3, new java.sql.Date(utildate.getTime()));				
			}			
			else if (show.equalsIgnoreCase("E"))
			{
				ps=con.prepareStatement("update booking_team5 set show3_silver=?  where screen =? and bookingdate=?");
				ps.setInt(1, updateSeats);
				ps.setInt(2, mbean.getScreen());
				ps.setDate(3, new java.sql.Date(utildate.getTime()));			
			}
		}	
		else if((classtype.equalsIgnoreCase("Gold"))&&(seatsAvailable > seatsNeeded))
		{
			if(show.equalsIgnoreCase("M"))
			{
				ps=con.prepareStatement("update booking_team5 set show1_gold=?  where screen =? and bookingdate=?");
				ps.setInt(1, updateSeats);
				ps.setInt(2, mbean.getScreen());
				ps.setDate(3, new java.sql.Date(utildate.getTime()));		
			}		
			else if (show.equalsIgnoreCase("A"))
			{
				ps=con.prepareStatement("update booking_team5 set show2_gold=?  where screen =? and bookingdate=?");
				ps.setInt(1, updateSeats);
				ps.setInt(2, mbean.getScreen());
				ps.setDate(3, new java.sql.Date(utildate.getTime()));		
			}
			else if (show.equalsIgnoreCase("E"))
			{
				ps=con.prepareStatement("update booking_team5 set show3_gold=?  where screen =? and bookingdate=?");
				ps.setInt(1, updateSeats);
				ps.setInt(2, mbean.getScreen());
				ps.setDate(3, new java.sql.Date(utildate.getTime()));
			}		
		}

		int customerid=0;
		int rowsAffected = ps.executeUpdate();
		DatabaseUtil.closeStatement(ps);
		if(rowsAffected > 0){
			ps1=con.prepareStatement("select customerid from CUSTOMER_TEAM5 where email=?");
			ps1.setString(1, email);
			ResultSet res = ps1.executeQuery();
			while(res.next()){
				customerid=res.getInt(1);
			}
		}
		DatabaseUtil.closeStatement(ps1);
		ps2=con.prepareStatement("insert into ticket_team5 values(ticket_seq.nextval,?,?,?,?,?,?,?,?)");
		ps2.setInt(1, customerid);
		ps2.setDate(2, new java.sql.Date(utildate.getTime()));
		ps2.setInt(3, mbean.getScreen());
		ps2.setString(4, show);
		ps2.setInt(5, seatsNeeded);
		ps2.setString(6, classtype);
		ps2.setString(7, mbean.getName());
		ps2.setString(8, allocatedseats);

		int rowsAffect = ps2.executeUpdate();
		if(rowsAffect > 0){
			flag=true;
		}
		else{
			flag=false;
		}

		DatabaseUtil.closeStatement(ps2);
		DatabaseUtil.closeConnection(con);
		return flag;
	}
	
	public TicketBean ViewTicket(MovieBean mbean,Date utildate,String classType, String email) throws SQLException, ClassNotFoundException{		
		con=DatabaseUtil.getConnection();
		int customerid=0;
		TicketBean tbean=null;
		
		ps=con.prepareStatement("select customerid from CUSTOMER_TEAM5 where email=?");
		ps.setString(1, email);
		ResultSet res = ps.executeQuery();
		while(res.next()){
			customerid=res.getInt(1);
			System.out.println(customerid);
		}
		
		ps1=con.prepareStatement("select * from ticket_team5 where bookingdate=? and screen=? and show=? and classtype=?");
		ps1.setDate(1, new java.sql.Date(utildate.getTime()));
		ps1.setInt(2, mbean.getScreen());
		ps1.setString(3, mbean.getShow());
		ps1.setString(4, classType);
		
		res = ps1.executeQuery();
		while(res.next()){
			tbean=new TicketBean();
			tbean.setTicketID(res.getInt(1));
			tbean.setCustomerID(res.getInt(2));
			tbean.setBookingDate(res.getDate(3));
			tbean.setScreen(res.getInt(4));
			tbean.setShow(res.getString(5));
			tbean.setNoOfTickets(res.getInt(6));
			tbean.setClassType(res.getString(7));
			tbean.setMovieName(res.getString(8));
			tbean.setAllocatedSeats(res.getString(9));
		}
		DatabaseUtil.closeStatement(ps);
		DatabaseUtil.closeStatement(ps1);
		DatabaseUtil.closeConnection(con);
		return tbean;
	}
	
	public int viewSeatsAll(String classtype, int screen) throws SQLException, ClassNotFoundException{
		con=DatabaseUtil.getConnection();
		int totalseats=0;
		
		ps=con.prepareStatement("select seats from class_team5 where classtype=? and screen=?");
		ps.setString(1, classtype);
		ps.setInt(2, screen);
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			totalseats = rs.getInt(1);
		}
		 DatabaseUtil.closeStatement(ps);
		 DatabaseUtil.closeConnection(con);
		 return totalseats;
	}
	
	public String viewCustomerName(String email) throws SQLException, ClassNotFoundException{
		con=DatabaseUtil.getConnection();
		String first="";
		String last="";
		
		ps=con.prepareStatement("select fname, lname from CUSTOMER_TEAM5 where email=?");
		ps.setString(1, email);
		
		ResultSet res = ps.executeQuery();
		while(res.next()){
			first = res.getString(1);
			last = res.getString(2);
		}
		String name = first+last;
		System.out.println(name);
		DatabaseUtil.closeStatement(ps);
		DatabaseUtil.closeConnection(con);
		return first;
	}

	public ArrayList<TicketBean> viewbyticketid(int id) throws SQLException {
		// TODO Auto-generated method stub
		ArrayList<TicketBean> ticketList=new ArrayList<TicketBean>();
		TicketBean tbean=null;
		con=DatabaseUtil.getConnection();
		ps1=con.prepareStatement("select * from ticket_team5 where ticketid=?");
		ps1.setInt(1, id);
		ResultSet result=ps1.executeQuery();
		
		while(result.next())
		{
			tbean=new TicketBean();
			tbean.setTicketID(result.getInt(1));
			tbean.setCustomerID(result.getInt(2));
			tbean.setBookingDate(result.getDate(3));
			tbean.setScreen(result.getInt(4));
			tbean.setShow(result.getString(5));
			tbean.setNoOfTickets(result.getInt(6));
			tbean.setClassType(result.getString(7));
			tbean.setMovieName(result.getString(8));
			tbean.setAllocatedSeats(result.getString(9));
			
			ticketList.add(tbean);
			
		}
		
		DatabaseUtil.closeStatement(ps1);
		DatabaseUtil.closeConnection(con);
		return ticketList;
	}

	public ArrayList<TicketBean> viewbycustomerid(int id) throws SQLException {
		// TODO Auto-generated method stub		
		ArrayList<TicketBean> ticketList=new ArrayList<TicketBean>();
		TicketBean tbean=null;
		con=DatabaseUtil.getConnection();
		ps1=con.prepareStatement("select * from ticket_team5 where customerid=?");
		ps1.setInt(1, id);
		ResultSet result=ps1.executeQuery();
		
		while(result.next())
		{
			tbean=new TicketBean();
			tbean.setTicketID(result.getInt(1));
			tbean.setCustomerID(result.getInt(2));
			tbean.setBookingDate(result.getDate(3));
			tbean.setScreen(result.getInt(4));
			tbean.setShow(result.getString(5));
			tbean.setNoOfTickets(result.getInt(6));
			tbean.setClassType(result.getString(7));
			tbean.setMovieName(result.getString(8));
			tbean.setAllocatedSeats(result.getString(9));
			
			ticketList.add(tbean);
			
		}
		
		DatabaseUtil.closeStatement(ps1);
		DatabaseUtil.closeConnection(con);
		return ticketList;
	}

	public ArrayList<TicketBean> viewticketbyshow(String show)
			throws SQLException {
		ArrayList<TicketBean> ticketList=new ArrayList<TicketBean>();
		TicketBean tbean=null;
		con=DatabaseUtil.getConnection();
		ps1=con.prepareStatement("select * from ticket_team5 where show=?");
		ps1.setString(1, show);
		ResultSet result=ps1.executeQuery();
		
		while(result.next())
		{
			tbean=new TicketBean();
			tbean.setTicketID(result.getInt(1));
			tbean.setCustomerID(result.getInt(2));
			tbean.setBookingDate(result.getDate(3));
			tbean.setScreen(result.getInt(4));
			tbean.setShow(result.getString(5));
			tbean.setNoOfTickets(result.getInt(6));
			tbean.setClassType(result.getString(7));
			tbean.setMovieName(result.getString(8));
			tbean.setAllocatedSeats(result.getString(9));
			
			ticketList.add(tbean);
			
		}
		
		DatabaseUtil.closeStatement(ps1);
		DatabaseUtil.closeConnection(con);
		return ticketList;	}

	public ArrayList<TicketBean> viewticketbyscreen(int screen)
			throws SQLException {
		ArrayList<TicketBean> ticketList=new ArrayList<TicketBean>();
		TicketBean tbean=null;
		con=DatabaseUtil.getConnection();
		ps1=con.prepareStatement("select * from ticket_team5 where screen=?");
		ps1.setInt(1, screen);
		ResultSet result=ps1.executeQuery();
		
		while(result.next())
		{
			tbean=new TicketBean();
			tbean.setTicketID(result.getInt(1));
			tbean.setCustomerID(result.getInt(2));
			tbean.setBookingDate(result.getDate(3));
			tbean.setScreen(result.getInt(4));
			tbean.setShow(result.getString(5));
			tbean.setNoOfTickets(result.getInt(6));
			tbean.setClassType(result.getString(7));
			tbean.setMovieName(result.getString(8));
			tbean.setAllocatedSeats(result.getString(9));
			
			ticketList.add(tbean);
			
		}
		
		DatabaseUtil.closeStatement(ps1);
		DatabaseUtil.closeConnection(con);
		return ticketList;	}

	public ArrayList<TicketBean> viewbymoviename(String movie)
			throws SQLException {
		ArrayList<TicketBean> ticketList=new ArrayList<TicketBean>();
		TicketBean tbean=null;
		con=DatabaseUtil.getConnection();
		ps1=con.prepareStatement("select * from ticket_team5 where moviename=?");
		ps1.setString(1, movie);
		ResultSet result=ps1.executeQuery();
		
		while(result.next())
		{
			tbean=new TicketBean();
			tbean.setTicketID(result.getInt(1));
			tbean.setCustomerID(result.getInt(2));
			tbean.setBookingDate(result.getDate(3));
			tbean.setScreen(result.getInt(4));
			tbean.setShow(result.getString(5));
			tbean.setNoOfTickets(result.getInt(6));
			tbean.setClassType(result.getString(7));
			tbean.setMovieName(result.getString(8));
			tbean.setAllocatedSeats(result.getString(9));
			
			ticketList.add(tbean);
			
		}
		
		DatabaseUtil.closeStatement(ps1);
		DatabaseUtil.closeConnection(con);
		return ticketList;
	}

	public ArrayList<TicketBean> viewallbookedtickets() throws SQLException {
		ArrayList<TicketBean> ticketList=new ArrayList<TicketBean>();
		TicketBean tbean=null;
		con=DatabaseUtil.getConnection();
		ps1=con.prepareStatement("select * from ticket_team5");
		ResultSet result=ps1.executeQuery();
		
		while(result.next())
		{
			tbean=new TicketBean();
			tbean.setTicketID(result.getInt(1));
			tbean.setCustomerID(result.getInt(2));
			tbean.setBookingDate(result.getDate(3));
			tbean.setScreen(result.getInt(4));
			tbean.setShow(result.getString(5));
			tbean.setNoOfTickets(result.getInt(6));
			tbean.setClassType(result.getString(7));
			tbean.setMovieName(result.getString(8));
			tbean.setAllocatedSeats(result.getString(9));
			
			ticketList.add(tbean);
			
		}
		
		DatabaseUtil.closeStatement(ps1);
		DatabaseUtil.closeConnection(con);
		return ticketList;
		
	}

}

