package dao;

import java.util.List;

import entities.Hotel;

public interface HotelIDaoLocale extends IDaoLocale<Hotel> {
	List<Hotel> findByville(int id);

}
