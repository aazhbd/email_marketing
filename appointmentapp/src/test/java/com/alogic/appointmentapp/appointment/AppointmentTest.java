package com.alogic.appointmentapp.appointment;

import com.alogic.appointmentapp.patient.Patient;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.security.InvalidParameterException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Month;

import static org.junit.jupiter.api.Assertions.*;

class AppointmentTest {

    private Patient patient;
    private Appointment appointment;

    @BeforeEach
    void setUp() {
        patient = new Patient("Alex", "Ender", "a@a.net", "1234", "Fulda",
                LocalDate.of(2023, Month.FEBRUARY, 5), "BARMER"
        );
        appointment = new Appointment(patient, LocalDateTime.of(2024,10,10, 10,0,0));
    }

    @Test
    void getPatient() {
        assertEquals("Alex", appointment.getPatient().getFirstName());
    }

    @Test
    void getAppointmentTime() {
        assertEquals(LocalDateTime.of(2024,10,10, 10,0,0), appointment.getAppointmentTime());
    }

    @Test
    void createAppointmentWithInvalidTime() {
        try {
            patient = new Patient("Alex", "Ender", "a@a.net", "1234", "Fulda",
                    LocalDate.of(2023, Month.FEBRUARY, 5), "BARMER"
            );
            appointment = new Appointment(patient, LocalDateTime.of(2024,5,5, 10,0,0));
        }
        catch (InvalidParameterException ex) {
            assertEquals("Appointment cannot be set on Sunday.", ex.getMessage());
        }
    }

    @Test
    void setAppointmentTime() {
        LocalDateTime appointmentTime = LocalDateTime.of(2024,5,1, 8,0,0);
        appointment.setAppointmentTime(appointmentTime);
        assertEquals(LocalDateTime.of(2024,5,1, 8,0,0), appointment.getAppointmentTime());
    }

    @Test
    void setAppointmentTimeOnWeekend() {
        LocalDateTime appointmentTime = LocalDateTime.of(2024,5,4, 8,0,0);
        try {
            appointment.setAppointmentTime(appointmentTime);
        }
        catch (InvalidParameterException ex) {
            assertEquals("Appointment cannot be set on Saturday.", ex.getMessage());
        }
    }

    @Test
    void testToString() {
        assertEquals("Appointment{id=null, patient=Patient{id=null, firstName='Alex', lastName='Ender', email='a@a.net', phone='1234', address='Fulda', dob=2023-02-05, insuranceProvider='BARMER'}, appointmentTime=2024-10-10T10:00}", appointment.toString());
    }
}