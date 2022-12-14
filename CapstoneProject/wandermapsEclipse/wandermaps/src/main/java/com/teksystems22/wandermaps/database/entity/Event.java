package com.teksystems22.wandermaps.database.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name="events")
public class Event {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	@EqualsAndHashCode.Include
	@ToString.Include
	private Integer id;
	
	@Column(name="type")
	@EqualsAndHashCode.Include
	@ToString.Include
	private String type;
	
	@Column(name="date")
	@Temporal(TemporalType.TIMESTAMP)
	@EqualsAndHashCode.Include
	@ToString.Include
	private Date date;
	
	@Column(name="description")
	@EqualsAndHashCode.Include
	@ToString.Include
	private String description;
	
	@Column(name="address")
	@EqualsAndHashCode.Include
	@ToString.Include
	private String address;
    
	//many to one
    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "trip_details_id",  nullable = false)
    @EqualsAndHashCode.Exclude
	@ToString.Exclude
	private TripDetails tripDetails;
	
	

}
