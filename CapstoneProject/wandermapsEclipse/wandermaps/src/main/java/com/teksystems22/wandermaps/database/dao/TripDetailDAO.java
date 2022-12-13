package com.teksystems22.wandermaps.database.dao;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.teksystems22.wandermaps.database.entity.TripDetails;

public interface TripDetailDAO extends JpaRepository<TripDetails, Long>{
	
//	public List<TripDetails> findByTripId (Integer tripId);
	
	@Query(value = "SELECT * from trip_details td join trip t on td.trip_id = t.id where t.user_id = :userId and t.id = tripId", 
			nativeQuery = true)
	public List<Map<String,Object>> findByTripId(Integer userId, Integer tripId);

}
