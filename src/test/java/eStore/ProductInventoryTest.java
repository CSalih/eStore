package eStore;

import eStore.utils.SetupWebDriver;
import eStore.pages.LoginPage;
import eStore.pages.ProductInventoryPage;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"/applicationTestContext.xml"})
public class ProductInventoryTest extends SetupWebDriver {

    protected static WebDriver driver;


    @BeforeClass
    public static void login() throws Exception {
        LoginPage page = new LoginPage(driver);
        page.login("admin", "passwd");
    }

    @Test
    public void productInventoryEditTest() {
        int row = 1;
        String newProductName = "NewProductName";
        ProductInventoryPage page = new ProductInventoryPage(driver);
        page.editProductName(row, newProductName);
        String newName = page.getProductName(row);

        Assert.assertEquals(newProductName, newName);
    }

    @Test
    public void productInventoryDelete() {
        ProductInventoryPage page = new ProductInventoryPage(driver);
        int row = 1;
        page.delete(row);

        int oldRowCount = page.getRowCount();
        WebElement element = driver.findElement(By.xpath("//table[@id='DataTables_Table_0']/tbody/tr/td[6]"));
        int newRowCount = page.getRowCount();
        Assert.assertEquals(oldRowCount - 1, newRowCount);
    }
}
