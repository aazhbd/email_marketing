package com.alogic.appointmentapp;

import org.springframework.cglib.core.Local;

import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

public class AppointmentTime {
    private List<LocalTime> times;

    public AppointmentTime() {
        times = new ArrayList<LocalTime>();
        for(int i = 6; i <= 18; i++) {
            LocalTime time = LocalTime.of(i, 0, 0);
            this.times.add(time);
        }
    }

    public List<LocalTime> getTimes() {
        return times;
    }

    public void setTimes(List<LocalTime> times) {
        this.times = times;
    }
}
