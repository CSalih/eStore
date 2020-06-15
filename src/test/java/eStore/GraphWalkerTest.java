package eStore;

import eStore.pages.CartPage;
import eStore.pages.LoginPage;
import eStore.pages.ProductListPage;
import eStore.utils.SetupWebDriver;
import org.graphwalker.core.machine.ExecutionContext;
import org.graphwalker.java.annotation.AfterExecution;
import org.graphwalker.java.annotation.GraphWalker;
import org.junit.Assert;
import org.junit.Ignore;
import org.openqa.selenium.Alert;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;



@Ignore
@GraphWalker(value = "random(reached_vertex(CartPage))", start = "LoginPage")
public class GraphWalkerTest extends ExecutionContext implements AddToCart {
    private static WebDriver driver;

    private boolean addedToCart;
    private CartPage cartPage;
    private LoginPage loginPage;
    private ProductListPage productListPage;

    public GraphWalkerTest() {
        String driverPath = SetupWebDriver.class.getClassLoader().getResource("chromedriver.exe").getFile();
        System.setProperty("webdriver.chrome.driver", driverPath);

        driver = new ChromeDriver();
    }


    @Override
    public void viewCartPage() {
        cartPage = new CartPage(driver);
    }

    @Override
    public void viewProductListPage() {
        productListPage = new ProductListPage(driver);
    }

    @Override
    public void addToCart() {
        addedToCart = productListPage.addToCart(1);
    }

    @Override
    public void login() {
        loginPage.login("test", "passwd");
    }

    @Override
    public void ProductListPage() {
        Assert.assertTrue(productListPage.isInProductListPage());
    }

    @Override
    public void CartPage() {
        Assert.assertTrue(cartPage.isInCartPage());
    }

    @Override
    public void LoginPage() {
        loginPage = new LoginPage(driver);
        Assert.assertTrue(loginPage.isInLoginPage());
    }

    @Override
    public void LoggedIn() {
        Assert.assertTrue(loginPage.isLoggedIn());
    }

    @Override
    public void AddedToCart() {
        Assert.assertTrue(addedToCart);
    }

    @AfterExecution
    public void tearDown() {
        if (driver != null) {
            driver.quit();
        }
    }
}
