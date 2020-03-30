package eStore.pages;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class CartPage {
    private final WebDriver driver;

    public CartPage(WebDriver driver) {
        this.driver = driver;
        driver.get("http://localhost:8080/eStore/customer/cart");
    }

    public WebElement checkoutOrder() {
        new WebDriverWait(driver, 5)
                .until(ExpectedConditions.elementToBeClickable(By.xpath("//a[contains(@href, \'/eStore/customer/cart\')]")))
                .click();
        new WebDriverWait(driver, 5)
                .until(ExpectedConditions.elementToBeClickable(By.xpath("//a[contains(text(),\'Checkout\')]")))
                .click();
        new WebDriverWait(driver, 5)
                .until(ExpectedConditions.elementToBeClickable(By.name("_eventId_customerInfoCollected")))
                .click();
        new WebDriverWait(driver, 5)
                .until(ExpectedConditions.elementToBeClickable(By.name("_eventId_shippingDetailCollected")))
                .click();
        new WebDriverWait(driver, 5)
                .until(ExpectedConditions.elementToBeClickable(By.name("_eventId_orderConfirmed")))
                .click();


        WebElement elements = driver.findElement(By.xpath("//h2[contains(.,\'Thank you for your business!\')]"));
        new WebDriverWait(driver, 5)
                .until(ExpectedConditions.visibilityOf(elements));

        return elements;
    }

}
