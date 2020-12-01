package spot.db;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

import data.dto.SpotlistDto;
public class SpotlistJSON {
	
	public List<SpotlistDto> getSpotlist() {
		String urlStr = "http://api.visitjeju.net/vsjApi/contents/searchList?apiKey=3vvg2yzxxd2edm7h&locale=kr&category=c1&page=13";
		
		List<SpotlistDto> list = new ArrayList<SpotlistDto>();
		
		
		try {
			URL url = new URL(urlStr);
			BufferedReader bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			String line = "";
			String result = "";
			
			// 버퍼에 있는 정보를 문자열로 변환
			while((line = bf.readLine()) != null) {
				// 읽어와서 하나의 문자열로 만들기
				result = result.concat(line);
			}
			
			//System.out.println(result);
			
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
			//System.out.println(parse_item.size());
			
			for(int i=0; i<parse_item.size(); i++) {
				SpotlistDto dto = new SpotlistDto();
				
				obj = (JSONObject)parse_item.get(i); // 해당 item을 가져오기
				
				JSONObject parse_region1cd = (JSONObject)obj.get("region1cd");
				JSONObject parse_region2cd = (JSONObject)obj.get("region2cd");
				
				if(obj.containsKey("repPhoto")) {
					JSONObject parse_repPhoto = (JSONObject)obj.get("repPhoto");
					
					if(parse_repPhoto != null && parse_repPhoto.containsKey("photoid")) {
						
						JSONObject parse_photoid = (JSONObject)parse_repPhoto.get("photoid");
						if(parse_photoid.containsKey("thumbnailpath")) {

							dto.setThumbnail((String)parse_photoid.get("thumbnailpath"));
							
						}
					}
				}
				dto.setContentsid((String)obj.get("contentsid"));
				dto.setTitle((String)obj.get("title"));
				dto.setIntroduction((String)obj.get("introduction"));

				if(obj.get("latitude") != null) {
					dto.setLatitude((Double)obj.get("latitude"));
				}
				else {
					dto.setLatitude(0.0);
				}
				
				if(obj.get("longitude") != null) {
					dto.setLongitude((Double)obj.get("longitude"));
				}
				else {
					dto.setLongitude(0.0);
				}
				dto.setTag((String)obj.get("tag"));
				dto.setLabel1((String)parse_region1cd.get("label"));
				dto.setLabel2((String)parse_region2cd.get("label"));
				dto.setRoadaddr((String)obj.get("roadaddress"));
				
				list.add(dto);
				
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
		
		return list;
	}
}
