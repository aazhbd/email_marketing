package com.alogic.appointmentapp.patient;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;
import java.time.Month;

import static org.junit.jupiter.api.Assertions.*;

class PatientTest {
    private Patient patient;

    @BeforeEach
    void setUp() {
        patient = new Patient("Alex", "Ender", "a@a.net", "1234", "Fulda",
                LocalDate.of(2023, Month.FEBRUARY, 5), "BARMER"
        );
    }

    @Test
    void getFullName() {
        assertEquals("Alex Ender", patient.getFullName());
    }

    @Test
    void getFirstName() {
        assertEquals("Alex", patient.getFirstName());
    }

    @Test
    void setFirstName() {
        patient.setFirstName("Alexander");
        assertEquals("Alexander", patient.getFirstName());
    }

    @Test
    void getLastName() {
        assertEquals("Ender", patient.getLastName());
    }

    @Test
    void setLastName() {
        patient.setLastName("Thatcher");
        assertEquals("Thatcher", patient.getLastName());
    }

    @Test
    void getEmail() {
        assertEquals("a@a.net", patient.getEmail());
    }

    @Test
    void setEmail() {
        patient.setEmail("b@a.com");
        assertEquals("b@a.com", patient.getEmail());
    }

    @Test
    void getPhone() {
        assertEquals("1234", patient.getPhone());
    }

    @Test
    void setPhone() {
        patient.setPhone("9876");
        assertEquals("9876", patient.getPhone());
    }

    @Test
    void getAddress() {
        assertEquals("Fulda", patient.getAddress());
    }

    @Test
    void setAddress() {
        patient.setAddress("Berlin");
        assertEquals("Berlin", patient.getAddress());
    }

    @Test
    void getDob() {
        assertEquals("2023-02-05", patient.getDob().toString());
    }

    @Test
    void setDob() {
        patient.setDob(LocalDate.of(2023, Month.FEBRUARY, 6));
        assertEquals(LocalDate.of(2023, Month.FEBRUARY, 6), patient.getDob());
    }

    @Test
    void getInsuranceProvider() {
        assertEquals("BARMER", patient.getInsuranceProvider());
    }

    @Test
    void setInsuranceProvider() {
        patient.setInsuranceProvider("AOK");
        assertEquals("AOK", patient.getInsuranceProvider());
    }

    @Test
    void testToString() {
        assertEquals("Patient{id=null, firstName='Alex', lastName='Ender', email='a@a.net', phone='1234', address='Fulda', dob=2023-02-05, insuranceProvider='BARMER'}", patient.toString());
    }
}