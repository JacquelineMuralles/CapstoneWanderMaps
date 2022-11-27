package com.teksystems22.wandermaps.database.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.teksystems22.wandermaps.database.entity.User;

@Repository
public interface UserDAO extends JpaRepository<User, Long>{

		public List<User> findByUsername(String name);
}
