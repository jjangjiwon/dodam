package com.dodam.domain.event;

import java.sql.Timestamp;

public class EventBoardVO {
	private int no;
	private String title;
	private String admin;
	private String thumbimg;
	private Timestamp registerdate;
	private int readcnt;
	private int likecount;
	private String contents;
	private String img;
	private String area;
	public EventBoardVO() {
		
		super();
		// TODO Auto-generated constructor stub
	}
	public EventBoardVO(int no, String title, String admin, String thumbimg, Timestamp registerdate, int readcnt,
			int likecount, String contents, String img, String area) {
		super();
		this.no = no;
		this.title = title;
		this.admin = admin;
		this.thumbimg = thumbimg;
		this.registerdate = registerdate;
		this.readcnt = readcnt;
		this.likecount = likecount;
		this.contents = contents;
		this.img = img;
		this.area = area;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public String getThumbimg() {
		return thumbimg;
	}
	public void setThumbimg(String thumbimg) {
		this.thumbimg = thumbimg;
	}
	public Timestamp getRegisterdate() {
		return registerdate;
	}
	public void setRegisterdate(Timestamp registerdate) {
		this.registerdate = registerdate;
	}
	public int getreadcnt() {
		return readcnt;
	}
	public void setreadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	public int getLikecount() {
		return likecount;
	}
	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	
	@Override
	public String toString() {
		return "EventBoardVO [no=" + no + ", title=" + title + ", admin=" + admin + ", thumbimg=" + thumbimg
				+ ", registerdate=" + registerdate + ", readcnt=" + readcnt + ", likecount=" + likecount
				+ ", contents=" + contents + ", img=" + img + ", area=" + area + "]";
	}

	
	
}
