package com.teksystems22.wandermaps.form;

import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;

import com.teksystems22.wandermaps.database.entity.Event;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CreateTripForm {
	
	@NotEmpty(message="You must name your trip.")
	@Length(max=50, message="Name must be less than 50 characters.")
	private String name;
	
//	@DateTimeFormat(pattern = "MM/dd/yyyy")
	private Date arrivalDate;
	

	private Date departureDate;
	
	@NotEmpty(message="Transportaion type is required")
	@Length(max=45, message="Transportaion type must be less than 200 characters.")
	private String transType;
	
	@NotEmpty(message="Country is required.")
	@Length(max=50, message="Name must be less than 50 characters.")
	private String country;
	
	@NotEmpty(message="State is required.")
	@Length(max=50, message="Name must be less than 50 characters.")
	private String state;
	
	@NotEmpty(message="City is required.")
	@Length(max=50, message="Name must be less than 50 characters.")
	private String city;
	
	@NotEmpty(message="Timezone is required.")
	@Length(max=50, message="Name must be less than 50 characters.")
	private String timezone;
	
	@NotEmpty(message="Lodging type is required.")
	@Length(max=50, message="Name must be less than 50 characters.")
	private String lodgingType;
	
	@NotEmpty(message="Lodging address is required.")
	@Length(max=50, message="Name must be less than 50 characters.")
	private String lodgingAddress;
	
//	@NotEmpty(message="Please add at least one event to your itinerary.")
//	private List<Event> events;

}
