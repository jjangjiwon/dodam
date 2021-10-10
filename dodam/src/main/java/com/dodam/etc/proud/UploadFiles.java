package com.dodam.etc.proud;

public class UploadFiles {
	private String originImgFileName;
	private String thumbNailImgFileName;
	private String notImgFileName; // 이미지 파일이 아닌 경우
	
	public String getOriginImgFileName() {
		return originImgFileName;
	}
	public void setOriginImgFileName(String originImgFileName) {
		this.originImgFileName = originImgFileName;
	}
	public String getThumbNailImgFileName() {
		return thumbNailImgFileName;
	}
	public void setThumbNailImgFileName(String thumbNailImgFileName) {
		this.thumbNailImgFileName = thumbNailImgFileName;
	}
	public String getNotImgFileName() {
		return notImgFileName;
	}
	public void setNotImgFileName(String notImgFileName) {
		this.notImgFileName = notImgFileName;
	}
	
	@Override
	public String toString() {
		return "UploadFiles [originImgFileName=" + originImgFileName + ", thumbNailImgFileName=" + thumbNailImgFileName
				+ ", notImgFileName=" + notImgFileName + "]";
	}
	
	
}
