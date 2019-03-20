package eStore;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.estore.service.CustomerOrderService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"/applicationTestContext.xml"})
@Transactional
public class ServiceTest {

   @Autowired
   CustomerOrderService customerOrderService;
   
   @Test
   public void junitTestSetupWorks(){
	   assertNotNull(customerOrderService);
   }   

}
