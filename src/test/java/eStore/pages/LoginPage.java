package eStore.pages;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

public class LoginPage {
    private final WebDriver driver;

    private By usernameBy = By.id("username");
    private By passwordBy = By.id("password");
    private By signinBy = By.xpath("//input[@value=\'Submit\']");

    public LoginPage(WebDriver driver){
        this.driver = driver;
    }

    /**
     * Login as valid user
     *
     * @param userName
     * @param password
     * @return HomePage object
     */
    public void login(String userName, String password) {
        driver.get("http://localhost:8080/eStore/login/");
        driver.findElement(usernameBy).sendKeys(userName);
        driver.findElement(passwordBy).sendKeys(password);
        driver.findElement(signinBy).click();
    }
}
