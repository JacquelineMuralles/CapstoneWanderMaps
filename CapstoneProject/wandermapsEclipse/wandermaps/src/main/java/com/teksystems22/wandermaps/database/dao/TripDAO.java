package com.teksystems22.wandermaps.database.dao;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.teksystems22.wandermaps.database.entity.Trip;


public interface TripDAO extends JpaRepository<Trip, Long>{

	public Trip findById(Integer Id);
	
	public List<Trip> findAll();
	
//	e.trip_details_id AS tripDetailsId ,
//	e.id AS eventId
//	
	@Query(value = "SELECT  td.trip_id AS tripId, t.user_id AS userId, td.arrival_date AS arrivalDate, "
			+ "td.departure_date AS departureDate, td.country AS tripCountry, td.state AS tripState, td.trans_type AS transType, td.city AS tripCity, "
			+ "td.timezone AS tripTimezone, td.lodging_type AS lodgingType, td.lodging_address AS lodgingAddress, t.name AS tripName "
			+ "FROM trip t LEFT JOIN trip_details td on t.id = td.trip_id "
			+ "where t.user_id = :userId and t.id = :tripId LIMIT 1", 
			nativeQuery = true)
	public List<Map<String,Object>> findLocationByTripId(Integer userId, Integer tripId);
	
	
	@Query(value = "SELECT e.trip_details_id AS tripDetailsId, td.trip_id AS tripId, t.user_id AS userId, e.id AS eventId, "
			+"e.date AS eventDate, e.type AS eventType, e.address AS eventAddress, e.description AS eventDescription "
			+ "FROM trip t LEFT JOIN trip_details td on t.id = td.trip_id LEFT JOIN events e on td.id = e.trip_details_id "
			+ "where t.user_id = :userId and t.id = :tripId ORDER BY e.date ", 
			nativeQuery = true)
	public List<Map<String,Object>> findEventByTripId(Integer userId, Integer tripId);
	
	
	@Query(value = "SELECT e.trip_details_id AS tripDetailsId , td.trip_id AS tripId, t.user_id AS userId, e.id AS eventId, td.arrival_date AS arrivalDate, "
			+ "td.departure_date AS departureDate, td.country AS tripCountry, td.state AS tripState, td.trans_type AS transType, td.city AS tripCity, "
			+ "td.timezone AS tripTimezone, td.lodging_type AS lodgingType, td.lodging_address AS lodgingAddress, t.name"
			+"e.date AS eventDate, e.type AS eventType, e.address AS eventAddress, e.description AS eventDescription "
			+ "FROM trip t LEFT JOIN trip_details td on t.id = td.trip_id LEFT JOIN events e on td.id = e.trip_details_id "
			+ "where t.user_id = :userId and t.id = :tripId ORDER BY td.arrival_date, e.date ", 
			nativeQuery = true)
	public List<Map<String,Object>> findByTripId(Integer userId, Integer tripId);
	
	
	@Query(value = "SELECT t.id, t.name, t.user_id FROM trip t WHERE t.user_id = :userId", nativeQuery = true)
	public List<Trip> findByTripIdAndUserId(Integer userId);
	
}
