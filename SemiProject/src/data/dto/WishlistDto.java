package data.dto;

import java.sql.Date;

public class WishlistDto {
	private String num;
	private String mem_num;
	private String spot_id;
	private String share_num;
	private String content;
	private String wishday;
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getMem_num() {
		return mem_num;
	}
	public void setMem_num(String mem_num) {
		this.mem_num = mem_num;
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
	
	
}
