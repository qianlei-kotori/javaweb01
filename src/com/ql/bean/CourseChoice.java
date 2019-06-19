package com.ql.bean;

import java.io.Serializable;

public class CourseChoice implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer cid;
	private String cname;
	private String croom;
	private Integer ccount;
	private Integer cum;
	private String tname;
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
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
	public Integer getCcount() {
		return ccount;
	}
	public void setCcount(Integer ccount) {
		this.ccount = ccount;
	}
	public Integer getCum() {
		return cum;
	}
	public void setCum(Integer cum) {
		this.cum = cum;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public CourseChoice(Integer cid, String cname, String croom, Integer ccount, Integer cum, String tname) {
		super();
		this.cid = cid;
		this.cname = cname;
		this.croom = croom;
		this.ccount = ccount;
		this.cum = cum;
		this.tname = tname;
	}
	public CourseChoice() {
		super();
	}
	
	
}
