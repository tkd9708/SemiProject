package spot.db;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.MalformedURLException;
import java.net.URL;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

import data.dto.SpotlistDto;

public class SpotlistJSON {
	
	public SpotlistDto getSpotlist() {
		String urlStr = "http://api.visitjeju.net/vsjApi/contents/searchList?apiKey=3vvg2yzxxd2edm7h&locale=kr&category=c1&page=13";
		
		SpotlistDto dto = new SpotlistDto();
		
		try {
			URL url = new URL(urlStr);
			BufferedReader bf = new BufferedReader(new InputStreamReader(url.openStream()));
			String line = "";
			String result = "";
			
			// 버퍼에 있는 정보를 문자열로 변환
			while((line = bf.readLine()) != null) {
				// 읽어와서 하나의 문자열로 만들기
				result = result.concat(line);
			}
			
			// System.out.println(result);
			
			// 문자열을 JSON으로 파싱
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = (JSONObject)jsonParser.parse(new StringReader(result));
			/*
			 * JSONObject parse_response = (JSONObject)jsonObj.get("response"); JSONObject
			 * parse_body = (JSONObject)parse_response.get("body");
			 */
//			JSONObject parse_items = (JSONObject)jsonObj.get("items");
			JSONArray parse_item = (JSONArray)jsonObj.get("items");
			
			JSONObject obj;
			System.out.println(parse_item.size());
			
			for(int i=0; i<parse_item.size(); i++) {
				obj = (JSONObject)parse_item.get(i); // 해당 item을 가져오기
				dto.setContentsid((String)obj.get("contentsid"));
				dto.setTitle((String)obj.get("title"));
				dto.setIntroduction((String)obj.get("introduction"));
				dto.setLatitude(String.valueOf(obj.get("latitude")));
				dto.setLogitude(String.valueOf(obj.get("logitude")));
				dto.setTag((String)obj.get("tag"));
				
			}
			
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e ) {
			System.out.println("ParseException : " + e.getMessage());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return dto;
	}
}
