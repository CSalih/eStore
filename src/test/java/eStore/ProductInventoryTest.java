package eStore;

import eStore.utils.SetupWebDriver;
import eStore.pages.LoginPage;
import eStore.pages.ProductInventoryPage;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;


@Ignore
public class ProductInventoryTest extends SetupWebDriver {

    @BeforeClass
    public static void login() throws Exception {
        LoginPage page = new LoginPage(driver);
        page.login("admin", "passwd");
    }

    @Test
    public void productInventoryEditTest() {
        int row = 1;
        String newProductName = "NewProductName";
        ProductInventoryPage page = new ProductInventoryPage(driver);
        page.editProductName(row, newProductName);
        String newName = page.getProductName(row);

        Assert.assertEquals(newProductName, newName);
    }

    @Test
    public void productInventoryDelete() {
        int row = 1;
        ProductInventoryPage page = new ProductInventoryPage(driver);

        int oldRowCount = page.getRowCount();
        page.delete(row);
        int newRowCount = page.getRowCount();
        Assert.assertEquals(oldRowCount - 1, newRowCount);
    }
}
