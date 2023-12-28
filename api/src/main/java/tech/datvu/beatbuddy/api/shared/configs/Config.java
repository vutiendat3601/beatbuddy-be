package tech.datvu.beatbuddy.api.shared.configs;

import java.util.concurrent.Executor;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.data.redis.RedisProperties;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.connection.RedisStandaloneConfiguration;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.GenericJackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.web.client.RestTemplate;

@EnableAsync
@EnableCaching
@Configuration
public class Config {
    @Value("${spring.data.redis.host}")
    private String redisHort;

    @Value("${spring.data.redis.port}")
    private int redisPort;

    @Value("${spring.data.redis.password}")
    private String redisPassword;

    @Bean
    RedisConnectionFactory redisConnectionFactory(RedisProperties redisProps) {
        RedisStandaloneConfiguration redisConfigs = new RedisStandaloneConfiguration();
        redisConfigs.setHostName(redisProps.getHost());
        redisConfigs.setPort(redisProps.getPort());
        return new JedisConnectionFactory(redisConfigs);
    }

    @Bean
    RedisTemplate<String, ?> redisTemplate(RedisConnectionFactory connectionFactory) {
        RedisTemplate<String, ?> redisTemplate = new RedisTemplate<>();
        redisTemplate.setConnectionFactory(connectionFactory);

        GenericJackson2JsonRedisSerializer jackson2JsonRedisSerializer = new GenericJackson2JsonRedisSerializer();

        redisTemplate.setKeySerializer(new StringRedisSerializer());
        redisTemplate.setValueSerializer(jackson2JsonRedisSerializer);
        redisTemplate.setHashKeySerializer(new StringRedisSerializer());
        redisTemplate.setHashValueSerializer(jackson2JsonRedisSerializer);

        redisTemplate.afterPropertiesSet();
        return redisTemplate;
    }

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

    @Bean
    RestTemplate restTemplate() {
        return new RestTemplate();
    }
}
