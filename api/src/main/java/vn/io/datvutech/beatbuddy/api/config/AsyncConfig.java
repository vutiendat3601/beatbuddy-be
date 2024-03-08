package vn.io.datvutech.beatbuddy.api.config;

import java.util.concurrent.Executor;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

@EnableAsync
@Configuration
public class AsyncConfig {
    @Bean
    Executor backgroundTask() {
        ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
        executor.setCorePoolSize(5); // ## Set the number of threads
        executor.setMaxPoolSize(50); // ## Set the maximum number of threads
        executor.setQueueCapacity(10); // ## Set the queue capacity
        executor.setThreadNamePrefix("BackgroundTask-");
        executor.initialize();
        return executor;
    }
}
