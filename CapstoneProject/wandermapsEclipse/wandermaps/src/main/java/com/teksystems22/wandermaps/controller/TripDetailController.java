package com.teksystems22.wandermaps.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.teksystems22.wandermaps.database.dao.EventDAO;
import com.teksystems22.wandermaps.database.dao.TripDAO;
import com.teksystems22.wandermaps.database.dao.TripDetailDAO;

import com.teksystems22.wandermaps.database.entity.Trip;
import com.teksystems22.wandermaps.database.entity.TripDetails;
import com.teksystems22.wandermaps.database.entity.User;
import com.teksystems22.wandermaps.form.CreateTripForm;
import com.teksystems22.wandermaps.security.AuthenticatedUserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TripDetailController {
	
	@Autowired
	TripDetailDAO tripDetailsDao;
	
	@Autowired
	EventDAO eventDao;
	
	@Autowired
	TripDAO tripDao;
	
	@Autowired
	AuthenticatedUserService authService;
	
	
	
//	@Autowired
//	private UserDAO userDao;
	
	@RequestMapping(value = "/trip/tripdetails", method = RequestMethod.GET)
	public ModelAndView tripDetaiils() {
		ModelAndView response = new ModelAndView();
		response.setViewName("trip/tripdetails");
		
		User user = authService.getCurrentUser();
		response.addObject("name", user.getFirstName());
		
		//need to grab name and put it into page
		return response;
	}
	
	
	
	
	
	
	
	@RequestMapping(value = "/trip/tripdetails", method = RequestMethod.POST)
	public ModelAndView createTripDetailsSubmit(@Valid CreateTripForm form, BindingResult bindingResult) {
		ModelAndView response = new ModelAndView();
		response.setViewName("trip/tripdetails");
		
		log.debug("This is in the POST method for trip details");

		log.debug(form.toString());
	
		for (ObjectError e : bindingResult.getAllErrors()) {
			log.debug(e.getObjectName() + " : " + e.getDefaultMessage());
		}

		if ( ! bindingResult.hasErrors()) {
			
			Trip trip = new Trip();
			User user = authService.getCurrentUser();
			trip.setName(form.getName());
			trip.setUser(user);
			
			tripDao.save(trip);
			response.addObject("trip", trip);
			
			
			TripDetails tripDetail = new TripDetails();

			tripDetail.setTrip(trip);
			tripDetail.setArrivalDate(form.getArrivalDate());
			tripDetail.setDepartureDate(form.getDepartureDate());
			tripDetail.setTransType(form.getTransType());
			tripDetail.setCountry(form.getCountry());
			tripDetail.setState(form.getState());
			tripDetail.setCity(form.getCity());
			tripDetail.setTimezone(form.getTimezone());
			tripDetail.setLodgingType(form.getLodgingType());
			tripDetail.setLodgingAddress(form.getLodgingAddress());
//			tripDetail.setEvents(form.getEvents());

			//once saved userId will be auto-populated
			tripDetailsDao.save(tripDetail);
			
//		
//			response.setViewName("trip/addTripEvent?id=" + trip.getId());
			
			
			
		} else {
			response.addObject("bindingResult", bindingResult);
			response.addObject("form", form);
		}

		return response;
	}

}
