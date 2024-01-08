package com.alogic.appointmentapp;

import ch.qos.logback.core.net.SyslogOutputStream;
import com.alogic.appointmentapp.appointment.Appointment;
import com.alogic.appointmentapp.appointment.AppointmentService;
import com.alogic.appointmentapp.patient.Patient;
import com.alogic.appointmentapp.patient.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Optional;

@Controller
public class HomeController {

    @Autowired
    private final PatientService patientService;

    private final AppointmentService appointmentService;

    public HomeController(PatientService patientService, AppointmentService appointmentService) {
        this.patientService = patientService;
        this.appointmentService = appointmentService;
    }

    @GetMapping("/")
    public String indexView() {
        return "base";
    }

    @GetMapping("/addpatient")
    public String addPatientsView() {
        return "addpatient";
    }

    @PostMapping("/submitpatient")
    public String setPatientView(@ModelAttribute Patient patient, Model model) {
        try {
            patientService.addNewPatient(patient);
            model.addAttribute("message", "Patient added successfully.");
        }
        catch (Exception ex) {
            model.addAttribute("message", "Invalid data for patient. " + ex.getMessage());
        }
        model.addAttribute("patients", patientService.getPatients());
        return "listpatients";
    }

    @GetMapping("/listpatients")
    public String listPatientsView(Model model) {
        model.addAttribute("patients", patientService.getPatients());
        return "listpatients";
    }

    @GetMapping("/addappointment")
    public String addAppointmentsView(Model model) {
        model.addAttribute("patients", patientService.getPatients());
        model.addAttribute("times", new AppointmentTime().getTimes());
        return "addappointment";
    }

    @PostMapping("/submitappointment")
    public String setAppointmentView(@RequestParam("patient") String patient_email, @RequestParam("date") String date, @RequestParam("time") String time, Model model) {
        try {
            Patient existingPatient = patientService.getPatientByEmail(patient_email);
            if(existingPatient != null) {
                appointmentService.addNewAppointment(existingPatient, LocalDate.parse(date), LocalTime.parse(time));
            }
            model.addAttribute("message", "Appointment added successfully.");
        }
        catch (Exception ex) {
            model.addAttribute("message", "Invalid data for appointment. " + ex.getMessage());
        }
        model.addAttribute("appointments", appointmentService.getAppointments());
        model.addAttribute("patients", patientService.getPatients());
        return "listappointments";
    }

    @GetMapping("/listappointments")
    public String listAppointmentsView(Model model) {
        model.addAttribute("appointments", appointmentService.getAppointments());
        return "listappointments";
    }
}
