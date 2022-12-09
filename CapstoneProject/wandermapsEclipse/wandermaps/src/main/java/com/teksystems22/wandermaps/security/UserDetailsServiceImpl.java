package com.teksystems22.wandermaps.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.teksystems22.wandermaps.database.entity.UserRoles;
import com.teksystems22.wandermaps.database.entity.User;
import com.teksystems22.wandermaps.database.dao.UserDAO;
import com.teksystems22.wandermaps.database.dao.UserRoleDAO;

@Component
public class UserDetailsServiceImpl implements UserDetailsService {
	public static final Logger LOG = LoggerFactory.getLogger(UserDetailsServiceImpl.class);
	@Autowired
	private UserDAO userDao;
	
	@Autowired
	private UserRoleDAO userRoleDao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		//this class is used by Spring security to fetch user form db and create user roles.
		User user = userDao.findByEmail(username);
		
		if (user == null) {
			throw new UsernameNotFoundException("Username '" + username + "' not found in database");
		}
		
		List<UserRoles> userRoles = userRoleDao.findByUserId(user.getId());
		boolean accountIsEnabled = true;
		boolean accountNonExpired = true;
		boolean credentialsNonExpired = true;
		boolean accountNonLocked = true;
		
		// setup user roles
		Collection<? extends GrantedAuthority> springRoles = buildGrantAuthorities(userRoles);
		return new org.springframework.security.core.userdetails.User(user.getEmail(), user.getPassword(), accountIsEnabled, accountNonExpired, credentialsNonExpired, accountNonLocked, springRoles);
	}
	
	private Collection<? extends GrantedAuthority> buildGrantAuthorities(List<UserRoles> userRoles) {
		
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		
		for (UserRoles role : userRoles) {
			authorities.add(new SimpleGrantedAuthority(role.getRoleName()));
		}
		return authorities;
	}
}
