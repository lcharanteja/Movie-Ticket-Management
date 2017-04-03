package com.tcs.ilp.mas.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tcs.ilp.mas.bean.CustomerBean;
import com.tcs.ilp.mas.bean.MovieBean;
import com.tcs.ilp.mas.bean.TicketBean;
import com.tcs.ilp.mas.service.TicketModel;

/**
 * Servlet implementation class ViewController
 */
public class ViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		String requestSource = request.getParameter("source");
		String requestAction = request.getParameter("action");
		HttpSession session = request.getSession();
		RequestDispatcher rd = null;
		TicketModel tModel = new TicketModel();
		String email = (String) session.getAttribute("emailid");
		MovieBean mbean = null;
		
		if("bookedhistory".equalsIgnoreCase(requestSource)){
			if(email==null){
				request.setAttribute("Error" , "Session has expired.....Please Login");
				rd=request.getRequestDispatcher("jsp/login.jsp");
				rd.forward(request, response);
			}
			else{
				try {
					ArrayList<TicketBean> ticketList = tModel.viewAllTicket(email);
					
						request.setAttribute("allTickets", ticketList);
						rd = request.getRequestDispatcher("jsp/bookedhistory.jsp");
						rd.forward(request, response);
						return;
					
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		else if(requestAction!=null&& "ConfirmTicket".equalsIgnoreCase(requestAction)){
			if(email==null){
				request.setAttribute("Error" , "Session has expired.....Please Login");
				rd=request.getRequestDispatcher("jsp/login.jsp");
				rd.forward(request, response);
			}
			else{
				TicketBean tbean=(TicketBean) session.getAttribute("TryBean");				
				request.setAttribute("TicketBeans", tbean);
				RequestDispatcher disp=request.getRequestDispatcher("jsp/bookticketsuccess.jsp");
				disp.forward(request, response);
			}
		}
	 
	 /////////////////////adminpart////////////////////////////////
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
