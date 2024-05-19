*** Settings ***
Documentation     Testes de transferência de fundos do ParaBank
Resource          ../recursos/login_keywords.robot
Resource          ../recursos/transfer_keywords.robot
Resource          ../paginas/login_page.robot
Resource          ../paginas/transfer_page.robot
Resource          ../variaveis/common_variables.robot
Library           SeleniumLibrary

*** Variables ***
${LOGIN_URL}      https://parabank.parasoft.com/parabank/index.htm
${TRANSFER_URL}   https://parabank.parasoft.com/parabank/transfer.htm

*** Test Cases ***

Transferência com sucesso
    [Documentation]    Testa a transferência de fundos com valores validos
    [Tags]             Transfererencia sucesso
    Open Browser       ${LOGIN_URL}  ${BROWSER}
    login_keywords.Input Username     ${VALID_USERNAME}
    login_keywords.Input Password     ${VALID_PASSWORD}
    login_keywords.Click Login Button
    login_keywords.Login Should Be Successful
    Go To              ${TRANSFER_URL}
    Sleep    3s
    transfer_keywords.Verify Account Values
    Sleep    3s
    transfer_keywords.Input Amount       ${TRANSFER_AMOUNT}
    Sleep    3s
    transfer_keywords.Select From Account    ${FROM_ACCOUNT}
    Sleep    3s
    transfer_keywords.Select To Account      ${TO_ACCOUNT}
    Sleep    3s
    transfer_keywords.Click Transfer Button
    Sleep    3s
    transfer_keywords.Transfer Should Be Successful
    [Teardown]         Close Browser


Transferência com falha
    [Documentation]    Testa a transferência de fundos com valores invalidos
    [Tags]             Transfererencia falha
    Open Browser       ${LOGIN_URL}  ${BROWSER}
    login_keywords.Input Username     ${VALID_USERNAME}
    login_keywords.Input Password     ${VALID_PASSWORD}
    login_keywords.Click Login Button
    login_keywords.Login Should Be Successful
    Go To              ${TRANSFER_URL}
    Sleep    3s
    transfer_keywords.Verify Account Values
    Sleep    3s
    transfer_keywords.Input Amount       ${INVALID_AMOUNT}
    Sleep    3s
    transfer_keywords.Select From Account    ${FROM_ACCOUNT}
    Sleep    3s
    transfer_keywords.Select To Account      ${TO_ACCOUNT}
    Sleep    3s
    transfer_keywords.Click Transfer Button
    Sleep    3s
    transfer_keywords.Error Message Should Be Visible
    [Teardown]         Close Browser