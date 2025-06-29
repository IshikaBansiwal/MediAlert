package com.univ.bean;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class User {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;
    private String email;
    private String pw;
    private String unm;
    private String phone;
    private String bloodGroup;
    private String allergies;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getUnm() {
		return unm;
	}
	public void setUnm(String unm) {
		this.unm = unm;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBloodGroup() {
		return bloodGroup;
	}
	public void setBloodGroup(String bloodGroup) {
		this.bloodGroup = bloodGroup;
	}
	public String getAllergies() {
		return allergies;
	}
	public void setAllergies(String allergies) {
		this.allergies = allergies;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", email=" + email + ", pw=" + pw + ", unm=" + unm + ", phone="
				+ phone + ", bloodGroup=" + bloodGroup + ", allergies=" + allergies + "]";
	}
	public User(int id, String name, String email, String pw, String unm, String phone, String bloodGroup,
			String allergies) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.pw = pw;
		this.unm = unm;
		this.phone = phone;
		this.bloodGroup = bloodGroup;
		this.allergies = allergies;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
    
}
