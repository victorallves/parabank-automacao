*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open Registration Page
    Go To    https://parabank.parasoft.com/parabank/register.htm

Input Registration Details
    [Arguments]    ${first_name}  ${last_name}  ${address}  ${city}  ${state}  ${zip_code}  ${phone}  ${ssn}  ${username}  ${password}
    Input Text    id=customer.firstName    ${first_name}
    Input Text    id=customer.lastName     ${last_name}
    Input Text    id=customer.address.street    ${address}
    Input Text    id=customer.address.city      ${city}
    Input Text    id=customer.address.state     ${state}
    Input Text    id=customer.address.zipCode   ${zip_code}
    Input Text    id=customer.phoneNumber       ${phone}
    Input Text    id=customer.ssn               ${ssn}
    Input Text    id=customer.username          ${username}
    Input Text    id=customer.password          ${password}
    Input Text    id=repeatedPassword           ${password}
    Sleep    3s
    Click Button  xpath=//input[@type='submit' and @value='Register']

Registration Should Be Successful
    Element Should Be Visible    xpath=//p[contains(text(),'Your account was created successfully. You are now logged in.')]
