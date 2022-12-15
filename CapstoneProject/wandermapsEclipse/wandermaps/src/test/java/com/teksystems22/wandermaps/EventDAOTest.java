package com.teksystems22.wandermaps;


import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.annotation.Rollback;

import com.teksystems22.wandermaps.database.dao.EventDAO;
import com.teksystems22.wandermaps.database.entity.Event;

@DataJpaTest
@TestMethodOrder(OrderAnnotation.class)
public class EventDAOTest {
	
	@Autowired
	private EventDAO eventDao;
	
	@Test
	@Order(1)
	@Rollback(value = false)
	public void getEventsTest() {
		
		Event event = eventDao.findById(1);
		
	}

}
