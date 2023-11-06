/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.upeu.asistenciaupeubackend.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pe.edu.upeu.asistenciaupeubackend.exceptions.AppException;

import pe.edu.upeu.asistenciaupeubackend.exceptions.ResourceNotFoundException;

import pe.edu.upeu.asistenciaupeubackend.models.Leche;
import pe.edu.upeu.asistenciaupeubackend.repositories.LecheRepository;

/**
 *
 * @author DELL
 */
@RequiredArgsConstructor
@Service
@Transactional
public class LecheServiceImp implements LecheService {

    @Autowired
    private LecheRepository lecheRepo;

    @Override
    public Leche save(Leche leche) {

        try {
            return lecheRepo.save(leche);
        } catch (Exception e) {
            throw new AppException("Error-" + e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    @Override
    public List<Leche> findAll() {
        try {
            return lecheRepo.findAll();
        } catch (Exception e) {
            throw new AppException("Error-" + e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    @Override
    public Map<String, Boolean> delete(Long id) {
        Leche lechex = lecheRepo.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("leche not exist with id :" + id));

        lecheRepo.delete(lechex);
        Map<String, Boolean> response = new HashMap<>();
        response.put("deleted", true);

        return response;
    }

    @Override
    public Leche getLecheById(Long id) {
        Leche findleche = lecheRepo.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("leche not exist with id :" + id));
        return findleche;
    }

    @Override
    public Leche update(Leche leche, Long id) {
        Leche lechex = lecheRepo.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Periodo not exist with id :" + id));
        lechex.setFecha(leche.getFecha());
        lechex.setLitrosLeche(leche.getLitrosLeche());
        lechex.setTurno(leche.getTurno());
        lechex.setFechaCreacion(leche.getFechaCreacion());
        lechex.setFechaActualizacion(leche.getFechaActualizacion());
        return lecheRepo.save(lechex);
    }

}
