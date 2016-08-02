package com.ttyhuo.common;

import com.google.common.collect.Sets;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import static springfox.documentation.builders.PathSelectors.regex;

/**
 * swagger2  能够根据 rest接口 生成 api 文档 </br>
 * profile = dev 时生成
 * 指定 profile 方式 : </br>
 * 1 jvm 添加 参数 ： -Dspring.profiles.active=dev </br>
 * 2 环境变量 exprot spring.profiles.active=dev </br>
 * 3 web.xml 添加  <context-param> <param-name>spring.profiles.active</param-name> <param-value>proc</param-value> </context-param> </br>
 * 4 其他参考 servlet3.0 指定profile方法 目前工程采用的是servlet 2.5 </br>
 */
@Configuration
@EnableSwagger2
@EnableWebMvc
@Profile("dev")
public class Swagger2WebConfig extends WebMvcConfigurerAdapter {
    
    private static final Logger LOGGER= LoggerFactory.getLogger(Swagger2WebConfig.class);


    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        LOGGER.info("swagger2 init...");
        registry.addResourceHandler("swagger-ui.html")
                .addResourceLocations("classpath:/META-INF/resources/");

        registry.addResourceHandler("/webjars/**")
                .addResourceLocations("classpath:/META-INF/resources/webjars/");
    }

    //group:default
    @Bean
    public Docket configSpringfoxDocketForAll() {
        return new Docket(DocumentationType.SWAGGER_2)
                .produces(Sets.newHashSet("application/json"))
                .consumes(Sets.newHashSet("application/json"))
                .protocols(Sets.newHashSet("http", "https"))
                .forCodeGeneration(true)
                .select()
                .paths(regex(".*"))
//                .paths(Predicates.not(PathSelectors.regex("*_pay")))
                .build().enable(true)
                .apiInfo(apiInfo());
    }
    //group:purse
    @Bean
    public Docket configSpringfoxDocketForMoment() {
        return new Docket(DocumentationType.SWAGGER_2)
                .groupName("purse")
                .produces(Sets.newHashSet("application/json"))
                .consumes(Sets.newHashSet("application/json"))
                .protocols(Sets.newHashSet("http", "https"))
                .forCodeGeneration(true)
                .select()
                .apis(RequestHandlerSelectors.basePackage("com.purse.controller"))
                .paths(PathSelectors.any())
                .build()
                .apiInfo(apiInfo());
    }

    private ApiInfo apiInfo() {
        ApiInfo apiInfo = new ApiInfo(
                "API Document",
                "API Document with swagger",
                "1.0.0",
                "only work in dev or test server,no proc server",
                "dev@ttyhuo.cn",
                null,
                null
        );
        return apiInfo;
    }
}
