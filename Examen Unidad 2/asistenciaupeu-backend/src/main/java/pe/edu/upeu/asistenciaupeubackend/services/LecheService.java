package pe.edu.upeu.asistenciaupeubackend.services;

import java.util.List;
import java.util.Map;

import pe.edu.upeu.asistenciaupeubackend.models.Leche;

/**
 *
 * @author DELL
 */
public interface LecheService {
    Leche save(Leche leche);

    List<Leche> findAll();

    Map<String, Boolean> delete(Long id);

    Leche getLecheById(Long id);

    Leche update(Leche leche, Long id);
}
