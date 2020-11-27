package spot.db;

import java.util.List;

import data.dao.SpotlistDao;
import data.dto.SpotlistDto;

public class control {

	public static void main(String[] args) {
		SpotlistJSON spJson = new SpotlistJSON();
		List<SpotlistDto> list = spJson.getSpotlist();
		
		SpotlistDao dao = new SpotlistDao();
		
		for(SpotlistDto dto : list) {

			dao.insertSpotlist(dto);
		}	
	}
}
