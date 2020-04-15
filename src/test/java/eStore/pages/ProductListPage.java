package eStore.pages;

import eStore.utils.DataTable;
import org.openqa.selenium.*;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

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

        new WebDriverWait(driver, 5)
                .until(ExpectedConditions.elementToBeClickable(By.cssSelector("input")))
                .sendKeys("AirPods");

        // Todo: Wait for it
        List<WebElement> elements = driver.findElements(By.xpath("//td[contains(.,\'" + testProd + "\')]"));
        return  elements.size();
    }

    public Alert addToCart(int row) {
        String xpath = String.format("//table[@id=\'DataTables_Table_0\']/tbody/tr[%d]/td[6]/a[1]/span", row);

        new WebDriverWait(driver, 5)
                .until(ExpectedConditions.elementToBeClickable(By.xpath(xpath)))
                .click();

        try {
            // Still with WebDriverWait not working
            Thread.sleep(500);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        new WebDriverWait(driver, 5)
                .until(ExpectedConditions.elementToBeClickable(By.xpath("//a[contains(.,'Order Now')]")))
                .click();

        return new WebDriverWait(driver, 5)
                .ignoring(NoAlertPresentException.class)
                .until(ExpectedConditions.alertIsPresent());
    }

    public int getRowCount() {
        return DataTable.getRowCount(driver);
    }

    public boolean isInProductListPage() {
        WebElement element =  new WebDriverWait(driver, 5)
                .until(ExpectedConditions.presenceOfElementLocated(By.xpath("//h2[contains(.,'All Products')]")));

        return element != null;
    }
}