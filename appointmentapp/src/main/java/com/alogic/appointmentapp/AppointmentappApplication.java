package com.alogic.appointmentapp;

import com.alogic.appointmentapp.patient.Patient;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RestController;


@SpringBootApplication
public class AppointmentappApplication {

    public static void main(String[] args) {
        SpringApplication.run(AppointmentappApplication.class, args);
    }

}
