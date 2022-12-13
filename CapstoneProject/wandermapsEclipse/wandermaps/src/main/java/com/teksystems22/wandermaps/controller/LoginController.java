package com.teksystems22.wandermaps.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.teksystems22.wandermaps.database.dao.UserDAO;
import com.teksystems22.wandermaps.database.dao.UserRoleDAO;
import com.teksystems22.wandermaps.database.entity.User;
import com.teksystems22.wandermaps.database.entity.UserRoles;
import com.teksystems22.wandermaps.form.CreateUserForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LoginController {


		@Autowired
		private UserDAO userDao;
		
		@Autowired
		private UserRoleDAO userRoleDao;
		
		@Autowired
		@Qualifier("passwordEncoder")
		private PasswordEncoder passwordEncoder;
		
		// shows the actual login JSP page.
		@RequestMapping(value = "/user/login", method = RequestMethod.GET)
		public ModelAndView login() {
			ModelAndView response = new ModelAndView();
			response.setViewName("login_pages/login");
			return response;
		}
		
		//displays createUser page
		@RequestMapping(value = "/user/createuser", method = RequestMethod.GET)
		public ModelAndView createUser() {
			ModelAndView response = new ModelAndView();
			response.setViewName("login_pages/create_user");

			log.debug("This is in the GET method for create user");
			return response;
		}

		//Gets the user entered values for create user form
		@RequestMapping(value = "/user/createuser", method = RequestMethod.POST)
		public ModelAndView createUserSubmit(@Valid CreateUserForm form, BindingResult bindingResult) {
			ModelAndView response = new ModelAndView();
			response.setViewName("login_pages/create_user");
			
			log.debug("This is in the POST method for create user");

			log.debug(form.toString());
			
			for (ObjectError e : bindingResult.getAllErrors()) {
				log.debug(e.getObjectName() + " : " + e.getDefaultMessage());
			}

			if ( ! bindingResult.hasErrors()) {
				User user = new User();
				// encodes the password that's coming in
				String encodedPassword = passwordEncoder.encode(form.getPassword());
				user.setPassword(encodedPassword);

				user.setFirstName(form.getFirstName());
				user.setLastName(form.getLastName());
				user.setUsername(form.getUsername());
				user.setMessage(form.getMessage());
				user.setEmail(form.getEmail());
				user.setCity(form.getCity());
				user.setState(form.getState());
				user.setCountry(form.getCountry());
				user.setTimezone(form.getTimezone());

				//once saved userId will be auto-populated
				userDao.save(user);
				
				UserRoles ur = new UserRoles();
				ur.setRoleName("USER");
				//you can now get that id from user and use it to add role name into userRole table
				ur.setUserId(user.getId());
				
				userRoleDao.save(ur);
				
			} else {
				response.addObject("bindingResult", bindingResult);
				response.addObject("form", form);
			}

			return response;
		}

}
