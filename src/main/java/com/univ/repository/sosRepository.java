package com.univ.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.univ.bean.sosAlert;

public interface sosRepository extends JpaRepository<sosAlert, Long> {
	List<sosAlert> findAll();
	List<sosAlert> findAllByOrderByTimestampDesc();

}
