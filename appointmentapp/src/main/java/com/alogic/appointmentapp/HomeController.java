package com.alogic.appointmentapp;

import com.alogic.appointmentapp.patient.Patient;
import com.alogic.appointmentapp.patient.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class HomeController {

    @Autowired
    private final PatientService patientService;

    public HomeController(PatientService patientService) {
        this.patientService = patientService;
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
    public String addAppointmentsView() {
        return "addappointment";
    }

    @GetMapping("/listappointments")
    public String listAppointmentsView() {
        return "listappointments";
    }
}
