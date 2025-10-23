package br.com.fiap.checkpoint2;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;

@SpringBootTest
@TestPropertySource(properties = { "spring.datasource.url=jdbc:h2:mem:db_microservices",
		"spring.datasource.driverClassName=org.h2.Driver", "spring.datasource.username=sa", "spring.datasource.password=",
		"spring.jpa.database-platform=org.hibernate.dialect.H2Dialect"
})
class Checkpoint2ApplicationTests {

	@Test
	void contextLoads() {
	}

}
