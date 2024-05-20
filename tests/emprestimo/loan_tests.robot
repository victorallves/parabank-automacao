*** Settings ***
Documentation     Testes de solicitação de empréstimo do ParaBank
Resource          ../recursos/login_keywords.robot
Resource          ../recursos/loan_keywords.robot
Resource          ../variaveis/common_variables.robot
Library           SeleniumLibrary

*** Variables ***
${LOGIN_URL}      https://parabank.parasoft.com/parabank/index.htm

*** Test Cases ***
Solicitação de empréstimo com sucesso
    [Documentation]    Testa a solicitação de empréstimo com valores válidos
    [Tags]             Loan com Sucesso
    Open Browser       ${LOGIN_URL}  ${BROWSER}
    login_keywords.Input Username     ${VALID_NEW_ACCOUNT}
    login_keywords.Input Password     ${VALID_NEW_PASSWORD}
    login_keywords.Click Login Button
    login_keywords.Login Should Be Successful
    loan_keywords.Go To Loan Page
    Sleep    3s
    loan_keywords.Input Loan Details  1000  100 
    Sleep    3s
    loan_keywords.Loan Request Should Be Successful
    [Teardown]         Close Browser
 