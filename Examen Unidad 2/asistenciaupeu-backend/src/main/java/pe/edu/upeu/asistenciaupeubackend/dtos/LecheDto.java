package pe.edu.upeu.asistenciaupeubackend.dtos;

import java.time.LocalDate;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class LecheDto {
    Long id;

    @JsonFormat(pattern = "yyyy-MM-dd")
    LocalDate fecha;

    Double litrosLeche;

    String turno;

    @JsonFormat(pattern = "yyyy-MM-dd")
    LocalDate fechaCreacion;

    @JsonFormat(pattern = "yyyy-MM-dd")
    LocalDate fechaActualizacion;

    String finca;

    String ganado;

    public record LecheCrearDto(
            Long id, LocalDate fecha,
            String litrosLeche, String turno,
            LocalDate fechaCreacion, LocalDate fechaActualizacion, String finca, String ganado) {
    }
}
