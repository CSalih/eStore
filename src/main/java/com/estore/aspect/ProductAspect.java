package com.estore.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Aspect
public class ProductAspect {
    private static Logger log = LoggerFactory.getLogger(ProductAspect.class);

    @Before("execution(* com.estore.controller.admin.AdminProduct.deleteProduct(..))")
    public void logBefore(JoinPoint joinPoint) {
        log.debug("Called : " + joinPoint.getSignature().getName());

        Object[] args = joinPoint.getArgs();
        for (Object arg: args) {
            log.info("Deleting product with id: " + arg);
        }
    }


}
