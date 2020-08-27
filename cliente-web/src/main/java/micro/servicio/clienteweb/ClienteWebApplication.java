package micro.servicio.clienteweb;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@EnableEurekaClient
@SpringBootApplication
public class ClienteWebApplication {

    public static void main(String[] args) {
        SpringApplication.run(ClienteWebApplication.class, args);
    }
}
