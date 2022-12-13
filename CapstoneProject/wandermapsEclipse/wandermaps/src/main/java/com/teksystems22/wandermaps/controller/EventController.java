package com.teksystems22.wandermaps.controller;

import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.teksystems22.wandermaps.database.dao.EventDAO;
import com.teksystems22.wandermaps.database.dao.TripDAO;
import com.teksystems22.wandermaps.database.dao.TripDetailDAO;
import com.teksystems22.wandermaps.database.entity.Event;
import com.teksystems22.wandermaps.database.entity.Trip;
import com.teksystems22.wandermaps.database.entity.TripDetails;
import com.teksystems22.wandermaps.database.entity.User;
import com.teksystems22.wandermaps.form.CreateEventForm;
import com.teksystems22.wandermaps.security.AuthenticatedUserService;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class EventController {

	@Autowired
	TripDetailDAO tripDetailsDao;
	
	@Autowired
	EventDAO eventDao;
	
	@Autowired
	TripDAO tripDao;
	
	@Autowired
	AuthenticatedUserService authService;
	
	@RequestMapping(value = {"/trip/addTripEvent"}, method = RequestMethod.GET)
	public ModelAndView addTripEvent(@RequestParam(value="id", required=false) Integer id) {
		ModelAndView response = new ModelAndView();
		response.setViewName("trip/addTripEvent");
		
		User thisUser = authService.getCurrentUser();
		
		
		List<Map<String,Object>> currentTrips = tripDetailsDao.findByTripId(thisUser.getId(), id);
		
		
		response.addObject("currentTrips", currentTrips);
		
		return response;
		
	}
	
	@RequestMapping(value = "/trip/events", method = RequestMethod.GET)
	public ModelAndView events() {
		ModelAndView response = new ModelAndView();
		response.setViewName("trip/events");
		return response;
	}
	
	
	@RequestMapping(value = "/trip/events", method = RequestMethod.POST)
	public ModelAndView createEventSubmit(@Valid CreateEventForm form, BindingResult bindingResult) {
		ModelAndView response = new ModelAndView();
		response.setViewName("trip/events");
		
		log.debug("This is in the POST method for trip details");

		log.debug(form.toString());
		
		for (ObjectError e : bindingResult.getAllErrors()) {
			log.debug(e.getObjectName() + " : " + e.getDefaultMessage());
		}

		if ( ! bindingResult.hasErrors()) {
			Event event = new Event();
			
			event.setType(form.getType());
			event.setDate(form.getDate());
			event.setDescription(form.getDescription());
			event.setAddress(form.getAddress());
			

			//once saved eventId will be auto-populated
			eventDao.save(event);

			
		} else {
			response.addObject("bindingResult", bindingResult);
			response.addObject("form", form);
		}

		return response;
	}
}
