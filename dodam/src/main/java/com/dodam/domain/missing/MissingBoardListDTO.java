package com.dodam.domain.missing;

import java.sql.Timestamp;

public class MissingBoardListDTO {
	private int no;
	private String title;
	private String writer;
	private String img;
	private String location;
	private Timestamp missingdate;
	private String gender;
	private String breed;
	private String age;
	private String name;
	private String missingdateWithoutTime;
	private String dpchknum;
	public MissingBoardListDTO() {
		super();
	}
	public MissingBoardListDTO(int no, String title, String writer, String img, String location, Timestamp missingdate,
			String gender, String breed, String age, String name, String missingdateWithoutTime, String dpchknum) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.img = img;
		this.location = location;
		this.missingdate = missingdate;
		this.gender = gender;
		this.breed = breed;
		this.age = age;
		this.name = name;
		this.missingdateWithoutTime = missingdateWithoutTime;
		this.dpchknum = dpchknum;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public Timestamp getMissingdate() {
		return missingdate;
	}
	public void setMissingdate(Timestamp missingdate) {
		this.missingdate = missingdate;
		this.missingdateWithoutTime = this.missingdate.toString().split(" ")[0];
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBreed() {
		return breed;
	}
	public void setBreed(String breed) {
		this.breed = breed;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMissingdateWithoutTime() {
		return missingdateWithoutTime;
	}
	public void setMissingdateWithoutTime(String missingdateWithoutTime) {
		this.missingdateWithoutTime = missingdateWithoutTime;
	}
	public String getDpchknum() {
		return dpchknum;
	}
	public void setDpchknum(String dpchknum) {
		this.dpchknum = dpchknum;
	}
	@Override
	public String toString() {
		return "MissingBoardListDTO [no=" + no + ", title=" + title + ", writer=" + writer + ", img=" + img
				+ ", location=" + location + ", missingdate=" + missingdate + ", gender=" + gender + ", breed=" + breed
				+ ", age=" + age + ", name=" + name + ", missingdateWithoutTime=" + missingdateWithoutTime
				+ ", dpchknum=" + dpchknum + "]";
	}

}
