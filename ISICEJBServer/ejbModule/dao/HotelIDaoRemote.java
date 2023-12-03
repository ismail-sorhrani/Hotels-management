package dao;

import java.util.List;

import entities.Hotel;

public interface HotelIDaoRemote extends IDaoRemote<Hotel> {
	List<Hotel> findByville(int nom);
}
