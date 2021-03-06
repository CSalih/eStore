package eStore;

import eStore.pages.AllOrderPage;
import eStore.pages.CartPage;
import eStore.pages.LoginPage;
import eStore.pages.ProductListPage;
import eStore.utils.SetupWebDriver;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.openqa.selenium.WebElement;

@Ignore
public class AllOrderTest extends SetupWebDriver {

    @BeforeClass
    public static void login() {
        LoginPage page = new LoginPage(driver);
        page.login("test", "passwd");
    }

    @Test
    public void createOrderTest() {
        ProductListPage page = new ProductListPage(driver);
        Assert.assertTrue(page.addToCart(1));

        CartPage cartPage = new CartPage(driver);
        WebElement element = cartPage.checkoutOrder();
        Assert.assertEquals("Thank you for your business!", element.getText());
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
