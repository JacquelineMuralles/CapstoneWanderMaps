package com.teksystems22.wandermaps.database.dao;



import org.springframework.data.jpa.repository.JpaRepository;

import com.teksystems22.wandermaps.database.entity.User;

public interface UserDAO extends JpaRepository<User, Long>{

	public User findByEmail(String email);
	
}
