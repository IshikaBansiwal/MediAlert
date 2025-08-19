package com.univ.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.univ.bean.SosAlert;

public interface sosRepository extends JpaRepository<SosAlert, Long> {
	List<SosAlert> findAll();
	List<SosAlert> findAllByOrderByTimestampDesc();
	 List<SosAlert> findByUser_Id(Long userId);

}
