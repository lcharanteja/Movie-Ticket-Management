package com.tcs.ilp.mas.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import oracle.net.ns.SessionAtts;

import com.tcs.ilp.mas.bean.CustomerBean;
import com.tcs.ilp.mas.bean.LoginBean;
import com.tcs.ilp.mas.bean.TicketBean;
import com.tcs.ilp.mas.dao.MovieImpl;
import com.tcs.ilp.mas.service.CustomerModel;
import com.tcs.ilp.mas.service.TicketModel;

/**
 * Servlet implementation class UserController
 */
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	HttpSession session=request.getSession(true);
	TicketModel tModel = new TicketModel();
	String requestsource = request.getParameter("source");
	System.out.println(requestsource);
	if(requestsource.equals("aboutusl"))
		response.sendRedirect("jsp/aboutusl.jsp");

	if(requestsource.equals("adminlogin"))
		response.sendRedirect("jsp/adminlogin.jsp");

	if(requestsource.equals("contactusl"))
		response.sendRedirect("jsp/contactusl.jsp");

	if(requestsource.equals("deactivatereason"))
		response.sendRedirect("jsp/deactivate.jsp");

	
	if(requestsource.equals("deactivatesuccess"))
		response.sendRedirect("jsp/deactivatesuccess.jsp");
	
	if(requestsource.equals("login"))
	{
		
		MovieImpl mImpl = new MovieImpl();
		try {
			ArrayList<Integer> idList = mImpl.getIds();
			System.out.println(idList.get(0));
			if(!idList.isEmpty())
			{ 
				RequestDispatcher disp = null;
				request.setAttribute("idlist", idList);
			disp = request.getRequestDispatcher("jsp/login.jsp");
			disp.include(request, response);
			}
			} 
		
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	if(requestsource.equals("registration"))
		response.sendRedirect("jsp/registration.jsp");

	if(requestsource.equals("userlogin"))
	{
		response.sendRedirect("jsp/userlogin.jsp");
			}
	if(requestsource.equals("logout"))
	{
		session.removeAttribute("emailid");
		session.invalidate();
		response.sendRedirect("jsp/logout.jsp");
	
	}
	
	

	PrintWriter out=response.getWriter();
	RequestDispatcher disp=null;

	CustomerBean cbean;
	CustomerModel cmodel=new CustomerModel();
	
	if(requestsource.equals("registrationform")){
		cbean=new CustomerBean();
		String	firstname=request.getParameter("fname");	
		String	lastname=request.getParameter("lname");
		String gender=request.getParameter("gender");
		String dob=request.getParameter("dob");
		SimpleDateFormat sd=new SimpleDateFormat("yyyy-MM-dd"); 
		java.util.Date utildate;
		try {
			utildate = sd.parse(dob);
			cbean.setDob(utildate);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		long phoneno=Long.parseLong(request.getParameter("phno"));
		String city=request.getParameter("city");
		String location=request.getParameter("location");
		String email=request.getParameter("eaddress");
		String password=request.getParameter("Rpassword");
		
		cbean.setFirstname(firstname);
		cbean.setLastname(lastname);
		cbean.setGender(gender);

		cbean.setPhoneno(phoneno);
		cbean.setCity(city);
		cbean.setLocation(location);
		cbean.setEmail(email);
		cbean.setPassword(password);
		
		CustomerBean cBean1=new CustomerBean();
	
			
		try {
			boolean flag=cmodel.addCustomer(cbean);
			
			
				if(flag==true)
				{
				cBean1 = cmodel.viewbyemail(email);
				
				request.setAttribute("customer", cBean1);
				disp=request.getRequestDispatcher("jsp/registersuccess.jsp");
				disp.forward(request, response);
			}
				else
				{
					 disp=request.getRequestDispatcher("jsp/registerfail.jsp");

						disp.forward(request, response);
				}
					
		     } catch (SQLException e) {
		    	 disp=request.getRequestDispatcher("jsp/registerfail.jsp");

					disp.forward(request, response);
//					out.println("<link rel='stylesheet' href='css/layout.css' type='text/css' />");
//					out.println("<div id=\"" + "gallery" + "\">"+"<font color=\"" + "#FF0000" +"\">" + "Not correct" + "</font>\n" + "</div>");
		     }
					
	}
	

//////////////////////////user/admin  login   /////////////////////////////////////////////////////////////////////////////	
	if(requestsource.equals("signin")){
		String error=null;
		CustomerBean cBean;
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		LoginBean lb=new LoginBean();
		lb.setEmail(email);
		lb.setPassword(password);
		String role=cmodel.authenticate(lb);
		String status=cmodel.authenticateStatus(lb);
		try {
			cBean = cmodel.viewbyemail(email);
		
		if(role.equals("customer") && status.equals("active") && cBean!=null)
		{
		
			session.setAttribute("emailid",email);
		   session.setAttribute("customername", cBean.getFirstname());
			disp=request.getRequestDispatcher("jsp/userlogin.jsp");
			disp.forward(request, response);
		}
		else 
			if(role.equals("admin"))
			{
				//	out.println("login success");
				session.setAttribute("emailid",email);
				disp=request.getRequestDispatcher("jsp/adminlogin.jsp");
				disp.forward(request, response);
			}
			else if(role.equals("a") || status.equals("deactive") ) 
			{
				error="error";
				request.setAttribute("error", error);
				 response.sendRedirect("jsp/loginFail.jsp");
			     
			}
		}
		 catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
//////////////////////////view all users details/////////////////////////////////////////////////////////////////////////////		
	
	if(requestsource.equals("customerdetails"))
	/*{
		 String id=(String)session.getAttribute("emailid");
		   if(id==null)
		   {
		    request.setAttribute("Error" , "Session has expired.....Please Login");
		     RequestDispatcher rd=request.getRequestDispatcher("jsp/login.jsp");
		     rd.forward(request,response);
		   }
		   else*/{

	try {
		ArrayList<CustomerBean> customerList=cmodel.viewAllCustomer();
	

		if(!customerList.isEmpty())
		{
		
			request.setAttribute("customerlist",customerList);
			disp=request.getRequestDispatcher("jsp/customerdetails.jsp");
			disp.forward(request, response);
		}

	} catch (SQLException e) {
		// TODO Auto-generated catch block
		out.println(e);
	}
		   }
	
//////////////////////////user details/////////////////////////////////////////////////////////////////////////////		
	if(requestsource.equals("myprofile1"))
	{
		 String id=(String)session.getAttribute("emailid");
		   if(null==id)
		   {
		    request.setAttribute("Error" , "Session has expired.....Please Login");
		     RequestDispatcher rd=request.getRequestDispatcher("jsp/login.jsp");
		     rd.forward(request,response);
		   }
		   else{
		
			String email=request.getParameter("eaddress");
			CustomerBean cBean;
			try {
				cBean = cmodel.viewbyemail(email);
				if(cBean!=null)
				{
					
					request.setAttribute("customer", cBean);
				
			disp=request.getRequestDispatcher("jsp/myprofile.jsp");
				disp.include(request, response);
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
	}
	}
	
	if(requestsource.equals("myprofile"))
	{
		String email=(String)session.getAttribute("emailid");
		CustomerBean cBean;
		try {
			cBean = cmodel.viewbyemail(email);
			if(cBean!=null)
			{
				request.setAttribute("customer", cBean);
				disp=request.getRequestDispatcher("jsp/profileoption.jsp");
			disp.include(request, response);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
}

//////////////////////////user profile update//////////////////////////////////////////////
	
	if(requestsource.equals("updatemyprofile"))
	{
		 String id2=(String)session.getAttribute("emailid");
		   if(null==id2)
		   {
		    request.setAttribute("Error" , "Session has expired.....Please Login");
		     RequestDispatcher rd=request.getRequestDispatcher("jsp/login.jsp");
		     rd.forward(request,response);
		   }
		   else{
		cbean=new CustomerBean();
		
		String	firstname=request.getParameter("fname");	
		 String	lastname=request.getParameter("lname");
		 // String gender=request.getParameter("gender");
		  String dob=request.getParameter("dob");
		  SimpleDateFormat sd=new SimpleDateFormat("yyyy-MM-dd"); 
		  java.util.Date utildate=null;
		try {
			utildate = sd.parse(dob);
			cbean.setDob(utildate);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		  
		  long phoneno=Long.parseLong(request.getParameter("phno"));
		  String city=request.getParameter("city");
		  String location=request.getParameter("location");
		 // String email=request.getParameter("eaddress");
		  cbean.setFirstname(firstname);
		  cbean.setLastname(lastname);
		  //cbean.setGender(gender);
		  cbean.setDob(utildate);
		  cbean.setPhoneno(phoneno);
		  cbean.setCity(city);
		  cbean.setLocation(location);
		
		try {
			CustomerBean cbean1=cmodel.viewbyemail(id2);
		
		if(cbean.getFirstname().equals(cbean1.getFirstname()) && cbean.getLastname().equals(cbean1.getLastname()) && cbean.getDob().equals(cbean1.getDob()) && (cbean.getPhoneno()==cbean1.getPhoneno()) && cbean.getCity().equals(cbean1.getCity()) && cbean.getLocation().equals(cbean1.getLocation())){
		request.setAttribute("customer", cbean1);
			disp=request.getRequestDispatcher("jsp/updateuserfailure.jsp");
		disp.forward(request, response);
		}
		else if(cmodel.customerProfileUpdate(cbean, id2))
			{
				session.setAttribute("emailid",id2);
				disp=request.getRequestDispatcher("jsp/userUpDateSuccess.jsp");
				disp.include(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
		   
	}
	
	
	
	
	if(requestsource.equals("changepassword"))
	{
		 String id=(String)session.getAttribute("emailid");
		   if(null==id)
		   {
		    request.setAttribute("Error" , "Session has expired.....Please Login");
		     RequestDispatcher rd=request.getRequestDispatcher("jsp/login.jsp");
		     rd.forward(request,response);
		   }
		   else{
		
			String email=request.getParameter("eaddress");
			CustomerBean cBean;
			try {
				cBean = cmodel.viewbyemail(email);
				if(cBean!=null)
				{
					
					request.setAttribute("password", cBean.getPassword());
				
			disp=request.getRequestDispatcher("jsp/changepassword.jsp");
				disp.include(request, response);
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
	}
	}
	
	
	
	
	if(requestsource.equals("updatepassword"))
	{
		 String id2=(String)session.getAttribute("emailid");
		   if(null==id2)
		   {
		    request.setAttribute("Error" , "Session has expired.....Please Login");
		     RequestDispatcher rd=request.getRequestDispatcher("jsp/login.jsp");
		     rd.forward(request,response);
		   }
		   else{
		  String password=request.getParameter("newpassword");
		System.out.println(password);
		try {
			if(cmodel.updatePassword(password, id2))
			{
				session.setAttribute("emailid",id2);
				disp=request.getRequestDispatcher("jsp/userUpDatePassword.jsp");
				disp.include(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
		   
	}
//////////////////////////Admin Deactivation//////////////////////////////////////////////
		
		if(requestsource.equals("deactivatecustomer"))
		{
			
		try {
			ArrayList<CustomerBean> customerList=cmodel.viewActivatedCustomer();
			if(!customerList.isEmpty())
			{
				request.setAttribute("customerlist",customerList);
				disp=request.getRequestDispatcher("jsp/deactivatecustomer.jsp");
				disp.forward(request, response);
			}else{
				request.setAttribute("customerlist",customerList);
				disp=request.getRequestDispatcher("jsp/deactivatecustomer.jsp");
				disp.forward(request, response);
				
			}
		}catch (SQLException e) {
				// TODO Auto-generated catch block
				out.println(e);
			}
			}
		
		if(requestsource.equals("activatecustomer"))
		{
			
		try {
			ArrayList<CustomerBean> customerList=cmodel.viewDeactivatedCustomer();
			
				request.setAttribute("customerlist",customerList);
				disp=request.getRequestDispatcher("jsp/activatecustomer.jsp");
				disp.forward(request, response);
		
		}catch (SQLException e) {
				// TODO Auto-generated catch block
				out.println(e);
			}
			}
		
		if(requestsource.equals("deactivated"))
		{
			String email=request.getParameter("email");
			String reason=request.getParameter("dreason");
		
			try {
				boolean flag=cmodel.deactivateCustomer(email, reason);
				
				if(flag)
				{
					disp=request.getRequestDispatcher("jsp/deactivatedsuccessfully.jsp");
					disp.forward(request, response);
				}
		}catch (SQLException e) {
				// TODO Auto-generated catch block
				out.println(e);
			}
			}
		if(requestsource.equals("activated"))
		{
			String email=request.getParameter("email");

		try {
			boolean flag=cmodel.activateCustomer(email);
			if(flag)
			{
				
				request.setAttribute("id", email);
				disp=request.getRequestDispatcher("jsp/activatedsuccessfully.jsp");
				//out.println("Deactivated Successfully with email id " + email);
				disp.include(request, response);
			}
		}catch (SQLException e) {
				// TODO Auto-generated catch block
				out.println(e);
			}
			}

		
		
		if(requestsource.equals("deactivatebycustomer"))
		{
			 String id3=(String)session.getAttribute("emailid");
			   if(null==id3)
			   {
			    request.setAttribute("Error" , "Session has expired.....Please Login");
			     RequestDispatcher rd=request.getRequestDispatcher("jsp/login.jsp");
			     rd.forward(request,response);
			   }
			   else{
			String emailid=(String)session.getAttribute("emailid");
		
			String reason=request.getParameter("reason");

		try {
			boolean flag=cmodel.deactivateCustomer(emailid, reason);
			
			if(flag)
			{
				disp=request.getRequestDispatcher("jsp/deactivatesuccess.jsp");
				disp.forward(request, response);
			}
		}catch (SQLException e) {
				// TODO Auto-generated catch block
				out.println(e);
			}
			}
		}
		
		
		if(requestsource.equals("viewbyid"))
		{
			 String i=(String)session.getAttribute("emailid");
			   if(i==null)
			   {
			    request.setAttribute("Error" , "Session has expired.....Please Login");
			     RequestDispatcher rd=request.getRequestDispatcher("jsp/login.jsp");
			     rd.forward(request,response);
			   }
			   else{
int id=Integer.parseInt(request.getParameter("id"));
/*String location=request.getParameter("location");
String city=request.getParameter("city");
String status=request.getParameter("status");*/
//if(location==null && city==null && status==null){

		try {
			CustomerBean cBean=cmodel.viewbyid(id);
		

			if(cBean!=null)
			{
			
				request.setAttribute("customer",cBean);
				disp=request.getRequestDispatcher("jsp/viewbyid.jsp");
				disp.forward(request, response);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.println(e);
		}
			   }
		}	
		//if(id==0 && city==null && status==null){
		if(requestsource.equals("viewbyemailid")){
			
			String email=request.getParameter("id");
			try {
				CustomerBean customer=cmodel.viewbyemail(email);
				

				if(customer!=null && customer.getStatus().equalsIgnoreCase("active"))
				{
				
					request.setAttribute("customer",customer);
					disp=request.getRequestDispatcher("jsp/viewtodeactivate.jsp");
					disp.forward(request, response);
				}else if(customer!=null && customer.getStatus().equalsIgnoreCase("deactive")) {
					request.setAttribute("customer",customer);
					disp=request.getRequestDispatcher("jsp/viewtoactivate.jsp");
					disp.forward(request, response);
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				out.println(e);
			}
				   }
		if(requestsource.equals("searchcustomer")){
			String searchby=request.getParameter("searchby");
				
			if(searchby.equals("Id")){
				
			int id=Integer.parseInt(request.getParameter("Id"));	
			
			try {
				CustomerBean customer=cmodel.viewbyid(id);
					if(customer!=null)
				{
				
					request.setAttribute("customer",customer);
					disp=request.getRequestDispatcher("jsp/viewbyid.jsp");
					disp.forward(request, response);
				}
					else
					{
						request.setAttribute("customer",customer);
						disp=request.getRequestDispatcher("jsp/viewbyid.jsp");
						disp.forward(request, response);
					}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				out.println(e);
			}
			}
			else if(searchby.equals("City")){
				String city=request.getParameter("drop");
				;
				
				try {
					ArrayList<CustomerBean> customerlist=cmodel.viewbycity(city);
					request.setAttribute("customerlist",customerlist);
					disp=request.getRequestDispatcher("jsp/viewbylocation.jsp");
					disp.forward(request, response);
			

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					out.println(e);
				}
			}
			else if(searchby.equals("Status")){
				String status=request.getParameter("drop");
				try {
					ArrayList<CustomerBean> customerlist=cmodel.viewbystatus(status);
			
				
				
					request.setAttribute("customerlist",customerlist);
					disp=request.getRequestDispatcher("jsp/viewbylocation.jsp");
					disp.forward(request, response);
				

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					out.println(e);
				}
			}
			if(searchby.equals("Location")){
				
				String location=request.getParameter("drop");
			
					try {
						
						ArrayList<CustomerBean> customerlist=cmodel.viewbylocation(location);
						
						
							request.setAttribute("customerlist",customerlist);
							disp=request.getRequestDispatcher("jsp/viewbylocation.jsp");
							disp.forward(request, response);
						

					} catch (SQLException e) {
						// TODO Auto-generated catch block
						out.println(e);
					}
			}
			}
		

		if(requestsource.equals("ticketdetails"))
		{

				try {
					ArrayList<TicketBean> ticketList=tModel.viewallbookedtickets();
				

					if(!ticketList.isEmpty())
					{
					
						request.setAttribute("ticketlist",ticketList);
						disp=request.getRequestDispatcher("jsp/bookedhistorybyadmin.jsp");
						disp.forward(request, response);
					}

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					out.println(e);
				}
		}
				
		 
		
	  if(requestsource.equals("ticketdetailsbyparam")){
				String searchby=request.getParameter("ticketby");
			
				if(searchby.equalsIgnoreCase("MovieName")){
					
				String movie=request.getParameter("drop");	
				try {
					ArrayList<TicketBean> ticketList=tModel.viewbymoviename(movie);
					System.out.println(ticketList);
						if(ticketList!=null)
					{
					
						request.setAttribute("ticketlist",ticketList);
						disp=request.getRequestDispatcher("jsp/bookedhistorybyadmin.jsp");
						disp.forward(request, response);
					}
						else
						{
							request.setAttribute("ticketlist",ticketList);
							disp=request.getRequestDispatcher("jsp/bookedhistorybyadmin.jsp");
							disp.forward(request, response);
						}

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					out.println(e);
				}
				}
				else if(searchby.equalsIgnoreCase("Screen")){
					
				int screen=Integer.parseInt(request.getParameter("drop"));	
				try {
					ArrayList<TicketBean> ticketList=tModel.viewticketbyscreen(screen);
						if(ticketList!=null)
					{
					
						request.setAttribute("ticketlist",ticketList);
						disp=request.getRequestDispatcher("jsp/bookedhistorybyadmin.jsp");
						disp.forward(request, response);
					}
						else
						{
							request.setAttribute("ticketlist",ticketList);
							disp=request.getRequestDispatcher("jsp/bookedhistorybyadmin.jsp");
							disp.forward(request, response);
						}

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					out.println(e);
				}
				
				}
				else if(searchby.equalsIgnoreCase("Show")){
					
					String show=request.getParameter("drop");	
					try {
						ArrayList<TicketBean> ticketList=tModel.viewticketbyshow(show);
							if(ticketList!=null)
						{
						
							request.setAttribute("ticketlist",ticketList);
							disp=request.getRequestDispatcher("jsp/bookedhistorybyadmin.jsp");
							disp.forward(request, response);
						}
							else
							{
								request.setAttribute("ticketlist",ticketList);
								disp=request.getRequestDispatcher("jsp/bookedhistorybyadmin.jsp");
								disp.forward(request, response);
							}

					} catch (SQLException e) {
						// TODO Auto-generated catch block
						out.println(e);
					}
					
					}
	else if(searchby.equalsIgnoreCase("CustomerId")){
					
					int id=Integer.parseInt(request.getParameter("Id")) ;	
					try {
						ArrayList<TicketBean> ticketList=tModel.viewbycustomerid(id);
							if(ticketList!=null)
						{
						
							request.setAttribute("ticketlist",ticketList);
							disp=request.getRequestDispatcher("jsp/bookedhistorybyadmin.jsp");
							disp.forward(request, response);
						}
							else
							{
								request.setAttribute("ticketlist",ticketList);
								disp=request.getRequestDispatcher("jsp/bookedhistorybyadmin.jsp");
								disp.forward(request, response);
							}

					} catch (SQLException e) {
						// TODO Auto-generated catch block
						out.println(e);
					}
					
					}
	else if(searchby.equalsIgnoreCase("TicketId")){
		
		int id=Integer.parseInt(request.getParameter("Ids")) ;	
		try {
			ArrayList<TicketBean> ticketList=tModel.viewbyticketid(id);
				if(ticketList!=null)
			{
			
				request.setAttribute("ticketlist",ticketList);
				disp=request.getRequestDispatcher("jsp/bookedhistorybyadmin.jsp");
				disp.forward(request, response);
			}
				else
				{
					request.setAttribute("ticketlist",ticketList);
					disp=request.getRequestDispatcher("jsp/bookedhistorybyadmin.jsp");
					disp.forward(request, response);
				}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.println(e);
		}
		
		}
		}
		
		}
				   
		/*	if(id==0 && city==null && location==null){

			try {
				ArrayList<CustomerBean> customerList=cmodel.viewbystatus(status);
				

				if(!customerList.isEmpty())
				{
				
					request.setAttribute("customerlist",customerList);
					disp=request.getRequestDispatcher("jsp/customerdetails.jsp");
					disp.forward(request, response);
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				out.println(e);
			}
				   }
		*/
			
		
	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String requestsource = request.getParameter("source");
		CustomerModel cmodel = new CustomerModel();
		HttpSession session=request.getSession(true);
		RequestDispatcher disp = null;
		if(requestsource.equals("signin")){
			String error=null;
			CustomerBean cBean;
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			LoginBean lb=new LoginBean();
			lb.setEmail(email);
			lb.setPassword(password);
			String role=cmodel.authenticate(lb);
			String status=cmodel.authenticateStatus(lb);
			try {
				cBean = cmodel.viewbyemail(email);
			
			if(role.equals("customer") && status.equals("active") && cBean!=null)
			{
			
				session.setAttribute("emailid",email);
			   session.setAttribute("customername", cBean.getFirstname());
				disp=request.getRequestDispatcher("jsp/userlogin.jsp");
				disp.forward(request, response);
			}
			else 
				if(role.equals("admin"))
				{
					//	out.println("login success");
					session.setAttribute("emailid",email);
					disp=request.getRequestDispatcher("jsp/adminlogin.jsp");
					disp.forward(request, response);
				}
				else if(role.equals("a") || status.equals("deactive") ) 
				{
					error="error";
					request.setAttribute("error", error);
					 response.sendRedirect("jsp/loginFail.jsp");
				     
				}
			}
			 catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
		// TODO Auto-generated method stub
	}

}







