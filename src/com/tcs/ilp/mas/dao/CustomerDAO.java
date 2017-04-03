package com.tcs.ilp.mas.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.tcs.ilp.mas.bean.CustomerBean;
import com.tcs.ilp.mas.bean.LoginBean;

public interface CustomerDAO {
	public boolean addCustomer(CustomerBean cbean)throws SQLException ;
	public String authenticate(LoginBean lb);
	public ArrayList<CustomerBean> viewAllCustomer() throws SQLException;
	public boolean customerProfileUpdate(CustomerBean cbean, String email) throws SQLException;
	public CustomerBean viewbyemail(String email) throws SQLException;
	public boolean deactivateCustomer(String email,String reason) throws SQLException;
	public boolean activateCustomer(String email) throws SQLException;
	public CustomerBean viewbyid(int id) throws SQLException;
	public ArrayList<CustomerBean> viewbylocation(String location) throws SQLException;
	public ArrayList<CustomerBean> viewbycity(String city) throws SQLException;
	public ArrayList<CustomerBean> viewbystatus(String status) throws SQLException;
	public ArrayList<CustomerBean> viewActivatedCustomer() throws SQLException ;
		public ArrayList<CustomerBean> viewDeactivatedCustomer() throws SQLException ;
public boolean updatePassword(String password, String email) throws SQLException;
	
}
