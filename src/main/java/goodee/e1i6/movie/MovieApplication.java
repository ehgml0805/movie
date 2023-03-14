package goodee.e1i6.movie;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;
@EnableScheduling
@ServletComponentScan /* 웹필터(애노테이션) 사용 가능하도록 */
@SpringBootApplication
public class MovieApplication {
	
	public static void main(String[] args) {
		SpringApplication.run(MovieApplication.class, args);
	}

}
