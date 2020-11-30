package data.dto;

import java.sql.Date;

public class WishlistDto {
	private String num;
	private String mem_id;
	private String spot_id;
	private String share_num;
	private String content;
	private String wishday;
	private String title;
	private String roadaddr;
	private String thumbmail;
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getMem_id() {
		return  mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id =  mem_id;
	}
	public String getSpot_id() {
		return spot_id;
	}
	public void setSpot_id(String spot_id) {
		this.spot_id = spot_id;
	}
	public String getShare_num() {
		return share_num;
	}
	public void setShare_num(String share_num) {
		this.share_num = share_num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWishday() {
		return wishday;
	}
	public void setWishday (String wishday) {
		this.wishday = wishday;
	}
	
//관광지 이름, 주소, 썸네일 얻고저장.
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getRoadaddr() {
		return roadaddr;
	}
	public void setRoadaddr(String roadaddr) {
		this.roadaddr = roadaddr;
	}
	public String getThumbmail() {
		return thumbmail;
	}
	public void setThumbmail(String thumbmail) {
		this.thumbmail = thumbmail;
	}
	
	
	
}
