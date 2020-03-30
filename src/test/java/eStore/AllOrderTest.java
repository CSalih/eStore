package eStore;

import eStore.pages.AllOrderPage;
import eStore.pages.LoginPage;
import eStore.utils.SetupWebDriver;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;
import org.openqa.selenium.WebElement;

import static org.junit.Assert.assertNotNull;

public class AllOrderTest extends SetupWebDriver {

    @BeforeClass
    public static void login() {
        LoginPage page = new LoginPage(driver);
        page.login("test", "passwd");
    }

    @Test
    public void createOrderTest() {
        AllOrderPage page = new AllOrderPage(driver);

        String message = page.addToCart();
        Assert.assertEquals(message, "Product successfully added to the cart!");

        WebElement element = page.checkoutOrder();
        Assert.assertEquals(element, "Thank you for your business!");
    }

    @Test
    public void orderInOverviewTest() {
        int expected = 1;
        LoginPage loginPage = new LoginPage(driver);
        loginPage.login("admin", "passwd");

        AllOrderPage page = new AllOrderPage(driver);

        Assert.assertEquals(expected, page.getRowCount());
    }
}
