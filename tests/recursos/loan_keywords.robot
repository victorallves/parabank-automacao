*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Go To Loan Page
    Go To    https://parabank.parasoft.com/parabank/requestloan.htm

Input Loan Details
    [Arguments]    ${loan_amount}  ${down_payment} 
    Input Text    id=amount    ${loan_amount}
    Input Text    id=downPayment    ${down_payment}
    Click Button  xpath=//input[@type='button' and @value='Apply Now']

Loan Request Should Be Successful
    Wait Until Element Is Visible    xpath=//p[contains(text(),'Congratulations, your loan has been approved.')]
