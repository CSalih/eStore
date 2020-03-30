package eStore.utils;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

import java.util.concurrent.TimeUnit;

public abstract class SetupWebDriver {
    protected static WebDriver driver;


    @BeforeClass
    public static void setUp() throws Exception {
        String driverPath = SetupWebDriver.class.getClassLoader().getResource("chromedriver.exe").getFile();
        System.setProperty("webdriver.chrome.driver", driverPath);

        driver = new ChromeDriver();
        driver.get("http://localhost:8080/eStore");

        driver.manage().timeouts().implicitlyWait(100, TimeUnit.MILLISECONDS);
    }

    @AfterClass
    public static void tearDown() throws Exception {
        if (driver != null) {
            driver.quit();
        }
    }
}
