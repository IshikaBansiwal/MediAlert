package com.univ.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.univ.bean.SosAlert;
import com.univ.bean.User;
import com.univ.repository.sosRepository;

@Service
public class SosAlertService {

    @Autowired
    private sosRepository sosAlertRepository;

    public SosAlert saveSosAlert(User user, double latitude, double longitude) {
        SosAlert alert = new SosAlert();
        alert.setUser(user);
        alert.setLatitude(latitude);
        alert.setLongitude(longitude);
        alert.setTimestamp(new Date());
        return sosAlertRepository.save(alert);
    }

    public java.util.List<SosAlert> getAllAlerts() {
        return sosAlertRepository.findAll();
    }

    public List<SosAlert> getAlertsByUser(Long userId) {
        return sosAlertRepository.findByUser_Id(userId);
    }

}