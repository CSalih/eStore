package eStore.pages;

import eStore.utils.DataTable;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

public class ProductInventoryPage {

    private final WebDriver driver;

    public ProductInventoryPage(WebDriver driver) {
        this.driver = driver;
        driver.get("http://localhost:8080/eStore/admin/productInventory");
    }

    /**
     * Chages the product name
     * @param row The productId
     * @param newProductName The new name
     */
    public void editProductName(int row, String newProductName) {
        WebElement editIcon = getAction(row, 3);
        editIcon.click();

        // Change product name
        driver.findElement(By.id("name")).clear();
        driver.findElement(By.id("name")).sendKeys(newProductName);
        driver.findElement(By.xpath("//input[@value='Submit']")).click();
    }

    public void delete(int row) {
        WebElement deleteIcon = getAction(row, 3);
        deleteIcon.click();
    }

    public String getProductName(int row) {
        int nameColumn = 2;
        WebElement element = getCell(row, nameColumn);
        return element.getText();
    }

    /**
     * 1 .. Image
     * 2 .. Productname
     * 
     */
    private WebElement getCell(int row, int column) {
        String xpath = String.format("//table[@id='DataTables_Table_0']/tbody/tr[%d]/td[%d]", row, column);
        return driver.findElement(By.xpath(xpath));
    }


    /**
     * @param row row of the table
     * @param type 1 .. Information, 2 .. Delete, 3 .. Edit
     * @return The Action Element
     */
    private WebElement getAction(int row, int type) {
        int column = 6;
        String xpath = String.format("//table[@id='DataTables_Table_0']/tbody/tr[%d]/td[%d]/a[%d]/span",
                row, column, type);
        return driver.findElement(By.xpath(xpath));
    }

    public int getRowCount() {
        return DataTable.getRowCount(driver);
    }
}
