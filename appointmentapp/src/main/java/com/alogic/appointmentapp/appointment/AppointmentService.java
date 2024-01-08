package com.alogic.appointmentapp.appointment;

import com.alogic.appointmentapp.patient.Patient;
import com.alogic.appointmentapp.patient.PatientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;
import java.util.Optional;

@Service
public class AppointmentService {

    private final AppointmentRepository appointmentRepository;

    @Autowired
    public AppointmentService(AppointmentRepository appointmentRepository) {
        this.appointmentRepository = appointmentRepository;
    }

    public List<Appointment> getAppointments(){
        return appointmentRepository.findAll();
    }

    public void addNewAppointment(Appointment appointment) {
        appointmentRepository.save(appointment);
    }

    public void addNewAppointment(Patient patient, LocalDate date, LocalTime time) {
        Appointment newAppointment = new Appointment(patient, LocalDateTime.of(date, time));
        appointmentRepository.save(newAppointment);
    }
}
