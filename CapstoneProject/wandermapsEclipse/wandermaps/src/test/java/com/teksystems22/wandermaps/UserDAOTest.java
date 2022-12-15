package com.teksystems22.wandermaps;

import java.util.List;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;

import com.teksystems22.wandermaps.database.dao.UserDAO;
import com.teksystems22.wandermaps.database.entity.User;

@DataJpaTest
@TestMethodOrder(OrderAnnotation.class)
public class UserDAOTest {
	
	@Autowired
	private UserDAO userDao;
	
	@Test
	@Order(1)
	public void getUserTest() {
		User user = userDao.findById(1);
		Assertions.assertThat(user.getId()).isEqualTo(1);
	}
	
	@Test
	@Order(2)
	public void getListOfUsers() {
		List<User> users = userDao.findAll();
		Assertions.assertThat(users.size()).isGreaterThan(0);
	}

}
