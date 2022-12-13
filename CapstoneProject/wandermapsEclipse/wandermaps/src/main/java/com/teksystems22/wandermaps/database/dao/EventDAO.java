package com.teksystems22.wandermaps.database.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.teksystems22.wandermaps.database.entity.Event;

public interface EventDAO extends JpaRepository<Event, Long>{
	
	public Event getEventById(Integer Id);
	
	public Event getEventByTripDetailsId(Integer tripDetailsId);

}
