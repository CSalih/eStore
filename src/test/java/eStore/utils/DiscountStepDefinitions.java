package eStore.utils;

import eStore.pages.*;
import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.junit.Assert;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;

public class DiscountStepDefinitions {
    private WebDriver driver;
    private boolean discountSaved = false;

    @Before
    public void init() {
        String driverPath = SetupWebDriver.class.getClassLoader().getResource("chromedriver.exe").getFile();
        System.setProperty("webdriver.chrome.driver", driverPath);

        driver = new ChromeDriver();
    }

    @After
    public void tearDown() {
        if (driver != null) {
            driver.quit();
        }
    }

    @Given("logged in as {string}")
    public void logged_in_as(String username) {
        LoginPage loginPage = new LoginPage(driver);
        loginPage.login(username, "passwd");

        Assert.assertTrue(loginPage.isLoggedIn());
    }

    @Given("in {string} page")
    public void in_custom_page(String page) {
        switch (page) {
            case "discount":
                DiscountPage discountPage = new DiscountPage(driver);
                Assert.assertTrue(discountPage.isInDiscountPage());
                break;
            case "shopping cart":
                throw new NotImplementedException();
        }
    }

    @When("new discount added")
    public void new_discount_added() {
        DiscountPage discountPage = new DiscountPage(driver);
        discountSaved = discountPage.addDiscount(1,5, 0.20);
    }

    @Then("discount is saved")
    public void discount_is_saved() {
        Assert.assertTrue(discountSaved);
    }

    @Given("already assigned 3 discounts to product")
    public void already_assigned_discounts_to_product() {
        DiscountPage discountPage = new DiscountPage(driver);
        Assert.assertEquals(3, discountPage.getDiscountSize(1));
    }

    @Then("a error message pops up")
    public void a_error_message_pops_up() {
        DiscountPage discountPage = new DiscountPage(driver);
        Assert.assertTrue(discountPage.alertIsDisplayed());
    }

    @Then("discount is displayed")
    public void discount_is_displayed() {
        ViewProductPage viewProductPage = new ViewProductPage(driver, 1);
        Assert.assertTrue(viewProductPage.discountIsAvailable());
    }

    @Given("product with discount added to shopping cart")
    public void product_with_discount_added_to_shopping_cart() {
        ProductListPage productListPage = new ProductListPage(driver);
        Assert.assertTrue(productListPage.addToCart(1));
    }

    @Then("discount price and saved money displayed")
    public void discount_price_and_saved_money_displayed() {
        CartPage cartPage = new CartPage(driver);
        Assert.assertTrue(cartPage.discountApplied());
        Assert.assertTrue(cartPage.savedMoneyDisplayed());
    }
}
