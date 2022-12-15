package com.teksystems22.wandermaps.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.teksystems22.wandermaps.database.dao.EventDAO;
import com.teksystems22.wandermaps.database.dao.TripDAO;
import com.teksystems22.wandermaps.database.dao.TripDetailDAO;
import com.teksystems22.wandermaps.database.entity.Trip;
import com.teksystems22.wandermaps.database.entity.User;
import com.teksystems22.wandermaps.security.AuthenticatedUserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TripController {
	

	@Autowired
	TripDetailDAO tripDetailsDao;
	
	@Autowired
	EventDAO eventDao;
	
	@Autowired
	TripDAO tripDao;
	
	@Autowired
	AuthenticatedUserService authService;

	
	//itineray
	//in trip DAO find all trip detail info and event info
	//add to resonse body
	//display
		@RequestMapping(value = {"/trip/itinerary"}, method = RequestMethod.GET)
		public ModelAndView viewTripItinerary(@RequestParam(value="id", required=false) Integer id) {
			ModelAndView response = new ModelAndView();
			response.setViewName("trip/itinerary");
			
			
			User thisUser = authService.getCurrentUser();
			//SEPERATED QUERY
			List<Map<String,Object>> itineraryLocationInfo = tripDao.findLocationByTripId(thisUser.getId(), id);
			List<Map<String,Object>> itineraryEventInfo = tripDao.findEventByTripId(thisUser.getId(), id);
			
			response.addObject("tripId", id);
			response.addObject("firstName", thisUser.getFirstName());
			response.addObject("itineraryLocationInfo", itineraryLocationInfo);
			response.addObject("itineraryEventInfo", itineraryEventInfo);

			log.debug(itineraryLocationInfo.toString());
			log.debug(itineraryEventInfo.toString());
			
//			//ONE QUERY
//			List<Map<String,Object>> itineraryInfo = tripDao.findByTripId(thisUser.getId(), id);
//			response.addObject("itineraryInfo", itineraryInfo);
			
			

			
			return response;
			
		}
	
	//find trip by userId
	//display all trip names
	//create a link that takes user to itinearary of trip 
		
		@RequestMapping(value = {"/trip/trips"}, method = RequestMethod.GET)
		public ModelAndView viewAlTrips() {
			ModelAndView response = new ModelAndView();
			response.setViewName("trip/trips");
			
			User thisUser = authService.getCurrentUser();
			
			List <Trip> trips = tripDao.findByTripIdAndUserId(thisUser.getId());
			log.debug("trips: " + trips.toString());
			response.addObject("userName", thisUser.getFirstName());			
			response.addObject("trips", trips);

			return response;
			
		}
		
	

}
