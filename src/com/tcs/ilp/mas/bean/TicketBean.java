package com.tcs.ilp.mas.bean;

import java.util.Date;

public class TicketBean {
	private int ticketID;
	private int customerID;
	private Date bookingDate;
	private int screen;
	private String show;
	private int noOfTickets;
	private String classType;
	private String movieName;
	private String allocatedSeats;
	
	
	public int getTicketID() {
		return ticketID;
	}
	public void setTicketID(int ticketID) {
		this.ticketID = ticketID;
	}
	public int getCustomerID() {
		return customerID;
	}
	public void setCustomerID(int customerID) {
		this.customerID = customerID;
	}
	public Date getBookingDate() {
		return bookingDate;
	}
	public void setBookingDate(Date bookingDate) {
		this.bookingDate = bookingDate;
	}
	public int getScreen() {
		return screen;
	}
	public void setScreen(int screen) {
		this.screen = screen;
	}
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	public int getNoOfTickets() {
		return noOfTickets;
	}
	public void setNoOfTickets(int noOfTickets) {
		this.noOfTickets = noOfTickets;
	}
	public String getClassType() {
		return classType;
	}
	public void setClassType(String classType) {
		this.classType = classType;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public String getAllocatedSeats() {
		return allocatedSeats;
	}
	public void setAllocatedSeats(String allocatedSeats) {
		this.allocatedSeats = allocatedSeats;
	}
}
