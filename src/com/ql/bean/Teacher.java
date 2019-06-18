package com.ql.bean;

import java.io.Serializable;

public class Teacher implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer tid;
	private String tpwd;
	private String tname;
	private String tsex;
	private Integer tage;
	private String ttitle;
	private String tcollege;
	public Teacher() {
		super();
	}
	public Teacher(Integer tid, String tpwd, String tname, String tsex, Integer tage, String ttitle, String tcollege) {
		super();
		this.tid = tid;
		this.tpwd = tpwd;
		this.tname = tname;
		this.tsex = tsex;
		this.tage = tage;
		this.ttitle = ttitle;
		this.tcollege = tcollege;
	}
	public Integer getTid() {
		return tid;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
	}
	public String getTpwd() {
		return tpwd;
	}
	public void setTpwd(String tpwd) {
		this.tpwd = tpwd;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getTsex() {
		return tsex;
	}
	public void setTsex(String tsex) {
		this.tsex = tsex;
	}
	public Integer getTage() {
		return tage;
	}
	public void setTage(Integer tage) {
		this.tage = tage;
	}
	public String getTtitle() {
		return ttitle;
	}
	public void setTtitle(String ttitle) {
		this.ttitle = ttitle;
	}
	public String getTcollege() {
		return tcollege;
	}
	public void setTcollege(String tcollege) {
		this.tcollege = tcollege;
	}
}
