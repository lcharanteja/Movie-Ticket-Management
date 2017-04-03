package com.tcs.ilp.mas.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.tcs.ilp.mas.dao.CustomerImpl;
import com.tcs.ilp.mas.bean.CustomerBean;
import com.tcs.ilp.mas.bean.LoginBean;

public class CustomerModel {
	CustomerImpl cimpl=new CustomerImpl();
	public boolean addCustomer(CustomerBean cbean)throws SQLException {
		return cimpl.addCustomer(cbean);
	}
	public String authenticate(LoginBean lb){
	return cimpl.authenticate(lb);
	}
	public ArrayList<CustomerBean> viewAllCustomer() throws SQLException{
		return cimpl.viewAllCustomer();	
	}
	
	public boolean updatePassword(String password, String email) throws SQLException{
		
	return cimpl.updatePassword(password, email);
	}
	
	public boolean customerProfileUpdate(CustomerBean cbean, String email) throws SQLException{
		return cimpl.customerProfileUpdate(cbean, email);
	}
	
	public CustomerBean viewbyemail(String email) throws SQLException
	{
		return cimpl.viewbyemail(email);
	}
	public String authenticateStatus(LoginBean lb){
		return cimpl.authenticateStatus(lb);
	}
	public boolean deactivateCustomer(String email,String reason) throws SQLException{
		return cimpl.deactivateCustomer(email,reason);
	}
	public boolean activateCustomer(String email) throws SQLException{
		return cimpl.activateCustomer(email);
	}
	public ArrayList<CustomerBean> viewbylocation(String location) throws SQLException
	{
		return cimpl.viewbylocation(location);
	}
		public ArrayList<CustomerBean> viewbycity(String city) throws SQLException
	{
		return cimpl.viewbycity(city);
	}
	public ArrayList<CustomerBean> viewbystatus(String status) throws SQLException
	{
		return cimpl.viewbystatus(status);
	}
	public CustomerBean viewbyid(int id) throws SQLException
	{
		return cimpl.viewbyid(id);
	}
	public ArrayList<CustomerBean> viewActivatedCustomer() throws SQLException
	{
		return cimpl.viewActivatedCustomer();
	}
	public ArrayList<CustomerBean> viewDeactivatedCustomer() throws SQLException
	{
		return cimpl.viewDeactivatedCustomer();
	}

}
