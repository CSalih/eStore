package eStore;

import static org.junit.Assert.assertNotNull;

import com.estore.model.Customer;
import com.estore.service.CustomerService;
import com.estore.service.ProductService;
import org.junit.Assert;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.estore.service.CustomerOrderService;

import java.util.List;

@Ignore
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"/applicationTestContext.xml"})
@Transactional
public class ServiceTest {

   @Autowired
   CustomerOrderService customerOrderService;

   @Autowired
   private CustomerService customerService;

   @Autowired
   private ProductService productService;

   @Test
   public void junitTestSetupWorks() {
      assertNotNull(customerOrderService);
   }

   @Test
   public void testDbInit() {
      List<Customer> list = customerService.getAllCustomers();

      Assert.assertEquals(1, list.size());
   }

   /**
    * Calculates the sum of all products
    */
   @Test
   public void totalStockValueTest() {
      double expected = 1249390.0;
      double actual = productService.calculateTotalStockValue();
      double precision = 0.05;

      Assert.assertEquals(expected, actual, precision);
   }
}