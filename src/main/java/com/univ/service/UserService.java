package com.univ.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.univ.bean.User;
import com.univ.repository.UserRepository;

@Service
public class UserService {
	@Autowired
	UserRepository userrepo;
	
	public User insert(User usr)
	{
		return (User) userrepo.save(usr);
	}
	
	public User checkLogin(String unm,String pw) {
		return userrepo.getLogin(unm,pw);
		
	}
}
