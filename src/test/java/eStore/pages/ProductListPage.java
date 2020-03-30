package eStore.pages;

import eStore.utils.DataTable;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.util.List;

/**
 * Product Page
 *
 * @author Salih Candir
 */
public class ProductListPage {
    private final WebDriver driver;

    public ProductListPage(WebDriver driver){
        this.driver = driver;
        driver.get("http://localhost:8080/eStore/product/productList/all");
    }

    public int searchProduct(String testProd) {
        driver.findElement(By.cssSelector("input")).sendKeys("AirPods");
        List<WebElement> elements = driver.findElements(By.xpath("//td[contains(.,\'" + testProd + "\')]"));
        return  elements.size();
    }

    public int getRowCount() {
        return DataTable.getRowCount(driver);
    }
}