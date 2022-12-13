package com.teksystems22.wandermaps.form;

import java.util.Date;

import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CreateEventForm {
	
	@NotEmpty(message="Event type is required.")
	@Length(max=50, message="Type must be less than 50 characters.")
	private String type;
	
	@NotEmpty(message="Date of event is required.")
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	private Date date;
	
	@NotEmpty(message="Event description is required.")
	@Length(max=50, message="Event description must be less than 200 characters.")
	private String description;
	
	@NotEmpty(message="Event address is required.")
	@Length(max=50, message="Event address must be less than 200 characters.")
	private String address;

}
