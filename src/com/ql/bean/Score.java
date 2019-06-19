package com.ql.bean;

import java.io.Serializable;

public class Score implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer cid;
	private String cname;
	private Integer score;
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
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	public Score(Integer cid, String cname, Integer score) {
		super();
		this.cid = cid;
		this.cname = cname;
		this.score = score;
	}
	public Score() {
		super();
	}
	
	
}
