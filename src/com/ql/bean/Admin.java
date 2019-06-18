package com.ql.bean;

import java.io.Serializable;

public class Admin implements Serializable{
	private static final long serialVersionUID = 1L;
	private int acount;
	private String apwd;
	public Admin() {
		super();
	}
	public Admin(int acount, String apwd) {
		super();
		this.acount = acount;
		this.apwd = apwd;
	}
	public int getAcount() {
		return acount;
	}
	public void setAcount(int acount) {
		this.acount = acount;
	}
	public String getApwd() {
		return apwd;
	}
	public void setApwd(String apwd) {
		this.apwd = apwd;
	}
}
