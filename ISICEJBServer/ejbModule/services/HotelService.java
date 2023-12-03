package services;

import java.util.List;

import dao.HotelIDaoLocale;
import dao.HotelIDaoRemote;
import dao.HotelIDaoLocale;
import dao.HotelIDaoRemote;
import entities.Hotel;
import jakarta.annotation.security.PermitAll;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;

@Stateless(name = "sorhrani")
public class HotelService implements HotelIDaoLocale, HotelIDaoRemote {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	@PermitAll
	public Hotel create(Hotel o) {
		em.persist(o);
		return o;
	}

	@Override
	@PermitAll
	public boolean delete(Hotel o) {
		em.remove(em.contains(o) ? o: em.merge(o));
		return true;
	}

	@Override
	@PermitAll
	public Hotel update(Hotel o) {
		Hotel existingHotel = em.find(Hotel.class, o.getId());

	    if (existingHotel != null) {
	        existingHotel.setNom(o.getNom());
	        existingHotel.setAdresse(o.getAdresse());
	        existingHotel.setTelephone(o.getTelephone());
	        existingHotel.setVille(o.getVille());
	        em.merge(existingHotel);
	    }

	    return existingHotel;

	}

	@Override
	@PermitAll
	public Hotel findById(int id) {
		// TODO Auto-generated method stub
		return em.find(Hotel.class, id);
	}

	@Override
	@PermitAll
	public List<Hotel> findAll() {
		Query query = em.createQuery("select v from Hotel v");
		return query.getResultList();
	}
	

	@Override
	@PermitAll
	public List<Hotel> findByville(int id) {
		List<Hotel> hotels = null;
		hotels = em
				.createQuery("select h from Hotel h where h.ville.id = ?1", Hotel.class)
		        .setParameter(1, id)
		        .getResultList();
		return hotels;
	}

}

