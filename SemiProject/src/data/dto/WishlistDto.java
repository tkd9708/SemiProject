package data.dto;

import java.sql.Date;

public class WishlistDto {
	private String num;
	private String memNum;
	private String spotId;
	private String shareNum;
	private String aroundId;
	private String content;
	private String wishday;
	
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getMemNum() {
		return memNum;
	}
	public void setMemNum(String memNum) {
		this.memNum = memNum;
	}
	public String getSpotId() {
		return spotId;
	}
	public void setSpotId(String spotId) {
		this.spotId = spotId;
	}
	public String getShareNum() {
		return shareNum;
	}
	public void setShareNum(String shareNum) {
		this.shareNum = shareNum;
	}
	public String getAroundId() {
		return aroundId;
	}
	public void setAroundId(String aroundId) {
		this.aroundId = aroundId;
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
	public void setWishday(String wishday) {
		this.wishday = wishday;
	}
	
}
