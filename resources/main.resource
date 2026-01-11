*** Settings ***
Library    SeleniumLibrary

### Importando as Pages ###
Resource   pages/login.resource
Resource   pages/loja.resource

*** Variables ***
${URL}          https://www.saucedemo.com
${BROWSER}      chrome

*** Keywords ***
Abrir Navegador
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Implicit Wait    5

Fechar Navegador
    Capture Page Screenshot
    Close Browser