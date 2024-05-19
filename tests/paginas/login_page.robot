*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_BUTTON}        css=input[type="submit"]
${SUCCESS_MESSAGE}     xpath=//a[contains(text(),'Log Out')]
${ERROR_MESSAGE}       xpath=//p[contains(text(),'error')]
${USERNAME_FIELD}      name=username
${PASSWORD_FIELD}      name=password
