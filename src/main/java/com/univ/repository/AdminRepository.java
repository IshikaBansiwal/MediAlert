package com.univ.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.univ.bean.Admin;

public interface AdminRepository extends JpaRepository<Admin, Long> {
    Admin findByUsernameAndPassword(String username, String password);
}
