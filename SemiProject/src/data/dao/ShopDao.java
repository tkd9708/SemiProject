package data.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import mysql.db.MysqlConnect;

public class ShopDao {
	MysqlConnect db=new MysqlConnect();
	
	//��ٱ��� ���
	public List<HashMap<String, String>> getCartList(String id)
	{
		List<HashMap<String, String>> list=new ArrayList<HashMap<String,String>>();
		
		return list;
	}
}
