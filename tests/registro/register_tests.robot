*** Settings ***
Documentation     Testes de registro do ParaBank
Resource          ../recursos/register_keywords.robot
Resource          ../variaveis/common_variables.robot
Library           SeleniumLibrary

*** Variables ***
${REGISTER_URL}   https://parabank.parasoft.com/parabank/register.htm

*** Test Cases ***
Registro com sucesso
    [Documentation]    Testa o registro de um novo usuário com detalhes válidos
    [Tags]             Registro com Sucesso
    Open Browser       ${REGISTER_URL}  ${BROWSER}
    register_keywords.Input Registration Details  jose  vilela  123 Street  City  State  12345  555-1234  123-45-6789  josep  1234
    Sleep    3s
    register_keywords.Registration Should Be Successful
    [Teardown]         Close Browser
