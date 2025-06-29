package com.univ.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.univ.bean.User;

public interface UserRepository extends JpaRepository<User, Integer>{
	@Query("select u from User u where u.unm=?1 and u.pw=?2")
	public User getLogin(String unm,String pw);
}
