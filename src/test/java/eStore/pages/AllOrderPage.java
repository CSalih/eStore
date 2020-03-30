package eStore.pages;

import eStore.utils.DataTable;
import org.openqa.selenium.WebDriver;

public class AllOrderPage {
    private final WebDriver driver;

    public AllOrderPage(WebDriver driver) {
        this.driver = driver;
        driver.get("http://localhost:8080/eStore/admin/allOrders");
    }

    public int getRowCount() {
        return DataTable.getRowCount(driver);
    }

}
