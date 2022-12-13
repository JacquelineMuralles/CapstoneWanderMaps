package com.teksystems22.wandermaps.form;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;


import org.hibernate.validator.constraints.Length;

import com.teksystems22.wandermaps.validation.EmailUnique;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CreateUserForm {
	
	@NotEmpty(message="First name is required.")
	@Length(max=50, message="First name must be less than 50 characters.")
	private String firstName;
	
	@NotEmpty(message="Last name is required.")
	@Length(max=50, message="Last name must be less than 50 characters.")
	private String lastName;
	
////	@NotEmpty(message="Please enter your age.")
//	@Length(max=3, message="Please enter a real age.")
//	private Integer age;
	
	@NotEmpty(message="Username is required.")
	@Length(max=50, message="Username must be less than 50 characters.")
	private String username;
	
	@NotEmpty(message="Email is required.")
	@Length(max=200, message="Email must be less than 200 characters.")
	@EmailUnique(message="This user already exists, please try another email or login.")
	private String email;
	
	@Pattern(regexp = "^[a-zA-Z0-9!@#]+$", message = "Password can only contain lowercase, uppercase, and special caracters.")
	@Length(min = 8, message = "Password must be longer than 8 characters.")
	@Length(max = 25, message = "Password must be shorter than 25 characters.")
	private String password;
	
	@NotEmpty(message="Please confirm your password.")
	private String confirmPassword;
	
	@NotEmpty(message="Please provide the city you live in.")
	private String city;
	
	@NotEmpty(message="Please provide the state you live in.")
	private String state;
	
	@NotEmpty(message="Please provide the country you live in.")
	private String country;
	
	@NotEmpty(message="Please provide the timezone you live in.")
	@Length(max=5, message="Timezone must be less than 5 characters.")
	@Length(min=3, message="Timezone must be at least 3 characters.")
	private String timezone;
	
	@Length(max=500, message="Your personal message can be no longer than 500 characters.")
	private String message;

}
