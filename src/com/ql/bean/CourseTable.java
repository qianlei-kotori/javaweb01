package com.ql.bean;

import java.io.Serializable;

public class CourseTable implements Serializable{
	private static final long serialVersionUID = 1L;
	private String cname;
	private String croom;
	private String tname;
	private String ctime;
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCroom() {
		return croom;
	}
	public void setCroom(String croom) {
		this.croom = croom;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getCtime() {
		return ctime;
	}
	public void setCtime(String ctime) {
		this.ctime = ctime;
	}
	public CourseTable(String cname, String croom, String tname, String ctime) {
		super();
		this.cname = cname;
		this.croom = croom;
		this.tname = tname;
		this.ctime = ctime;
	}
	public CourseTable() {
		super();
	}
	
}
