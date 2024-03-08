package vn.io.datvutech.beatbuddy.api.config;

import org.springframework.context.annotation.Configuration;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Contact;
import io.swagger.v3.oas.annotations.info.Info;
import io.swagger.v3.oas.annotations.servers.Server;

@OpenAPIDefinition(

        info = @Info(

                title = "Beat Buddy API", contact = @Contact(email = "vutien.dat.3601@gmail.com"),

                version = "1.0.0"

        ),

        servers = @Server(url = "https://bbapi.datvu.tech/api")

)
@Configuration
public class OpenApiConfig {

}
