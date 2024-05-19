*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${TRANSFER_BUTTON}      css=input[type="submit"]
${SUCCESS_MESSAGE}      xpath=//h1[contains(text(),'Transfer Complete')]
${ERROR_MESSAGE}        xpath=//span[contains(text(),'error')]
${AMOUNT_FIELD}         id=amount
${FROM_ACCOUNT_FIELD}   id=fromAccountId
${TO_ACCOUNT_FIELD}     id=toAccountId
