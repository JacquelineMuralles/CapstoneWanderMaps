package com.teksystems22.wandermaps;

import java.util.List;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;

import com.teksystems22.wandermaps.database.dao.TripDetailDAO;
import com.teksystems22.wandermaps.database.entity.TripDetails;


@DataJpaTest
@TestMethodOrder(OrderAnnotation.class)
public class TripDetailDAOTest {
	
	@Autowired
	private TripDetailDAO tripDetailDao;
	
	@Test
	@Order(1)
	public void getTripDetailsTest() {
		
		TripDetails tripDetails = tripDetailDao.findById(1);
		Assertions.assertThat(tripDetails.getId()).isEqualTo(1);
		
	}
	
	@Test
	@Order(2)
	public void getListOfTripDetails() {
		List<TripDetails> tripDetails = tripDetailDao.findAll();
		Assertions.assertThat(tripDetails.size()).isGreaterThan(0);
	}


}
