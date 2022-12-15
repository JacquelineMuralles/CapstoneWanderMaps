package com.teksystems22.wandermaps.database.dao;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.teksystems22.wandermaps.database.entity.TripDetails;

public interface TripDetailDAO extends JpaRepository<TripDetails, Long>{
	
	public TripDetails findById(Integer id);
	
	
	@Query(value = "SELECT td.trip_id FROM trip_details td where td.id = :id", nativeQuery = true)
	public Integer findTripIdByTripDetailsId(Integer id);
	
	@Query(value = "SELECT td.id, td.trip_id, td.arrival_date, td.departure_date, td.country, td.state, td.city, td.timezone, "
			+ "td.lodging_type, td.lodging_address, td.trans_type, t.user_id "
			+ "from trip_details td join trip t on td.trip_id = t.id where t.user_id = :userId and t.id = :tripId ", 
			nativeQuery = true)
	public List<Map<String,Object>> findByTripId(Integer userId, Integer tripId);
	
	

}
