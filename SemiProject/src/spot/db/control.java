package spot.db;

import data.dao.SpotlistDao;
import data.dto.SpotlistDto;

public class control {

	public static void main(String[] args) {
		SpotlistJSON spJson = new SpotlistJSON();
		SpotlistDto dto = spJson.getSpotlist();
		
		SpotlistDao dao = new SpotlistDao();
		dao.insertSpotlist(dto);
	}
}
