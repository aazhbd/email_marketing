package com.alogic.appointmentapp.patient;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.Month;
import java.util.List;
import java.util.Optional;

@Service
public class PatientService {

    private final PatientRepository patientRepository;

    @Autowired
    public PatientService(PatientRepository patientRepository) {
        this.patientRepository = patientRepository;
    }

    public List<Patient> getPatients(){
        return patientRepository.findAll();
    }

    public void addNewPatient(Patient patient) {
        Optional<Patient> inputPatient = patientRepository.findPatientByEmail(patient.getEmail());
        if(inputPatient.isPresent()) {
            throw new IllegalStateException("Email already exists.");
        }
        patientRepository.save(patient);
    }

    public void deletePatient(Long id) {
        if(!patientRepository.existsById(id)) {
            throw new IllegalStateException("Patient doesn't exist.");
        }
        patientRepository.deleteById(id);
    }
}
