package com.codebay.goldeneye.beans;

public class EmailBean {
	
	public final String EMAIL_PATTERN = "%s%s.%s@%s.goldeneye.com";

	private String nameInitial;
	private String surname;
	private String officeLocation;
	private String deparment;

	public EmailBean() {
	}

	public EmailBean(String nameInitial, String surname, String officeLocation, String deparment) {
		this.nameInitial = nameInitial;
		this.surname = surname;
		this.officeLocation = officeLocation;
		this.deparment = deparment;
	}

	public String getNameInitial() {
		return nameInitial;
	}

	public void setNameInitial(String nameInitial) {
		this.nameInitial = nameInitial;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getOfficeLocation() {
		return officeLocation;
	}

	public void setOfficeLocation(String officeLocation) {
		this.officeLocation = officeLocation;
	}

	public String getDeparment() {
		return deparment;
	}

	public void setDeparment(String deparment) {
		this.deparment = deparment;
	}
	
	@Override
	public String toString() {
		return String.format(EMAIL_PATTERN, nameInitial, surname, deparment, officeLocation).toLowerCase();
	}

}
