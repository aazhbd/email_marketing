package com.alogic.appointmentapp.patient;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.time.LocalDate;
import java.time.Month;
import java.util.List;

@Configuration
public class PatientConfig {

    @Bean
    CommandLineRunner commandLineRunner(PatientRepository repository) {
        return args -> {
            Patient abdullah = new Patient(
                    "Abdullah", "Hossain", "a@a.net", "1234", "Fulda",
                    LocalDate.of(1990, Month.FEBRUARY, 5), "BARMER"
            );

            Patient alex = new Patient(
                    "Alex", "Ender", "a@l.net", "1234", "Fulda",
                    LocalDate.of(1890, Month.FEBRUARY, 5), "BARMER"
            );

            repository.saveAll(List.of(abdullah, alex));
        };
    }
}
