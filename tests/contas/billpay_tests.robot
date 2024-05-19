*** Settings ***
Documentation     Testes de pagamento de contas do ParaBank
Resource          ../recursos/login_keywords.robot
Resource          ../recursos/billpay_keywords.robot
Resource          ../variaveis/common_variables.robot
Library           SeleniumLibrary

*** Variables ***
${LOGIN_URL}      https://parabank.parasoft.com/parabank/index.htm

*** Test Cases ***
Pagamento de conta com sucesso
    [Documentation]    Testa o pagamento de uma conta com valores válidos
    [Tags]             BillPay Sucesso
    Open Browser       ${LOGIN_URL}  ${BROWSER}
    login_keywords.Input Username     ${VALID_USERNAME}
    login_keywords.Input Password     ${VALID_PASSWORD}
    login_keywords.Click Login Button
    login_keywords.Login Should Be Successful
    Sleep    3s
    billpay_keywords.Go To Bill Pay Page
    billpay_keywords.Input Bill Pay Details  Payee  123 Street  City  State  12345  555-1234  987654321  100  ${FROM_ACCOUNT}
    Sleep    3s
    billpay_keywords.Bill Pay Should Be Successful
