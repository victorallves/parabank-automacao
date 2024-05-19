*** Settings ***
Library    SeleniumLibrary
Resource   ../variaveis/common_variables.robot

*** Keywords ***
Input Amount
    [Arguments]    ${amount}
    Input Text     id=amount   ${amount}

Select From Account
    [Arguments]    ${from_account}
    Select From List By Value   id=fromAccountId  ${from_account}

Select To Account
    [Arguments]    ${to_account}
    Select From List By Value   id=toAccountId  ${to_account}

Click Transfer Button
    Click Button   css=input[type="submit"]

Transfer Should Be Successful
    Element Should Be Visible    xpath=//h1[contains(text(),'Transfer Complete')]
                                                                                                        
Error Message Should Be Visible
    Element Should Be Visible    xpath=//h1[contains(text(),'Error!')]

Verify Account Values
    Wait Until Element Is Visible    id=fromAccountId
    Wait Until Element Is Visible    id=toAccountId
    
    Select From Account    ${FROM_ACCOUNT}
    Select To Account      ${TO_ACCOUNT}
