*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Go To Bill Pay Page
    Go To    https://parabank.parasoft.com/parabank/billpay.htm

Input Bill Pay Details
    [Arguments]    ${payee_name}  ${address}  ${city}  ${state}  ${zip_code}  ${phone}  ${account}  ${amount}  ${from_account}
    Input Text    css=input[name='payee.name']                    ${payee_name}
    Input Text    css=input[name='payee.address.street']          ${address}
    Input Text    css=input[name='payee.address.city']            ${city}
    Input Text    css=input[name='payee.address.state']           ${state}
    Input Text    css=input[name='payee.address.zipCode']         ${zip_code}
    Input Text    css=input[name='payee.phoneNumber']             ${phone}
    Input Text    css=input[name='payee.accountNumber']           ${account}
    Input Text    css=input[name='verifyAccount']                 ${account}
    Input Text    css=input[name='amount']                        ${amount}
    Select From List By Value   css=select[name='fromAccountId']  ${from_account}
    Click Button  xpath=//input[@type='button' and @value='Send Payment']

Bill Pay Should Be Successful
    Element Should Be Visible    xpath=//h1[contains(text(),'Bill Payment Complete')]

