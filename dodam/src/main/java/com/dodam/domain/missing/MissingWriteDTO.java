package com.dodam.domain.missing;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class MissingWriteDTO {
	private int no;
	private String title;
	private String writer;
	private String password;
	private String animal;
	private String breed;
	private char gender;
	private String name;
	private String age;
	private String location;
	private String dlocation;
	private String missingdate;
	private String contact;
	private String contents;
	private List<String> img;
	private List<String> thumbimg;
	public MissingWriteDTO() {
		super();
	}
	public MissingWriteDTO(String title, String writer, String password, String animal, String breed, char gender,
			String name, String age, String location, String dlocation, String missingdate, String contact,
			String contents, List<String> img, List<String> thumbimg) {
		super();
		this.title = title;
		this.writer = writer;
		this.password = password;
		this.animal = animal;
		this.breed = breed;
		this.gender = gender;
		this.name = name;
		this.age = age;
		this.location = location;
		this.dlocation = dlocation;
		this.missingdate = missingdate;
		this.contact = contact;
		this.contents = contents;
		this.img = img;
		this.thumbimg = thumbimg;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAnimal() {
		return animal;
	}
	public void setAnimal(String animal) {
		this.animal = animal;
	}
	public String getBreed() {
		return breed;
	}
	public void setBreed(String breed) {
		this.breed = breed;
	}
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		this.gender = gender;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getDlocation() {
		return dlocation;
	}
	public void setDlocation(String dlocation) {
		this.dlocation = dlocation;
	}
	public Timestamp getMissingdate() throws ParseException {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date date = df.parse(missingdate);
		long number = date.getTime();
		return new Timestamp(number);
	}
	public void setMissingdate(String missingdate) {
		this.missingdate = missingdate;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getImg() {
		String resultImg = "";
		if (img.size() != 0) {
			for(String s : this.img) {
				resultImg += s + ", ";
			}
		}
		
		return resultImg;
	}
	public void setImage(List<String> img) {
		this.img = img;
	}
	public String getThumbimg() {
		String resultImg = "";
		if (thumbimg.size() != 0) {
			for(String s : this.thumbimg) {
				resultImg += s + ", ";
			}
		}
		
		return resultImg;
	}
	public void setThumbimage(List<String> thumbimg) {
		this.thumbimg = thumbimg;
	}
	@Override
	public String toString() {
		return "MissingWriteDTO [no=" + no + ", title=" + title + ", writer=" + writer + ", password=" + password + ", animal="
				+ animal + ", breed=" + breed + ", gender=" + gender + ", name=" + name + ", age=" + age + ", location="
				+ location + ", dlocation=" + dlocation + ", missingdate=" + missingdate + ", contact=" + contact
				+ ", contents=" + contents + ", image=" + this.getImg() + ", thumbimage=" + this.getThumbimg() + "]";
	}
}