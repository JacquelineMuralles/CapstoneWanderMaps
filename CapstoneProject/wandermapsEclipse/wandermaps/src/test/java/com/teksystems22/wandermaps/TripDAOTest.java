package com.teksystems22.wandermaps;

import java.util.List;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;

import com.teksystems22.wandermaps.database.dao.TripDAO;
import com.teksystems22.wandermaps.database.entity.Trip;


@DataJpaTest
@TestMethodOrder(OrderAnnotation.class)
public class TripDAOTest {
	
	@Autowired
	private TripDAO tripDao;
	
	@Test
	@Order(1)
	public void getTripsTest() {
		
		Trip trip = tripDao.findById(1);
		Assertions.assertThat(trip.getId()).isEqualTo(1);
		
	}
	
	@Test
	@Order(2)
	public void getListOfTripDetails() {
		List<Trip> trips = tripDao.findAll();
		Assertions.assertThat(trips.size()).isGreaterThan(0);
	}


}
