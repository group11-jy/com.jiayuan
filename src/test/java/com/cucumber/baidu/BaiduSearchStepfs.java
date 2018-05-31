package com.cucumber.baidu;

import java.util.concurrent.TimeUnit;

import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class BaiduSearchStepfs {

	private WebDriver driver;

	@Given("^Go to user select$")
	public void go_to_baidu_home() throws Exception {
		System.setProperty("webdriver.chrome.driver",
				"F:/geckodriver-v0.9.0-win64/chromedriver_win32/chromedriver.exe");
		ChromeOptions options = new ChromeOptions();
		options.setBinary("C:/Users/DELL/AppData/Local/Google/Chrome/Application/chrome.exe");
		driver = new ChromeDriver();
		driver.manage().window().maximize();
		driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
		driver.get("http://localhost:8080/com.jiayuan");
	}

	@When("^I find movie")
	public WebElement i_find_movie() {
		WebDriverWait wait = new WebDriverWait(driver, 10);
		WebElement element = wait
				.until(ExpectedConditions.visibilityOf(driver.findElement(By.xpath("//div[@id='legend']/legend"))));

		return element;
	}

	@And("^select the userID \"([^\"]*)\"$")
	public void select_the_userID(String userID) throws Throwable {
		Select select_province = new Select(driver.findElement(By.id("userid")));

		select_province.selectByVisibleText(userID);
	}

	@And("^Click the submit$")
	public void click_the_submit() {
		driver.findElement(By.id("tj")).click();
	}

	@Then("^goto the index")
	public void goto_the_index() throws InterruptedException {
		Thread.sleep(10000);
		Assert.assertEquals("电影主页", driver.getTitle());
		driver.close();
		driver.quit();
	}
}
