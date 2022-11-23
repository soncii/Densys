package com.me.DenSys.app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@SpringBootApplication//(exclude = {DataSourceAutoConfiguration.class })
@EntityScan(basePackages = {"com.me.DenSys.app.entities."})  // scan JPA entities
public class AppApplication {
	//comment by me nnd  bb
	public static void main(String[] args) {
		SpringApplication.run(AppApplication.class, args);
	}


}
