package eStore.pages;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class ViewProductPage {

    private final WebDriver driver;

    public ViewProductPage(WebDriver driver, int id){
        this.driver = driver;
        driver.get("http://localhost:8080/product/viewProduct/" + id);
    }

    public boolean discountIsAvailable() {
        WebElement element =  new WebDriverWait(driver, 5)
                .until(ExpectedConditions.presenceOfElementLocated(By.xpath("//a[contains(.,'  Discount')]")));

        return element != null;
    }
}
