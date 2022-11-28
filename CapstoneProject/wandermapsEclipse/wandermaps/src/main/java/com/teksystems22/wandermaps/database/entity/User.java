package com.teksystems22.wandermaps.database.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Table;


import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Id;
import javax.persistence.OneToMany;


@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="user_table")
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	@EqualsAndHashCode.Include
	@ToString.Include
	private Integer id;
	
	@Column(name="username")
	@EqualsAndHashCode.Include
	@ToString.Include
	private String userName;
	
	@Column(name="password")
	@EqualsAndHashCode.Include
	@ToString.Include
	private String password;
	
	@Column(name="first_name")
	@EqualsAndHashCode.Include
	@ToString.Include
	private String firstName;
	
	@Column(name="last_name")
	@EqualsAndHashCode.Include
	@ToString.Include
	private String lastName;
	
	@Column(name="message")
	@EqualsAndHashCode.Include
	@ToString.Include
	private String message;
	
	@Column(name="email")
	@EqualsAndHashCode.Include
	@ToString.Include
	private String email;
	
	@Column(name="age")
	@EqualsAndHashCode.Include
	@ToString.Include
	private Integer age;
	
	@Column(name="city")
	@EqualsAndHashCode.Include
	@ToString.Include
	private String city;
	
	@Column(name="state")
	@EqualsAndHashCode.Include
	@ToString.Include
	private String state;
	
	@Column(name="country")
	@EqualsAndHashCode.Include
	@ToString.Include
	private String country;
	
	@Column(name="timezone")
	@EqualsAndHashCode.Include
	@ToString.Include
	private String timezone;
	
	@OneToMany(mappedBy = "user", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@EqualsAndHashCode.Exclude
	@ToString.Exclude
	private List<Trip> trips;
	

}
