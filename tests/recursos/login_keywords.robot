*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Input Username
    [Arguments]    ${username}
    Input Text     name=username   ${username}

Input Password
    [Arguments]    ${password}
    Input Text     name=password   ${password}

Click Login Button
    Click Button   css=input[type="submit"]

Login Should Be Successful
    Element Should Be Visible    xpath=//a[contains(text(),'Log Out')]

Error Message Should Be Visible
    Element Should Be Visible    xpath=//h1[contains(text(),'Error!')]

