package com.ql.bean;

import java.io.Serializable;

public class Student implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer sid;
	private String spwd;
	private String sname;
	private String ssex;
	private String sroom;
	private String scollege;
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	public String getSpwd() {
		return spwd;
	}
	public void setSpwd(String spwd) {
		this.spwd = spwd;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSsex() {
		return ssex;
	}
	public void setSsex(String ssex) {
		this.ssex = ssex;
	}
	public String getSroom() {
		return sroom;
	}
	public void setSroom(String sroom) {
		this.sroom = sroom;
	}
	public String getScollege() {
		return scollege;
	}
	public void setScollege(String scollege) {
		this.scollege = scollege;
	}
	public Student(Integer sid, String spwd, String sname, String ssex, String sroom, String scollege) {
		super();
		this.sid = sid;
		this.spwd = spwd;
		this.sname = sname;
		this.ssex = ssex;
		this.sroom = sroom;
		this.scollege = scollege;
	}
	public Student() {
		super();
	}
	
}
