const {Given} = require('cucumber');
const {When} = require('cucumber');
const {Then} = require('cucumber');
const {expect} = require('chai');

Given('I refresh page', () => {
    browser.refresh();
});

Given('I go to losestudiantes home screen', () => {
    browser.url('/uniandes/');
    if($('button=Cerrar').isDisplayed()) {
        $('button=Cerrar').click();
    }
});

When('I open the login screen', () => {
    $('button.loginButton').waitForExist(5000);
    $('button.loginButton').waitForDisplayed(5000);
    $('button.loginButton').click();
});

When('I click in register', () => {
    const text = $('a=Regístrate');
    text.waitForExist(20000);
    text.waitForDisplayed(20000);
    text.click();
});

When('I fill a wrong email and password', () => {
    const cajaLogIn = $('.cajaLogIn');

    const mailInput = $('input[name="email"]');
    mailInput.click();
    mailInput.setValue('wrongemail@example.com');

    const passwordInput = $('input[name="password"]');
    passwordInput.click();
    passwordInput.setValue('123467891');
});


When(/^I fill the fields with id (.*) and (.*)$/, (search, name) => {
    const nameItem = $('input[name='+ search + ']');
    nameItem.waitForExist(5000);
    nameItem.waitForDisplayed(5000);
    nameItem.click();
    nameItem.setValue(name);
});

When('I click on checkBox in register', () => {
    const checkBox = $('input[name="accept"]');
    checkBox.click();
});

When(/^I check the border color with (.*) and (.*)$/, (search, border) => {
    const elem = $(search)
    const color = elem.getCSSProperty('border-color')
    expect(color.parsed.hex).to.include(border);
});

When('I click on button to register', () => {
    $('button=Registrarse').click();
});

Then(/^I expect to see in register with (.*) and (.*)$/, (search, error) => {
    const alertText = browser.$(search).getText();
    expect(alertText).to.include(error);
});

When(/^I fill with (.*) and (.*)$/ , (email, password) => {


    const mailInput = $('input[name="email"]');
    mailInput.click();
    mailInput.keys(email);

    const passwordInput = $('input[name="password"]');
    passwordInput.click();
    passwordInput.keys(password)
});

Then('I expect to see {string}', error => {
    $('.notice.alert.alert-danger').waitForDisplayed(5000);
    const alertText = browser.$('.notice.alert.alert-danger').getText();
    expect(alertText).to.include(error);
});



When('I try to login', () => {
    $('button=Ingresar').click();
});

Then('I expect to not be able to login', () => {
    $('.notice.alert.alert-danger').waitForDisplayed(5000);
});
