package com.tcs.ilp.mas.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tcs.ilp.mas.bean.BookingBean;
import com.tcs.ilp.mas.bean.ClassBean;
import com.tcs.ilp.mas.bean.CustomerBean;
import com.tcs.ilp.mas.bean.MovieBean;
import com.tcs.ilp.mas.service.CustomerModel;
import com.tcs.ilp.mas.service.MovieModel;
import com.tcs.ilp.mas.service.TicketModel;



/**
 * Servlet implementation class MovieController
 */
public class MovieController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession(true);
		String requestsource = request.getParameter("source");
		RequestDispatcher disp = null;
		MovieModel mModel = new MovieModel();	
		PrintWriter out = response.getWriter();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	

/*--------------------------------------------------------------------------------------
		      Kartheek code starts
--------------------------------------------------------------------------------------*/
		

		if(requestsource.equals("Add Movie")) // addition of movies code
		{
			Date beginDate=null,endDate=null;
			int flag = 0;
			
			MovieBean mBean = new MovieBean();
			String name = request.getParameter("name");
			String language = request.getParameter("language");
			int duration = Integer.parseInt(request.getParameter("duration"));
			String show = request.getParameter("show");
			String filepath = request.getParameter("movieimage");
			System.out.println(filepath);
			String filepath1 = "G:/"+filepath;
			File img = new File(filepath1);
		   try {
				 beginDate = sdf.parse(request.getParameter("begindate"));				
				 endDate = sdf.parse(request.getParameter("enddate"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			  int screen = Integer.parseInt(request.getParameter("screen"));
			  mBean.setName(name);
			  mBean.setLanguage(language);
			  mBean.setDuration(duration);
			  mBean.setShow(show);
			  mBean.setBeginDate(beginDate);
			  mBean.setEndDate(endDate);
			  mBean.setScreen(screen);
			  mBean.setMovieImage(img);
			  try 
			  {
				 flag = mModel.addMovie(mBean);
				  if(flag != 0)
				  {
					    
					    mBean.setMovieId(flag);  
					    request.setAttribute("mBean", mBean);
						disp = request.getRequestDispatcher("jsp/viewMovieAfterAdding.jsp");
						disp.forward(request, response);
				 }
				 
							  } catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			  
			  catch(FileNotFoundException fnfe)
				{
					MovieBean mb = null;
					 request.setAttribute("mBean1", mb);
						disp = request.getRequestDispatcher("jsp/viewMovieAfterAdding.jsp");
						disp.forward(request, response);
				}
		}
		
		
		/*--------------------------------------------------------------------------------------
	      Kartheek code ends
--------------------------------------------------------------------------------------*/
		
		
		
		
		/*--------------------------------------------------------------------------------------
	      Redirections starts
--------------------------------------------------------------------------------------*/
		else if(requestsource.equals("addmovie"))
		{
		
		
			ArrayList<Integer> sList; 
			try 
			{
				sList = mModel.searchScreen();
				request.setAttribute("sList", sList);
				disp = request.getRequestDispatcher("jsp/addmovie.jsp");
				disp.forward(request, response);
			}
			catch (SQLException e)
			{
				e.printStackTrace();
			}
			
			
			
		}
			
		
		else if(requestsource.equals("delete movie"))
		{
			MovieBean mb= new MovieBean();
			int movieId=Integer.parseInt(request.getParameter("id"));
					
		try {
				mb= mModel.searchMovieById(movieId);
				request.setAttribute("searchedMovie", mb);
				disp=request.getRequestDispatcher("jsp/deletemovie.jsp");
				disp.forward(request, response);
			} catch (SQLException e1) {
				
				e1.printStackTrace();
			}
			
		}
		else if(requestsource.equals("Delete Movie"))
		{
			int movieId = Integer.parseInt(request.getParameter("movieId1"));
			try {
				 MovieBean mBean = new MovieBean();
				 mBean = mModel.deleteMovie(movieId);
				 request.setAttribute("deletedMovieBean", mBean);
				 disp=request.getRequestDispatcher("jsp/deletemoviesuccess.jsp");
				 System.out.println("after disapate");
				 disp.forward(request, response);
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			//response.sendRedirect("jsp/deletemovie.jsp");
		}
			
		else if(requestsource.equals("nowshowingmovie"))
		{
			try {
				ArrayList<MovieBean> nowShowingMovieList = mModel.viewNowShowingMovies();
				if(!nowShowingMovieList.isEmpty())
				{
				request.setAttribute("nowshowing",nowShowingMovieList);
				disp=request.getRequestDispatcher("jsp/nowshowingmovie.jsp");
				disp.forward(request, response);
				}
				}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
			
		
		else if(requestsource.equals("nowshowingmovieadmin"))
		{
			try {
				ArrayList<MovieBean> nowShowingMovieList = mModel.viewNowShowingMovies();
				request.setAttribute("nowshowing",nowShowingMovieList);

				disp=request.getRequestDispatcher("jsp/nowshowingmovieadmin.jsp");
				disp.forward(request, response);
				}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		else if(requestsource.equals("nowshowingmovieuser"))
		{
			try {
				ArrayList<MovieBean> nowShowingMovieList = mModel.viewNowShowingMovies();
				request.setAttribute("nowshowing",nowShowingMovieList);
				disp=request.getRequestDispatcher("jsp/nowshowingmovieuser.jsp");
				disp.forward(request, response);
				}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
				
		else if(requestsource.equals("upcomingmovie"))
		{
			try {
				ArrayList<MovieBean> upComingMovieList = mModel.viewUpComingMovies();
				request.setAttribute("upcoming",upComingMovieList);

				disp=request.getRequestDispatcher("jsp/upcomingmovie.jsp");
				disp.forward(request, response);
				}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		else if(requestsource.equals("upcomingmovieadmin"))
		{
			try {
				ArrayList<MovieBean> upComingMovieList = mModel.viewUpComingMovies();
				request.setAttribute("upcoming",upComingMovieList);
				disp=request.getRequestDispatcher("jsp/upcomingmovieadmin.jsp");
				disp.forward(request, response);
				}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		else if(requestsource.equals("upcomingmovieloggedin"))
		{
			try {
				ArrayList<MovieBean> upComingMovieList = mModel.viewUpComingMovies();
				request.setAttribute("upcoming",upComingMovieList);
				disp=request.getRequestDispatcher("jsp/upcomingmovieloggedin.jsp");
				disp.forward(request, response);
				}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		else if(requestsource.equals("update movie"))
		{
			MovieBean mb=new MovieBean();
			int movieId=Integer.parseInt(request.getParameter("id"));
			try {
				mb = mModel.searchMovieById(movieId);
				ArrayList<String> lList = new ArrayList<String>();
				ArrayList<Integer>sList = new ArrayList<Integer>();
				sList = mModel.searchScreen();
				lList = mModel.searchLanguage();
				
				for(int i=0;i<lList.size();i++)
				{
					if(lList.get(i).equalsIgnoreCase(mb.getLanguage()))
					{
						lList.remove(i);
					}
				}
				request.setAttribute("screenList", sList);
				request.setAttribute("languageList", lList);
				request.setAttribute("mBeanUpdate", mb);
				disp=request.getRequestDispatcher("jsp/updatemovie.jsp");
				disp.forward(request, response);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
				
			//	response.sendRedirect("jsp/updatemovie.jsp");
		}
		
		else if(requestsource.equals("Update Movie"))
		{
			MovieBean mBean = new MovieBean();
			MovieBean mb = null;
			MovieBean mbOld = new MovieBean();
		
			int id = Integer.parseInt(request.getParameter("id"));
		    try {
				mbOld=mModel.searchMovieById(id);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			mBean.setMovieId(id);
			mBean.setName(request.getParameter("name"));
			mBean.setScreen(Integer.parseInt(request.getParameter("screen")));
			 try {
				 mBean.setBeginDate(sdf.parse(request.getParameter("begindate")));				
				 mBean.setEndDate(sdf.parse(request.getParameter("enddate")));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 mBean.setDuration(Integer.parseInt(request.getParameter("duration")));
			 mBean.setLanguage(request.getParameter("language"));
			 mBean.setShow(request.getParameter("show"));
			 String filepath = request.getParameter("movieimage");
			 System.out.println(filepath);
			 if(filepath != null)
			 {
				 String filepath1 = "G:/"+filepath;
					File img = new File(filepath1);
					  mBean.setMovieImage(img);
					  try {
						  System.out.println("dfdfh");
						mb= mModel.updateMovie(mBean,filepath);
					
					}
					  catch(FileNotFoundException fnfe)
						{
							MovieBean mBean1 = null;
							request.setAttribute("mBean1",mBean1);
							 request.setAttribute("updatedMovie", mbOld);
							 disp = request.getRequestDispatcher("jsp/updatefailurefilenotfound.jsp");
								disp.forward(request, response);}
					  catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
						 if(mb !=null)
						{
								System.out.println("file sent");
								System.out.println(mb.getDuration()+""+mb.getLanguage());
							 request.setAttribute("updatedMovie", mb);
							disp=request.getRequestDispatcher("jsp/updatemoviesuccess.jsp");
							disp.forward(request, response);
						}
			 }
			 else
			 {
			 try {
				
				 mb= mModel.updateMovie(mBean,filepath);
				 if(mb !=null)
				{
					 if(mbOld.getBeginDate() .equals(mb.getBeginDate()) && mbOld.getLanguage() .equals(mb.getLanguage()) && mbOld.getDuration()==mb.getDuration() && mbOld.getShow() .equals(mb.getShow()) && mbOld.getScreen()==(mb.getScreen()) && mbOld.getEndDate() .equals(mb.getEndDate()))
						{
							request.setAttribute("updatedMovie", mb);
							disp=request.getRequestDispatcher("jsp/movienotupdated.jsp");
							disp.forward(request, response);
						}
					 else
					 {
					 request.setAttribute("updatedMovie", mb);
					disp=request.getRequestDispatcher("jsp/updatemoviesuccess.jsp");
					disp.forward(request, response);
					 }
				}
			 
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 catch(FileNotFoundException fnfe)
				{
					MovieBean mBean1 = null;
					request.setAttribute("mBean1",mBean1);
					 request.setAttribute("updatedMovie", mb);
					 disp = request.getRequestDispatcher("jsp/updatefailurefilenotfound.jsp");
						disp.forward(request, response);
				}
			 }
			
		}
		
		
				
		else if(requestsource.equals("viewmoviesadmin"))
		{
			try {
				ArrayList<MovieBean> movieList = mModel.viewAllMovies();
				request.setAttribute("allmovies",movieList);
				disp=request.getRequestDispatcher("jsp/viewmoviesadmin.jsp");
				disp.forward(request, response);
				}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		else if(requestsource.equals("viewmoviesuser"))
		{
			try {
				ArrayList<MovieBean> movieList = mModel.viewAllMovies();
				request.setAttribute("allmovies",movieList);
				disp=request.getRequestDispatcher("jsp/viewmoviesuser.jsp");
				disp.forward(request, response);
				}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		else if(requestsource.equals("viewmoviesloggedin"))
		{
			try {
				ArrayList<MovieBean> movieList = mModel.viewAllMovies();
				request.setAttribute("allmovies",movieList);
				disp=request.getRequestDispatcher("jsp/viewmoviesloggedin.jsp");
				disp.forward(request, response);
				}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}	
		
		else if(requestsource .equals("viewmoviebyidadmin"))
			{
				int movieId=Integer.parseInt(request.getParameter("id"));
				try {
					MovieBean mb=mModel.searchMovieById(movieId);
					request.setAttribute("moviebyid",mb);
					disp=request.getRequestDispatcher("jsp/viewmoviebyidadmin.jsp");
					disp.include(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			else if(requestsource .equals("viewmoviebyiduser"))
			{
				int movieId=Integer.parseInt(request.getParameter("id"));
				try {
					MovieBean mb=mModel.searchMovieById(movieId);
					request.setAttribute("moviebyid",mb);
					disp=request.getRequestDispatcher("jsp/viewmoviebyiduser.jsp");
					disp.forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		
			else if(requestsource .equals("viewmoviebyidloggedin"))
			{
				int movieId=Integer.parseInt(request.getParameter("id"));
				try {
					MovieBean mb=mModel.searchMovieById(movieId);
					request.setAttribute("moviebyid",mb);
					disp=request.getRequestDispatcher("jsp/viewmoviebyidloggedin.jsp");
					disp.forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		
			/*--------------------------------------------------------------------------------------
	     redirection ends
--------------------------------------------------------------------------------------*/
			/*--------------------------------------------------------------------------------------
		     redirection ends
	--------------------------------------------------------------------------------------*/

				
		if(requestsource.equals("logout"))
		{
			session.invalidate();
			response.sendRedirect("jsp/userlogin.jsp");
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
