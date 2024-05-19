*** Settings ***
Documentation     Testes de login do ParaBank
Resource          ../recursos/login_keywords.robot
Resource          ../paginas/login_page.robot
Resource          ../variaveis/common_variables.robot
Library           SeleniumLibrary

*** Variables ***
${LOGIN_URL}      https://parabank.parasoft.com/parabank/index.htm

*** Test Cases ***
Login com sucesso
    [Documentation]    Testa o login com credenciais válidas
    [Tags]             Login Sucesso
    Open Browser       ${LOGIN_URL}  ${BROWSER}
    Sleep    3s
    login_keywords.Input Username     ${VALID_USERNAME}
    Sleep    3s
    login_keywords.Input Password     ${VALID_PASSWORD}
    Sleep    3s
    login_keywords.Click Login Button
    Sleep    3s
    login_keywords.Login Should Be Successful
    [Teardown]         Close Browser

Login com falha
    [Documentation]    Testa o login com credenciais inválidas
    [Tags]             Login Falha
    Open Browser       ${LOGIN_URL}  ${BROWSER}
    Sleep    3s
    login_keywords.Input Username     ${INVALID_USERNAME}
    Sleep    3s
    login_keywords.Input Password     ${INVALID_PASSWORD}
    Sleep    3s
    login_keywords.Click Login Button
    Sleep    3s
    login_keywords.Error Message Should Be Visible
    [Teardown]         Close Browser
