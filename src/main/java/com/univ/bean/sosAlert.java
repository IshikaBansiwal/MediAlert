package com.univ.bean;

import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "sos_alert")
public class sosAlert {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    private double latitude;
    private double longitude;

    @Temporal(TemporalType.TIMESTAMP)
    private Date timestamp;

    public sosAlert() {}

	public sosAlert(Long id, User user, double latitude, double longitude, Date timestamp) {
		super();
		this.id = id;
		this.user = user;
		this.latitude = latitude;
		this.longitude = longitude;
		this.timestamp = timestamp;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public Date getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(Date timestamp) {
		this.timestamp = timestamp;
	}

	@Override
	public String toString() {
		return "sosAlert [id=" + id + ", user=" + user + ", latitude=" + latitude + ", longitude=" + longitude
				+ ", timestamp=" + timestamp + "]";
	}

   
}
