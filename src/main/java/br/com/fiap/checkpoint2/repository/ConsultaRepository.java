package br.com.fiap.checkpoint2.repository;

import br.com.fiap.checkpoint2.model.Consulta;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ConsultaRepository extends JpaRepository<Consulta, Long> {

//    List<Consulta> findByStatusAndDataBetween(StatusConsulta status, LocalDate dataInicio, LocalDate dataFim);


}
