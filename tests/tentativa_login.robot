*** Settings ***
Documentation    Testes de tentativa de login com dados inválidos
Resource         ../resources/main.resource
Test Setup       Abrir Navegador
Test Teardown    Fechar Navegador
Test Template    Tentativa de Login

*** Test Cases ***     USUARIO            SENHA           MENSAGEM_ESPERADA
Login com Usuario Bloqueado        locked_out_user    secret_sauce    Epic sadface: Sorry, this user has been locked out.
Login com Usuario Vazio        ${EMPTY}    secret_sauce    Epic sadface: Username is required
Login com Senha Invalida           standard_user      senha_errada    Epic sadface: Username and password do not match any user in this service
Login com Senha Vazia           standard_user      ${EMPTY}    Epic sadface: Password is required
Login com Usuario Inexistente      usuario_errado       secret_sauce    Epic sadface: Username and password do not match any user in this service

*** Keywords ***
Tentativa de Login
    [Arguments]    ${usuario}    ${senha}    ${mensagem_erro}
    Fazer Login    ${usuario}    ${senha}
    Validar Mensagem de Erro Login    ${mensagem_erro}