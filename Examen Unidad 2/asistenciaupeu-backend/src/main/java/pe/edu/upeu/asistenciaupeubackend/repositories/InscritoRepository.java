/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package pe.edu.upeu.asistenciaupeubackend.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pe.edu.upeu.asistenciaupeubackend.models.Inscrito;

/**
 *
 * @author DELL
 */
@Repository
public interface InscritoRepository extends JpaRepository<Inscrito, Long>{
    
}
