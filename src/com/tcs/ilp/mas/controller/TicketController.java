package com.tcs.ilp.mas.controller;

import java.io.IOException;


import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.tcs.ilp.mas.bean.CustomerBean;
import com.tcs.ilp.mas.bean.MovieBean;
import com.tcs.ilp.mas.bean.TicketBean;
import com.tcs.ilp.mas.service.CustomerModel;
import com.tcs.ilp.mas.service.MovieModel;
import com.tcs.ilp.mas.service.TicketModel;

/**
 * Servlet implementation class TicketController
 */
public class TicketController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TicketController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession(true);
		String id=(String)session.getAttribute("emailid");
		String action = request.getParameter("action");
		String requestSource = request.getParameter("source");
		TicketModel tModel = new TicketModel();
		CustomerModel cModel = new CustomerModel();
		MovieBean mbean = null;
		CustomerBean cBean=null;

		ArrayList<String> languageList=new ArrayList<String>();
		ArrayList<String> movieList=new ArrayList<String>();
		ArrayList<Date> dateList = new ArrayList<Date>();
		ArrayList<Integer> screenList = new ArrayList<Integer>();
		ArrayList<String> showList=new ArrayList<String>();
		ArrayList<String> classList=new ArrayList<String>();

		int seats=0;		

		languageList.clear();
		languageList.add("English");
		languageList.add("Hindi");
		languageList.add("Malayalam");
		languageList.add("Tamil");
		languageList.add("Telugu");
		languageList.add("Kannada");


		request.setAttribute("languages", languageList);
		if(null==id)
		{
			request.setAttribute("Error" , "Session has expired.....Please Login");
			RequestDispatcher rd=request.getRequestDispatcher("jsp/login.jsp");
			rd.forward(request,response);
		}
		else{
			if(action == null){
				try {
					cBean=cModel.viewbyemail(id);
				} 
				catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}		
				//request.setAttribute("phoneNo", cBean);
				String phoneNo = String.valueOf(cBean.getPhoneno());
				request.setAttribute("phoneNo", phoneNo);
				RequestDispatcher disp=request.getRequestDispatcher("jsp/bookticket.jsp");
				disp.forward(request, response);
			}	
			if(action!=null&& action.equalsIgnoreCase("populateMovies")){
				String languageName = request.getParameter("language");
				String phoneNo = request.getParameter("phoneno");
				request.setAttribute("selectedLanguage", languageName);

				movieList.clear();
				request.setAttribute("Selectedlanguage", languageName);

				try{
					movieList=tModel.viewMovies(languageName);
				}
				catch(Exception e){}
				request.setAttribute("languages", languageList);	
				request.setAttribute("movies", movieList);	
				
				RequestDispatcher disp=request.getRequestDispatcher("jsp/bookticket.jsp");
				disp.forward(request, response);
			}


			//-------POPULATING DATE-------

			if(action!=null&& action.equalsIgnoreCase("populateDate")){

				String languageName = request.getParameter("language");
				String movieName = request.getParameter("movie");

				request.setAttribute("selectedLanguage", languageName);
				request.setAttribute("selectedMovie",movieName);

				dateList.clear();

				try{
					movieList=tModel.viewMovies(languageName);
					dateList=tModel.viewDate(languageName, movieName);


				}


				catch(Exception e){}

				request.setAttribute("languages", languageList);	
				request.setAttribute("movies", movieList);	
				request.setAttribute("date", dateList);	
				RequestDispatcher disp=request.getRequestDispatcher("jsp/bookticket.jsp");
				disp.forward(request, response);
			}


			//-------POPULATING SCREEN-----------

			if(action!=null&& action.equalsIgnoreCase("populateScreen")){

				String languageName = request.getParameter("language");
				String movieName = request.getParameter("movie");

				mbean = new MovieBean();
				mbean.setLanguage(languageName);
				mbean.setName(movieName);

				request.setAttribute("selectedLanguage", languageName);
				request.setAttribute("selectedMovie",movieName);

				String dateString = request.getParameter("date");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date utildate;
				try {
					utildate = sdf.parse(dateString);
					System.out.println("date:"+utildate);
					request.setAttribute("selectedDate", utildate);
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				screenList.clear();

				try{

					movieList=tModel.viewMovies(languageName);
					dateList=tModel.viewDate(languageName, movieName);
					screenList=tModel.viewScreen(mbean);
				}
				catch(Exception e){}

				request.setAttribute("languages", languageList);	
				request.setAttribute("movies", movieList);
				request.setAttribute("date", dateList);	
				request.setAttribute("screens", screenList);
				RequestDispatcher disp=request.getRequestDispatcher("jsp/bookticket.jsp");
				disp.forward(request, response);
			}

			//---------POPULATING SHOW----------------

			if(action!=null&& action.equalsIgnoreCase("populateShow")){

				System.out.println("entering show action");
				String languageName = request.getParameter("language");
				String movieName = request.getParameter("movie");
				int screen = Integer.parseInt(request.getParameter("screen"));

				mbean = new MovieBean();
				mbean.setLanguage(languageName);
				mbean.setName(movieName);
				mbean.setScreen(screen);
				
				

				request.setAttribute("selectedLanguage", languageName);
				request.setAttribute("selectedMovie",movieName);

				String dateString = request.getParameter("date");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date utildate;
				try {
					utildate = sdf.parse(dateString);
					System.out.println("date:"+utildate);
					request.setAttribute("selectedDate", utildate);
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}

				Integer screenInt = new Integer (screen);
				request.setAttribute("selectedScreen",screenInt);

				showList.clear();

				try{

					movieList=tModel.viewMovies(languageName);
					dateList=tModel.viewDate(languageName, movieName);
					screenList=tModel.viewScreen(mbean);
					showList=tModel.viewShow(mbean);

				}


				catch(Exception e){}

				request.setAttribute("languages", languageList);	
				request.setAttribute("movies", movieList);
				request.setAttribute("date", dateList);	
				request.setAttribute("screens", screenList);
				request.setAttribute("shows", showList);
				
				RequestDispatcher disp=request.getRequestDispatcher("jsp/bookticket.jsp");
				disp.forward(request, response);
			}
			
			//-------------POPULATING CLASS----------------
			
			
			
			if(action!=null&& action.equalsIgnoreCase("classtype")){

				System.out.println("entering show action");
				String languageName = request.getParameter("language");
				String movieName = request.getParameter("movie");
				int screen = Integer.parseInt(request.getParameter("screen"));
				String show = request.getParameter("show");

				mbean = new MovieBean();
				mbean.setLanguage(languageName);
				mbean.setName(movieName);
				mbean.setScreen(screen);
				mbean.setShow(show);
				
				

				request.setAttribute("selectedLanguage", languageName);
				request.setAttribute("selectedMovie",movieName);

				String dateString = request.getParameter("date");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date utildate;
				try {
					utildate = sdf.parse(dateString);
					System.out.println("date:"+utildate);
					request.setAttribute("selectedDate", utildate);
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}

				Integer screenInt = new Integer (screen);
				request.setAttribute("selectedScreen",screenInt);
				request.setAttribute("selectedShow",show);

				classList.clear();

				try{

					movieList=tModel.viewMovies(languageName);
					dateList=tModel.viewDate(languageName, movieName);
					screenList=tModel.viewScreen(mbean);
					showList=tModel.viewShow(mbean);
					classList.add("Gold");
					classList.add("Silver");

				}


				catch(Exception e){}

				request.setAttribute("languages", languageList);	
				request.setAttribute("movies", movieList);
				request.setAttribute("date", dateList);	
				request.setAttribute("screens", screenList);
				request.setAttribute("shows", showList);
				request.setAttribute("classestype", classList);
				
				RequestDispatcher disp=request.getRequestDispatcher("jsp/bookticket.jsp");
				disp.forward(request, response);
			}
			

			//------------CHECKING SEATS AVAILABILITY-------------


			if(action!=null&& action.equalsIgnoreCase("checkSeats")){
				String languageName = request.getParameter("language");
				String movieName = request.getParameter("movie");
				int screen = Integer.parseInt(request.getParameter("screen"));
				String show = request.getParameter("show");
				String classtype =request.getParameter("classtype");

				mbean = new MovieBean();
				mbean.setLanguage(languageName);
				mbean.setName(movieName);
				mbean.setScreen(screen);
				mbean.setShow(show);

				request.setAttribute("selectedLanguage", languageName);
				request.setAttribute("selectedMovie",movieName);

				String dateString = request.getParameter("date");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date utildate;
				try {
					utildate = sdf.parse(dateString);
					request.setAttribute("selectedDate", utildate);
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}

				Integer screenInt = new Integer (screen);
				request.setAttribute("selectedScreen",screenInt);
				request.setAttribute("selectedShow",show);
				request.setAttribute("classtype",classtype);


				try {
					utildate = sdf.parse(dateString);

					movieList=tModel.viewMovies(languageName);
					dateList=tModel.viewDate(languageName, movieName);
					screenList=tModel.viewScreen(mbean);
					showList=tModel.viewShow(mbean);
					classList.add("Gold");
					classList.add("Silver");

					seats=tModel.checkSeats(mbean,utildate,classtype);
				} 
				catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}

				request.setAttribute("languages", languageList);	
				request.setAttribute("movies", movieList);
				request.setAttribute("date", dateList);	
				request.setAttribute("screens", screenList);
				request.setAttribute("shows", showList);
				request.setAttribute("classestype", classList);

				Integer seatsInt = new Integer (seats);
				request.setAttribute("seatsAvailable",seatsInt);
				RequestDispatcher disp=request.getRequestDispatcher("jsp/bookticket.jsp");
				disp.forward(request, response);
			}

			//-------------CALCULATING PRICE-------------


			if(action!=null&& action.equalsIgnoreCase("price")){
				String languageName = request.getParameter("language");
				String movieName = request.getParameter("movie");
				int screen = Integer.parseInt(request.getParameter("screen"));
				String show = request.getParameter("show");
				String classtype =request.getParameter("classtype");
				int seatsNeeded=0;
				//---------------------modification in code-------------------------------------------------
				String show_me = request.getParameter("temp");
				int seatsAvailable = Integer.parseInt(show_me);
				//int seatsAvailable = Integer.parseInt(request.getParameter("seatsavailable"));
				//--------------------------------------------------------------------------------------------
				try{
				seatsNeeded = Integer.parseInt(request.getParameter("seatsneeded"));
				}
				catch(Exception e){
					System.out.println("Number Format Exception");
				}
				int price=0;

				mbean = new MovieBean();
				mbean.setLanguage(languageName);
				mbean.setName(movieName);
				mbean.setScreen(screen);
				mbean.setShow(show);

				request.setAttribute("selectedLanguage", languageName);
				request.setAttribute("selectedMovie",movieName);

				String dateString = request.getParameter("date");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date utildate;
				try {
					utildate = sdf.parse(dateString);
					request.setAttribute("selectedDate", utildate);
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}

				Integer screenInt = new Integer (screen);
				request.setAttribute("selectedScreen",screenInt);
				request.setAttribute("selectedShow",show);
				request.setAttribute("classtype", classtype);

				Integer seatsAvail = new Integer (seatsAvailable);
				request.setAttribute("seatsAvailable",seatsAvail);

				Integer seatsNeed = new Integer (seatsNeeded);
				request.setAttribute("seatsNeeded",seatsNeed);


				try {
					utildate = sdf.parse(dateString);

					movieList=tModel.viewMovies(languageName);
					dateList=tModel.viewDate(languageName, movieName);
					screenList=tModel.viewScreen(mbean);
					showList=tModel.viewShow(mbean);
					classList.add("Gold");
					classList.add("Silver");
					seats=tModel.checkSeats(mbean,utildate,classtype);

					price=tModel.calculatingPrice(mbean,seatsAvailable, seatsNeeded, utildate, classtype);
				} 
				catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}

				request.setAttribute("languages", languageList);	
				request.setAttribute("movies", movieList);
				request.setAttribute("date", dateList);	
				request.setAttribute("screens", screenList);
				request.setAttribute("shows", showList);
				request.setAttribute("classestype", classList);

				Integer seatsInt = new Integer (seats);
				request.setAttribute("seatsAvailable",seatsInt);

				seatsNeed = new Integer (seatsNeeded);
				request.setAttribute("seatsNeeded",seatsNeed);

				Integer totalprice = new Integer (price);
				request.setAttribute("totalPrice",totalprice);
				RequestDispatcher disp=request.getRequestDispatcher("jsp/bookticket.jsp");
				disp.forward(request, response);
			}

			//-------BOOKING TICKET-------------


			if(action!=null&& action.equalsIgnoreCase("bookTicketNow")){
				TicketBean tBean=null;
				int totalSeats=0;
				String languageName = request.getParameter("language");
				String movieName = request.getParameter("movie");
				int screen = Integer.parseInt(request.getParameter("screen"));
				String show = request.getParameter("show");

				mbean = new MovieBean();
				mbean.setLanguage(languageName);
				mbean.setName(movieName);
				mbean.setScreen(screen);
				mbean.setShow(show);

				String show_me = request.getParameter("temp");
				int seatsAvailable = Integer.parseInt(show_me);
				int seatsNeeded = Integer.parseInt(request.getParameter("seatsneeded"));
				String classtype =request.getParameter("classtype");
				String dateString = request.getParameter("date");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date utildate;
				try {
					utildate = sdf.parse(dateString);
					request.setAttribute("selectedDate", utildate);
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}

				String showprice = request.getParameter("ptemp");
				int price = Integer.parseInt(showprice);
				boolean flag = false;
				String name="";
				String s="";

				try {
					utildate = sdf.parse(dateString);
					name = tModel.viewCustomerName(id);
					totalSeats = tModel.viewSeatsAll(classtype, screen);
					if(seatsNeeded <= seatsAvailable){
						for(int i=totalSeats-seatsAvailable+1;i<totalSeats-seatsAvailable+1+seatsNeeded;i++){
							s+=i+", ";
							System.out.println(s);
					}			
						flag = tModel.BookTicket(mbean, seatsAvailable, seatsNeeded, utildate, classtype, id, show, price, s);
						tBean = tModel.ViewTicket(mbean, utildate, classtype, id);
						flag=true;
					}
					else{
						flag=false;
					}

				} 
				catch (ParseException e) {
					e.printStackTrace();
				}
				catch (ClassNotFoundException e) {
					e.printStackTrace();
				} 
				catch (SQLException e) {
					e.printStackTrace();
				}
				
				Integer totalprice = new Integer(price);
				if(flag){
					//request.setAttribute("TicketBookedSuccess", tBean);
					request.setAttribute("customername", name);
					request.setAttribute("totalprice", totalprice);
					session.setAttribute("TryBean", tBean);
					RequestDispatcher disp=request.getRequestDispatcher("jsp/payment.jsp");
					disp.forward(request, response);
				}
				else{
					RequestDispatcher disp=request.getRequestDispatcher("jsp/bookticketfailure.jsp");
					disp.forward(request, response);
				}
			}
			
			//--------CANCEL BOOK TICKET--------------
			
			if(action!=null&& action.equalsIgnoreCase("bookcancel")){				
				RequestDispatcher disp=request.getRequestDispatcher("jsp/bookticket.jsp");
				disp.forward(request, response);
				return;
			}
			
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
