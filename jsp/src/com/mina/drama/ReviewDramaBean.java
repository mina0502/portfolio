package com.mina.drama;

import java.sql.Date;

public class ReviewDramaBean {
	
	private int num;
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	private String id;
	private String targetid;
	private String title;
	private String content;
	private String follow;
	private Date date;
	private int view;
	private int repl;
	private float starinput;
	private int re_ref;
	private int re_lev;
	private int re_seq;


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTargetid() {
		return targetid;
	}

	public void setTargetid(String targetid) {
		this.targetid = targetid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFollow() {
		return follow;
	}

	public void setFollow(String follow) {
		this.follow = follow;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getView() {
		return view;
	}

	public void setView(int view) {
		this.view = view;
	}

	public int getRepl() {
		return repl;
	}

	public void setRepl(int repl) {
		this.repl = repl;
	}

	public float getStarinput() {
		return starinput;
	}

	public void setStarinput(float starinput) {
		this.starinput = starinput;
	}

	public int getRe_ref() {
		return re_ref;
	}

	public void setRe_ref(int re_ref) {
		this.re_ref = re_ref;
	}

	public int getRe_lev() {
		return re_lev;
	}

	public void setRe_lev(int re_lev) {
		this.re_lev = re_lev;
	}

	public int getRe_seq() {
		return re_seq;
	}

	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}
}
