package com.teksystems22.wandermaps.database.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.teksystems22.wandermaps.database.entity.UserRoles;

public interface UserRoleDAO extends JpaRepository<UserRoles, Long>{
	
	public List<UserRoles> findByUserId(Integer userId);

	

}
