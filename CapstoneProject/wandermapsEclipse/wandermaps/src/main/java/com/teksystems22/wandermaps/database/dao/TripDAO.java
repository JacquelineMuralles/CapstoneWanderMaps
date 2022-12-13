package com.teksystems22.wandermaps.database.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.teksystems22.wandermaps.database.entity.Trip;


public interface TripDAO extends JpaRepository<Trip, Long>{

	public Trip findById(Integer Id);
	
}
