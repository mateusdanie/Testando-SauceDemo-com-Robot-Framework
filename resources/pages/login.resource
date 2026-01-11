*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${INPUT_USER}      //input[contains(@placeholder,'Username')]
${INPUT_PASS}      //input[contains(@placeholder,'Password')]
${BTN_LOGIN}       //input[contains(@type,'submit')]

*** Keywords ***
Fazer Login
    [Arguments]    ${usuario}    ${senha}
    Input Text     ${INPUT_USER}    ${usuario}
    Input Text     ${INPUT_PASS}    ${senha}
    Click Button   ${BTN_LOGIN}

Validar Mensagem de Erro Login
    [Arguments]    ${mensagem_esperada}
    Page Should Contain Element    //h3[@data-test='error'][contains(.,'${mensagem_esperada}')]