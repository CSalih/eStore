package eStore;

import static org.junit.Assert.assertNotNull;

import com.estore.model.Customer;
import com.estore.service.CustomerService;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.estore.service.CustomerOrderService;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"/applicationTestContext.xml"})
@Transactional
public class ServiceTest {

   @Autowired
   CustomerOrderService customerOrderService;

   @Autowired
   private CustomerService customerService;

   @Test
   public void junitTestSetupWorks() {
      assertNotNull(customerOrderService);
   }

   @Test
   public void testDbInit() {
      List<Customer> list = customerService.getAllCustomers();

      Assert.assertEquals(1, list.size());
   }
}