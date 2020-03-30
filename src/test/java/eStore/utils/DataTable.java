package eStore.utils;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

public class DataTable {

    public static int getRowCount(WebDriver driver) {
        String xpath = "//table[@id='DataTables_Table_0']/tbody/tr";
        return driver.findElements(By.xpath(xpath)).size();
    }

    public static int getColumnCount(WebDriver driver) {
        return driver.findElements(By.xpath("//table[@id='DataTables_Table_0']/tbody/tr/td")).size();
    }
}
