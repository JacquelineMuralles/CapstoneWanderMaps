package com.teksystems22.wandermaps.database.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

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
	private Integer id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="arrival_date")
	@Temporal(TemporalType.TIMESTAMP)
	private Date arrivalDate;
	
	@Column(name="departure_date")
	@Temporal(TemporalType.TIMESTAMP)
	private Date departureDate;

	@Column(name="trans_type")
	private String transType;
	
	@Column(name="country")
	private String country;
	
	@Column(name="state")
	private String state;
	
	@Column(name="city")
	private String city;
	
	@Column(name="timezone")
	private String timezone;
	
	@Column(name="lodging_type")
	private String lodgingType;
	
	@Column(name="lodging_address")
	private String lodgingAddress;
	
	//mapped by entity name of many to one in events
	@OneToMany(mappedBy = "tripDetails", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@EqualsAndHashCode.Exclude
	@ToString.Exclude
	private List<Event> events;
	
	//many to one
    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "trip_id", nullable = false)
    @EqualsAndHashCode.Exclude
	@ToString.Exclude
	private Trip trip;
	
	
}
