package data.dto;

import java.sql.Timestamp;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class MemberDto {
	private String num;
	private String id;
	private String pass;
	private String name;
	private String address;
	private String addrdetail;
	private String email;
	private String hp;
	private Timestamp gaipday;
	
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
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddrdetail() {
		return addrdetail;
	}
	public void setAddrdetail(String addrdetail) {
		this.addrdetail = addrdetail;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public Timestamp getGaipday() {
		return gaipday;
	}
	public void setGaipday(Timestamp gaipday) {
		this.gaipday = gaipday;
	}
	
	public boolean isPwVal(String pass)
	{
		boolean validPass = false;
		
		final String pattern1 = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[^A-Za-z0-9°¡-ÆR¤¡-¤¾¤¿-¤Ó])[A-Za-z0-9[^A-Za-z0-9¤¡-¤¾¤¿-¤Ó°¡-ÆR]]{8,}$";
		Matcher match;
		
		//Æ¯¼ö¹®ÀÚ,¿µ¹®,¼ıÀÚ Á¶ÇÕ(8ÀÚ¸® ÀÌ»ó)
		match = Pattern.compile(pattern1).matcher(pass);
		
		if(match.find())
		{
			validPass = true;
		}
		
		return validPass;
	}
}
