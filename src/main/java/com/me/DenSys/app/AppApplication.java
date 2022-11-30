package com.me.DenSys.app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@SpringBootApplication//(exclude = {DataSourceAutoConfiguration.class })
@EnableWebMvc
//@EntityScan(basePackages = {"com.me.DenSys.app.entities"})  // scan JPA entities
public class AppApplication {
	//comment by me nnd  bb
	public static void main(String[] args) {
		SpringApplication.run(AppApplication.class, args);
	}


}
