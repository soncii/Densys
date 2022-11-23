package com.me.DenSys.app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication//(exclude = {DataSourceAutoConfiguration.class })
public class AppApplication {
	//comment by me nnd  bb
	public static void main(String[] args) {
		SpringApplication.run(AppApplication.class, args);
	}

}
