package com.teksystems22.wandermaps.database.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="trip_details")
public class TripDetails {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	@EqualsAndHashCode.Include
	@ToString.Include
	private Integer id;
	
	@Column(name="arrival_date")
	@EqualsAndHashCode.Include
	@ToString.Include
	private java.sql.Timestamp arrivalDate;
	
//	https://vladmihalcea.com/date-timestamp-jpa-hibernate/
	
	@Column(name="departure_date")
	@EqualsAndHashCode.Include
	@ToString.Include
	private java.sql.Timestamp departureDate;

	@Column(name="trans_type")
	@EqualsAndHashCode.Include
	@ToString.Include
	private String transType;
	
	@Column(name="country")
	@EqualsAndHashCode.Include
	@ToString.Include
	private String country;
	
	@Column(name="state")
	@EqualsAndHashCode.Include
	@ToString.Include
	private String state;
	
	@Column(name="city")
	@EqualsAndHashCode.Include
	@ToString.Include
	private String city;
	
	@Column(name="timezone")
	@EqualsAndHashCode.Include
	@ToString.Include
	private String timezone;
	
	@Column(name="lodging_type")
	@EqualsAndHashCode.Include
	@ToString.Include
	private String lodgingType;
	
	@Column(name="lodging_address")
	@EqualsAndHashCode.Include
	@ToString.Include
	private String lodgingAddress;
	
	@OneToMany(mappedBy = "tripDetails", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@EqualsAndHashCode.Exclude
	@ToString.Exclude
	private List<Event> events;
	
	
}
