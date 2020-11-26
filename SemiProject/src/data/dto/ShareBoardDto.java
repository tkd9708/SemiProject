package data.dto;

import java.sql.Timestamp;

public class ShareBoardDto {
	   private String num;
	   private String id;
	   private String subject;
	   private String content;
	   private String photo;
	   private Timestamp writeday;
	   private int readcount;
	   private String fsName;
	   private String faAddr;
	   private int star;
	   
	   
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public Timestamp getWriteday() {
		return writeday;
	}
	public void setWriteday(Timestamp writeday) {
		this.writeday = writeday;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getFsName() {
		return fsName;
	}
	public void setFsName(String fsName) {
		this.fsName = fsName;
	}
	public String getFaAddr() {
		return faAddr;
	}
	public void setFaAddr(String faAddr) {
		this.faAddr = faAddr;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	   
	   
 
	   


}
