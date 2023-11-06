/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package pe.edu.upeu.asistenciaupeubackend.mappers;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import pe.edu.upeu.asistenciaupeubackend.dtos.LecheDto;
import pe.edu.upeu.asistenciaupeubackend.models.Leche;

/**
 *
 * @author DELL
 */
@Mapper(componentModel = "spring")
public interface LecheMapper {
    LecheDto toLecheDto(Leche entidad);

    // @Mapping(target = "id", ignore = true)
    @Mapping(target = "id", ignore = true)
    Leche lecheCrearDtoToLeche(LecheDto.LecheCrearDto entidadCrearDto);
}
