package com.tcs.ilp.mas.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.tcs.ilp.mas.bean.CustomerBean;
import com.tcs.ilp.mas.bean.LoginBean;
import com.tcs.ilp.mas.util.DatabaseUtil;

public class CustomerImpl implements CustomerDAO {
		Connection con=null;
		PreparedStatement ps1=null;
		PreparedStatement ps2=null;
		
		
		public boolean addCustomer(CustomerBean cbean) throws SQLException {
			
		int roweffected1=0;
		int roweffected2=0;
				con=DatabaseUtil.getConnection();
		try {
			java.sql.Date sqldate=new Date(cbean.getDob().getTime());
			ps1=con.prepareStatement("insert into CUSTOMER_TEAM5 values(?,?,?,?,?,?,?,?,?,'customer',customerid_seq.nextval,?,'active')");

			ps1.setString(1, cbean.getFirstname());
			ps1.setString(2, cbean.getLastname());
			ps1.setString(3, cbean.getGender());
			ps1.setDate(4, sqldate);
			ps1.setLong(5, cbean.getPhoneno());
			ps1.setString(6, cbean.getCity());
			ps1.setString(7, cbean.getLocation());
			ps1.setString(8, cbean.getEmail());
			ps1.setString(9, cbean.getPassword());
			
			ps1.setString(10, cbean.getDeactivationreason());
			
			
			ps2=con.prepareStatement("insert into login_team5 (username,password,role) values(?,?,'customer')");
			ps2.setString(1, cbean.getEmail());
			ps2.setString(2, cbean.getPassword());
			
			
			roweffected1=ps1.executeUpdate();
			roweffected2=ps2.executeUpdate();
		if(roweffected1>0 && roweffected2>0){
				return Boolean.TRUE;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DatabaseUtil.closeStatement(ps1);
			DatabaseUtil.closeStatement(ps2);
			DatabaseUtil.closeConnection(con);
		}

				return false;
			}

		public String authenticate(LoginBean lb){
			String r="a";
			PreparedStatement ps=null;
			try{
				con=DatabaseUtil.getConnection();
				
				ps=con.prepareStatement("select * from login_team5 where username=? and password=?");
				ps.setString(1, lb.getEmail());
				ps.setString(2, lb.getPassword());
				ResultSet result=ps.executeQuery();
				if(result.next()){
							r=result.getString(3);
					System.out.println(r);
					return r;
				}
			}catch (Exception e) {
				// TODO: handle exception
			}finally{
				DatabaseUtil.closeStatement(ps);
				DatabaseUtil.closeConnection(con);
			}return r;
		}
		
		
		public String authenticateStatus(LoginBean lb){
			String r="a";
			PreparedStatement ps=null;
			try{
				con=DatabaseUtil.getConnection();
				
				ps=con.prepareStatement("select status from customer_team5 where email=? and password=?");
				ps.setString(1, lb.getEmail());
				ps.setString(2, lb.getPassword());
				ResultSet result=ps.executeQuery();
				
				if(result.next()){
					System.out.println("i m here"+result.getString(1));
					return result.getString(1);
			}
			}
				catch (Exception e) {
				// TODO: handle exception
			}finally{
				DatabaseUtil.closeStatement(ps);
				DatabaseUtil.closeConnection(con);
			}return r;
		}

		public ArrayList<CustomerBean> viewAllCustomer() throws SQLException{

			ArrayList<CustomerBean> customerList=new ArrayList<CustomerBean>();
			CustomerBean cBean=null;
			con=DatabaseUtil.getConnection();
			ps1=con.prepareStatement("select * from customer_team5");
			ResultSet result=ps1.executeQuery();
			
			while(result.next())
			{
				cBean=new CustomerBean();
				cBean.setFirstname(result.getString(1));
				cBean.setLastname(result.getString(2));
				cBean.setGender(result.getString(3));
				cBean.setDob(result.getDate(4));
				cBean.setPhoneno(result.getLong(5));
				cBean.setCity(result.getString(6));
				cBean.setLocation(result.getString(7));
				cBean.setEmail(result.getString(8));
				cBean.setPassword(result.getString(9));
				cBean.setRole(result.getString(10));
				cBean.setCustomerid(result.getInt(11));
				cBean.setStatus(result.getString(13));
			
				
				customerList.add(cBean);
				
			}
			
			DatabaseUtil.closeStatement(ps1);
			DatabaseUtil.closeConnection(con);
			return customerList;
			
		}
	
		public boolean customerProfileUpdate(CustomerBean cbean, String email) throws SQLException{
			PreparedStatement ps=null;
			
			int rowsAffected=0;
		
			try
			{
			java.sql.Date sqldate=new Date(cbean.getDob().getTime());
			con=DatabaseUtil.getConnection();
			ps=con.prepareStatement("update customer_team5 set fname=?,lname=?,dob=?,phoneno=?,city=?,location=? where email=?");
			
			ps.setString(1, cbean.getFirstname());
			ps.setString(2, cbean.getLastname());
			//ps.setString(3, cbean.getGender());
			ps.setDate(3, sqldate);
			ps.setLong(4, cbean.getPhoneno());
			ps.setString(5, cbean.getCity());
			ps.setString(6, cbean.getLocation());
			ps.setString(7, email);
			
			rowsAffected=ps.executeUpdate();
			
			if(rowsAffected>0)
			{
				return true;
			}
			}
			catch (Exception e) {
				// TODO: handle exception
			}
     finally{
			DatabaseUtil.closeStatement(ps);
			DatabaseUtil.closeConnection(con);
     }
			return false;
		
		}
		
		
		public boolean updatePassword(String password, String email) throws SQLException{
			PreparedStatement ps=null;
			PreparedStatement ps2=null;
			int rowsAffected=0;
			int rowsAffected1=0;
			try
			{
			con=DatabaseUtil.getConnection();
			ps=con.prepareStatement("update customer_team5 set password=? where email=?");
			
			ps.setString(1, password);
			ps.setString(2, email);
			
			ps2=con.prepareStatement("update login_team5 set password=? where username=?");
			ps2.setString(1, password);
			ps2.setString(2, email);
			
			rowsAffected=ps.executeUpdate();
			rowsAffected1=ps2.executeUpdate();
			
			if(rowsAffected>0 && rowsAffected1>0)
			{
				return true;
			}
			}
			catch (Exception e) {
				// TODO: handle exception
			}
     finally{
    	 DatabaseUtil.closeStatement(ps2);
			DatabaseUtil.closeStatement(ps);
			DatabaseUtil.closeConnection(con);
     }
			return false;
		
		}
		
		public CustomerBean viewbyemail(String email) throws SQLException {
			
				CustomerBean cBean=null;
				PreparedStatement ps=null;
				con=DatabaseUtil.getConnection();
				ps=con.prepareStatement("select * from customer_team5 where email=?");
				ps.setString(1, email);
			
				ResultSet result=ps.executeQuery();
				if(result.next())
				{
					cBean=new CustomerBean();
					cBean.setFirstname(result.getString(1));
					cBean.setLastname(result.getString(2));
					cBean.setGender(result.getString(3));
					cBean.setDob(result.getDate(4));
					cBean.setPhoneno(result.getLong(5));
					cBean.setCity(result.getString(6));
					cBean.setLocation(result.getString(7));
					cBean.setEmail(result.getString(8));
					cBean.setPassword(result.getString(9));
					cBean.setCustomerid(result.getInt(11));
					cBean.setStatus(result.getString(13));
				
				}
				DatabaseUtil.closeStatement(ps);
				DatabaseUtil.closeConnection(con);
				
				return cBean;
		}
		public boolean deactivateCustomer(String emailid,String reason) throws SQLException{
			Connection con1=null;
			PreparedStatement ps=null;
			int rowsAffected=0;
			String status="deactive";
			try
			{
			
			con1=DatabaseUtil.getConnection();
			ps=con1.prepareStatement("update customer_team5 set status=?,deactivationreason=? where email=?");
			ps.setString(1, status );
			ps.setString(2, reason);
			ps.setString(3, emailid);
				rowsAffected=ps.executeUpdate();
			if(rowsAffected>0)
			{
				DatabaseUtil.closeStatement(ps);
				DatabaseUtil.closeConnection(con);
				return true;
			}
			}
			catch (Exception e) {
				// TODO: handle exception
			}
     finally{
			DatabaseUtil.closeStatement(ps);
			DatabaseUtil.closeConnection(con);
     }
			return false;
		
		}
		
		public boolean activateCustomer(String emailid) throws SQLException{
			PreparedStatement ps=null;
			int rowsAffected=0;
			String status="active";
			try
			{
			
			con=DatabaseUtil.getConnection();
			ps=con.prepareStatement("update customer_team5 set status=? where email=?");
			ps.setString(1, status );
			ps.setString(2, emailid);
				rowsAffected=ps.executeUpdate();
			if(rowsAffected>0)
			{
				DatabaseUtil.closeStatement(ps);
				DatabaseUtil.closeConnection(con);
				return true;
			}
			}
			catch (Exception e) {
				// TODO: handle exception
			}
     finally{
			DatabaseUtil.closeStatement(ps);
			DatabaseUtil.closeConnection(con);
     }
			return false;
		
		}
		public CustomerBean viewbyid(int id) throws SQLException {
			
			CustomerBean cBean=null;
			PreparedStatement ps=null;
			con=DatabaseUtil.getConnection();
			ps=con.prepareStatement("select * from customer_team5 where customerid=?");
			ps.setInt(1, id);
		
			ResultSet result=ps.executeQuery();
			if(result.next())
			{
				cBean=new CustomerBean();
				cBean.setFirstname(result.getString(1));
				cBean.setLastname(result.getString(2));
				cBean.setGender(result.getString(3));
				cBean.setDob(result.getDate(4));
				cBean.setPhoneno(result.getLong(5));
				cBean.setCity(result.getString(6));
				cBean.setLocation(result.getString(7));
				cBean.setEmail(result.getString(8));
				cBean.setPassword(result.getString(9));
				cBean.setCustomerid(result.getInt(11));
				cBean.setStatus(result.getString(13));
			
			}
			DatabaseUtil.closeStatement(ps);
			DatabaseUtil.closeConnection(con);
			
			return cBean;
	}
public ArrayList<CustomerBean> viewbylocation(String location) throws SQLException {
			
			CustomerBean cBean=null;
			PreparedStatement ps=null;
			ArrayList<CustomerBean> customerList=new ArrayList<CustomerBean>();
			con=DatabaseUtil.getConnection();
			ps=con.prepareStatement("select * from customer_team5 where location=?");
			ps.setString(1, location);
		
			ResultSet result=ps.executeQuery();
			while(result.next())
			{
				cBean=new CustomerBean();
				cBean.setFirstname(result.getString(1));
				cBean.setLastname(result.getString(2));
				cBean.setGender(result.getString(3));
				cBean.setDob(result.getDate(4));
				cBean.setPhoneno(result.getLong(5));
				cBean.setCity(result.getString(6));
				cBean.setLocation(result.getString(7));
				cBean.setEmail(result.getString(8));
				cBean.setPassword(result.getString(9));
				cBean.setCustomerid(result.getInt(11));
				cBean.setStatus(result.getString(13));
				customerList.add(cBean);
			}
			DatabaseUtil.closeStatement(ps);
			DatabaseUtil.closeConnection(con);
			
			return customerList;
	}
public ArrayList<CustomerBean> viewbycity(String city) throws SQLException {
	
	CustomerBean cBean=null;
	PreparedStatement ps=null;
	ArrayList<CustomerBean> customerList=new ArrayList<CustomerBean>();
	con=DatabaseUtil.getConnection();
	ps=con.prepareStatement("select * from customer_team5 where city=?");
	ps.setString(1, city);

	ResultSet result=ps.executeQuery();
	while(result.next())
	{
		cBean=new CustomerBean();
		cBean.setFirstname(result.getString(1));
		cBean.setLastname(result.getString(2));
		cBean.setGender(result.getString(3));
		cBean.setDob(result.getDate(4));
		cBean.setPhoneno(result.getLong(5));
		cBean.setCity(result.getString(6));
		cBean.setLocation(result.getString(7));
		cBean.setEmail(result.getString(8));
		cBean.setPassword(result.getString(9));
		cBean.setCustomerid(result.getInt(11));
		cBean.setStatus(result.getString(13));
		customerList.add(cBean);
	}
	DatabaseUtil.closeStatement(ps);
	DatabaseUtil.closeConnection(con);
	
	return customerList;
}
public ArrayList<CustomerBean> viewbystatus(String status) throws SQLException {
	
	CustomerBean cBean=null;
	PreparedStatement ps=null;
	ArrayList<CustomerBean> customerList=new ArrayList<CustomerBean>();
	con=DatabaseUtil.getConnection();
	ps=con.prepareStatement("select * from customer_team5 where status=?");
	ps.setString(1, status);

	ResultSet result=ps.executeQuery();
	while(result.next())
	{
		cBean=new CustomerBean();
		cBean.setFirstname(result.getString(1));
		cBean.setLastname(result.getString(2));
		cBean.setGender(result.getString(3));
		cBean.setDob(result.getDate(4));
		cBean.setPhoneno(result.getLong(5));
		cBean.setCity(result.getString(6));
		cBean.setLocation(result.getString(7));
		cBean.setEmail(result.getString(8));
		cBean.setPassword(result.getString(9));
		cBean.setCustomerid(result.getInt(11));
		cBean.setStatus(result.getString(13));
		customerList.add(cBean);
	}
	DatabaseUtil.closeStatement(ps);
	DatabaseUtil.closeConnection(con);
	
	return customerList;
}
public ArrayList<CustomerBean> viewActivatedCustomer() throws SQLException {
	String status="active";
	CustomerBean cBean=null;
	PreparedStatement ps=null;
	ArrayList<CustomerBean> customerList=new ArrayList<CustomerBean>();
	con=DatabaseUtil.getConnection();
	ps=con.prepareStatement("select * from customer_team5 where status=?");
	ps.setString(1, status);

	ResultSet result=ps.executeQuery();
	while(result.next())
	{
		cBean=new CustomerBean();
		cBean.setFirstname(result.getString(1));
		cBean.setLastname(result.getString(2));
		cBean.setGender(result.getString(3));
		cBean.setDob(result.getDate(4));
		cBean.setPhoneno(result.getLong(5));
		cBean.setCity(result.getString(6));
		cBean.setLocation(result.getString(7));
		cBean.setEmail(result.getString(8));
		cBean.setPassword(result.getString(9));
		cBean.setCustomerid(result.getInt(11));
		cBean.setStatus(result.getString(13));
		customerList.add(cBean);
	}
	DatabaseUtil.closeStatement(ps);
	DatabaseUtil.closeConnection(con);
	
	return customerList;
}
public ArrayList<CustomerBean> viewDeactivatedCustomer() throws SQLException {
	String status="deactive";
	CustomerBean cBean=null;
	PreparedStatement ps=null;
	ArrayList<CustomerBean> customerList=new ArrayList<CustomerBean>();
	con=DatabaseUtil.getConnection();
	ps=con.prepareStatement("select * from customer_team5 where status=?");
	ps.setString(1, status);

	ResultSet result=ps.executeQuery();
	while(result.next())
	{
		cBean=new CustomerBean();
		cBean.setFirstname(result.getString(1));
		cBean.setLastname(result.getString(2));
		cBean.setGender(result.getString(3));
		cBean.setDob(result.getDate(4));
		cBean.setPhoneno(result.getLong(5));
		cBean.setCity(result.getString(6));
		cBean.setLocation(result.getString(7));
		cBean.setEmail(result.getString(8));
		cBean.setPassword(result.getString(9));
		cBean.setCustomerid(result.getInt(11));
		cBean.setStatus(result.getString(13));
		customerList.add(cBean);
	}
	DatabaseUtil.closeStatement(ps);
	DatabaseUtil.closeConnection(con);
	
	return customerList;
}

}
