package com.tcs.ilp.mas.bean;

import java.util.Date;


public class CustomerBean {
private String	firstname;	
private String	lastname;
private String gender;
private Date dob;
private long phoneno;
private String city;
private String location;
private String email;
private String password;
private String role;
private int customerid;
private String deactivationreason;	
private String status;
private String fullname;


public String getFullname() {
	fullname=firstname+ " " + lastname;
	return fullname;
}
public void setFullname(String fullname) {
	this.fullname = firstname+ " " + lastname;
}
public String getFirstname() {
	return firstname;
}
public void setFirstname(String firstname) {
	this.firstname = firstname;
}
public String getLastname() {
	return lastname;
}
public void setLastname(String lastname) {
	this.lastname = lastname;
}
public String getGender() {
	return gender;
}
public void setGender(String gender) {
	this.gender = gender;
}
public Date getDob() {
	return dob;
}
public void setDob(Date dob) {
	this.dob = dob;
}
public long getPhoneno() {
	return phoneno;
}
public void setPhoneno(long phoneno) {
	this.phoneno = phoneno;
}
public String getCity() {
	return city;
}
public void setCity(String city) {
	this.city = city;
}
public String getLocation() {
	return location;
}
public void setLocation(String location) {
	this.location = location;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}

public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getRole() {
	return role;
}
public void setRole(String role) {
	this.role = role;
}
public int getCustomerid() {
	return customerid;
}
public void setCustomerid(int customerid) {
	this.customerid = customerid;
}
public String getDeactivationreason() {
	return deactivationreason;
}
public void setDeactivationreason(String deactivationreason) {
	this.deactivationreason = deactivationreason;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}	

}
