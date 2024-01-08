package com.alogic.appointmentapp.appointment;

import com.alogic.appointmentapp.patient.Patient;
import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table
public class Appointment {
    @Id
    @SequenceGenerator(
            name="appointment_sequence",
            sequenceName = "appointment_sequence",
            allocationSize = 1
    )
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "appointment_sequence"
    )
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    private final Patient patient;

    private LocalDateTime appointmentTime;

    public Appointment(Long id, Patient patient, LocalDateTime appointmentTime) {
        this.id = id;
        this.patient = patient;
        this.appointmentTime = appointmentTime;
    }

    public Appointment(Patient patient, LocalDateTime appointmentTime) {
        this.patient = patient;
        this.appointmentTime = appointmentTime;
    }

    public Appointment() {
        patient = null;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Patient getPatient() {
        return patient;
    }

    public LocalDateTime getAppointmentTime() {
        return appointmentTime;
    }

    public void setAppointmentTime(LocalDateTime appointmentTime) {
        this.appointmentTime = appointmentTime;
    }

    @Override
    public String toString() {
        return "Appointment{" +
                "id=" + id +
                ", patient=" + patient +
                ", appointmentTime=" + appointmentTime +
                '}';
    }
}