package eStore.pages;

import eStore.utils.DataTable;
import org.junit.Assert;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.util.List;

public class AllOrderPage {
    private final WebDriver driver;

    public AllOrderPage(WebDriver driver) {
        this.driver = driver;
        driver.get("http://localhost:8080/eStore/product/productList/all");
    }

    public String addToCart() {
        driver.findElement(By.xpath("//table[@id=\'DataTables_Table_0\']/tbody/tr[1]/td[6]/a[1]/span")).click();
        driver.findElement(By.linkText("Order Now")).click();
        return driver.switchTo().alert().getText();
    }

    public WebElement checkoutOrder() {
        driver.findElement(By.xpath("//a[contains(@href, \'/eStore/customer/cart\')]")).click();
        driver.findElement(By.xpath("//a[contains(text(),\'Checkout\')]")).click();
        driver.findElement(By.name("_eventId_customerInfoCollected")).click();
        driver.findElement(By.name("_eventId_shippingDetailCollected")).click();
        driver.findElement(By.name("_eventId_orderConfirmed")).click();
        WebElement elements = driver.findElement(By.xpath("//h2[contains(.,\'Thank you for your business!\')]"));
        return elements;
    }

    public int getRowCount() {
        return DataTable.getRowCount(driver);
    }

}
