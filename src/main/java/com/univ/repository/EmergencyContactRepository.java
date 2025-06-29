package com.univ.repository;

import com.univ.bean.EmergencyContact;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface EmergencyContactRepository extends JpaRepository<EmergencyContact, Long> {
	List<EmergencyContact> findByUserId(Long userId);
}
