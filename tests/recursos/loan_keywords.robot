*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Go To Loan Page
    Go To    https://parabank.parasoft.com/parabank/requestloan.htm

Input Loan Details
    [Arguments]    ${loan_amount}  ${down_payment}  ${from_account}
    Input Text    id=amount    ${loan_amount}
    Input Text    id=downPayment    ${down_payment}
    Select From List By Value   id=fromAccountId  ${from_account}
    Click Button  xpath=//input[@type='button' and @value='Apply Now']

Loan Request Should Be Successful
    Wait Until Element Is Not Visible    xpath=//h1[contains(text(),'Loan Request Processed')]
