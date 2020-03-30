package eStore.utils;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public abstract class SetupWebDriver {
    protected static WebDriver driver;


    @BeforeClass
    public static void setUp() throws Exception {
        String driverPath = SetupWebDriver.class.getClassLoader().getResource("chromedriver.exe").getFile();
        System.setProperty("webdriver.chrome.driver", driverPath);

        driver = new ChromeDriver();
        driver.get("http://localhost:8080/eStore");
    }

    @AfterClass
    public static void tearDown() throws Exception {
        if (driver != null) {
            driver.quit();
        }
    }
}
