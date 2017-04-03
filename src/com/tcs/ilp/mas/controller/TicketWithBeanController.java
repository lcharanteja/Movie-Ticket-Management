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

import oracle.net.ns.SessionAtts;

import com.tcs.ilp.mas.bean.CustomerBean;
import com.tcs.ilp.mas.bean.MovieBean;
import com.tcs.ilp.mas.bean.TicketBean;
import com.tcs.ilp.mas.service.CustomerModel;
import com.tcs.ilp.mas.service.MovieModel;
import com.tcs.ilp.mas.service.TicketModel;

/**
 * Servlet implementation class TicketWithBeanController
 */
public class TicketWithBeanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TicketWithBeanController() {
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
		MovieModel mModel = new MovieModel();
		String action = request.getParameter("action");
		RequestDispatcher disp = null;
		MovieBean mBean = new MovieBean();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		ArrayList<String> classList = new ArrayList<String>();
		TicketModel tModel = new TicketModel();
		
		if(action.equalsIgnoreCase("moviebeanforticket"))
		{
			System.out.println("daadcasav");
			int movieId = Integer.parseInt(request.getParameter("id"));
			try {
				
				mBean = mModel.searchMovieById(movieId);
				System.out.println(mBean.getName());
				request.setAttribute("moviebeanforticket", mBean);
				disp = request.getRequestDispatcher("jsp/bookticketwithbean.jsp");
				disp.forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		else if(action.equalsIgnoreCase("checkforavailability"))
		{
			int movieId = Integer.parseInt(request.getParameter("id"));
			
			try {
				classList.add("Gold");
				classList.add("Silver");
				String date = request.getParameter("date");
				mBean = mModel.searchMovieById(movieId);
				request.setAttribute("name", mBean.getName());
				request.setAttribute("id", mBean.getMovieId());
				request.setAttribute("language", mBean.getLanguage());
				request.setAttribute("screen",mBean.getScreen());
			    request.setAttribute("show",mBean.getShow());
				request.setAttribute("selectedDate", date);
				request.setAttribute("classestype",classList);
				disp = request.getRequestDispatcher("jsp/checkforavailability.jsp");
				disp.forward(request, response);
			}
				catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		//------------CHECKING SEATS AVAILABILITY-------------


		else if(action!=null&& action.equalsIgnoreCase("checkSeats"))
		{
			int movieId = Integer.parseInt(request.getParameter("id"));
			try {
				mBean = mModel.searchMovieById(movieId);
				String classtype = request.getParameter("classtype");
				String getdate = request.getParameter("tempd");
				SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date utildate;
				try{
					utildate=sd.parse(getdate);
					request.setAttribute("selectedDate", getdate);
				}
				catch(ParseException e){
					e.printStackTrace();
				}
				request.setAttribute("classtype", classtype);
				
				request.setAttribute("name", mBean.getName());
				request.setAttribute("id", mBean.getMovieId());
				request.setAttribute("language", mBean.getLanguage());
				request.setAttribute("screen",mBean.getScreen());
			    request.setAttribute("show",mBean.getShow());
				//request.setAttribute("selectedDate", request.getParameter("date"));
				request.setAttribute("classtype", classtype);
				int seats = 0;
				try{
					utildate=sd.parse(getdate);
					classList.add("Gold");
					classList.add("Silver");
					seats=tModel.checkSeats(mBean,utildate,classtype);
				}
				catch(ParseException e){
					e.printStackTrace();
				}
				Integer seatsInt = new Integer (seats);
				request.setAttribute("classestype", classList);
				request.setAttribute("seatsAvailable",seatsInt);
				disp=request.getRequestDispatcher("jsp/checkforavailability.jsp");
				disp.forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			
		}

		//-------------CALCULATING PRICE-------------


		else if(action!=null&& action.equalsIgnoreCase("price")){
			
			int price=0;
			int seatsAvailable=0;
			int seatsNeeded=0;
			int movieId = Integer.parseInt(request.getParameter("id"));
			String classtype = request.getParameter("classtype");
			String getdate = request.getParameter("tempd");
			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date utildate;
			try{
				classList.add("Gold");
				classList.add("Silver");
				utildate=sd.parse(getdate);
				request.setAttribute("selectedDate", getdate);
			}
			catch(ParseException e){
				e.printStackTrace();
			}
			
			try{
				seatsNeeded = Integer.parseInt(request.getParameter("seatsneeded"));
			}
			catch(Exception e){
				System.out.println("Number Format Exception");
			}
			
			
			try{
				utildate=sd.parse(getdate);
				String tempp = request.getParameter("temp1");
				seatsAvailable = Integer.parseInt(tempp);
				mBean = mModel.searchMovieById(movieId);			
				price=tModel.calculatingPrice(mBean,seatsAvailable, seatsNeeded, utildate, classtype);
				
				request.setAttribute("classestype", classList);
				request.setAttribute("id", mBean.getMovieId());
				request.setAttribute("classtype", classtype);
				request.setAttribute("language", mBean.getLanguage());
				request.setAttribute("name", mBean.getName());
				request.setAttribute("screen",mBean.getScreen());
			    request.setAttribute("show",mBean.getShow());
				request.setAttribute("selectedDate", getdate);
				request.setAttribute("seatsAvailable",seatsAvailable);
				request.setAttribute("seatsNeeded", seatsNeeded);
				request.setAttribute("totalPrice", price);
				
				disp=request.getRequestDispatcher("jsp/checkforavailability.jsp");
				disp.forward(request, response);
			}
			catch(NumberFormatException e){
				e.printStackTrace();
			}
			catch(SQLException e){
				e.printStackTrace();
			}
			catch(ClassNotFoundException e){
				e.printStackTrace();
			}
			catch(ParseException e){
				e.printStackTrace();
			}
			catch(Exception e){
				e.printStackTrace();
			}
		}
		
		else if(action!=null && action.equalsIgnoreCase("bookTicketNow")){
			TicketBean tBean=null;
			int totalSeats=0;
			int price=0;
			int seatsAvailable=0;
			int seatsNeeded=0;
			int movieId = Integer.parseInt(request.getParameter("id"));
			String classtype = request.getParameter("classtype");
			String getdate = request.getParameter("tempd");
			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date utildate;
			try{
				classList.add("Gold");
				classList.add("Silver");
				utildate=sd.parse(getdate);
				request.setAttribute("selectedDate", getdate);
			}
			catch(ParseException e){
				e.printStackTrace();
			}
			
			String showprice = request.getParameter("ptemp");
			price = Integer.parseInt(showprice);
			boolean flag = false;
			String name="";
			String s="";

			try {
				mBean = mModel.searchMovieById(movieId);
				int screen = mBean.getScreen();
				String show = mBean.getShow();
				utildate=sd.parse(getdate);
				String tempp = request.getParameter("temp1");
				seatsAvailable = Integer.parseInt(tempp);
				seatsNeeded = Integer.parseInt(request.getParameter("seatsneeded"));
				name = tModel.viewCustomerName(id);
				totalSeats = tModel.viewSeatsAll(classtype, screen);
				System.out.println("total seats are="+totalSeats);
				if(seatsNeeded <= seatsAvailable){
					for(int i=totalSeats-seatsAvailable+1;i<totalSeats-seatsAvailable+1+seatsNeeded;i++){
						s+=i+", ";
						System.out.println("seat numbers are"+s);
				}			
					flag = tModel.BookTicket(mBean, seatsAvailable, seatsNeeded, utildate, classtype, id, show, price, s);
					tBean = tModel.ViewTicket(mBean, utildate, classtype, id);
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
				disp=request.getRequestDispatcher("jsp/payment.jsp");
				disp.forward(request, response);
			}
			else{
				disp=request.getRequestDispatcher("jsp/bookticketfailure.jsp");
				disp.forward(request, response);
			}
		}

//------------------------------------check seats ends---------------------------------------------		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
